param(
    [string]$SourceRepo = "C:\wamp64\www\persia",
    [string]$MirrorRepo = "C:\wamp64\www\persia-sync",
    [string]$Branch = "pato",
    [string]$CommitMessage = "sync local to pato",
    [switch]$IncludeDbBackup,
    [switch]$SkipPull
)

$ErrorActionPreference = "Stop"

function Write-Step {
    param([string]$Message)
    Write-Host "[sync-pato] $Message" -ForegroundColor Cyan
}

function Get-EnvValue {
    param(
        [string]$EnvFile,
        [string]$Key
    )

    $line = Get-Content $EnvFile | Where-Object { $_ -match "^$Key=" } | Select-Object -First 1
    if (-not $line) {
        return ""
    }

    $value = $line.Substring($Key.Length + 1)
    return $value.Trim('"')
}

function Resolve-MySqlDump {
    $cmd = Get-Command mysqldump -ErrorAction SilentlyContinue
    if ($cmd) {
        return $cmd.Source
    }

    $wampDefault = "C:\wamp64\bin\mysql"
    if (Test-Path $wampDefault) {
        $found = Get-ChildItem $wampDefault -Recurse -Filter mysqldump.exe -ErrorAction SilentlyContinue |
            Sort-Object FullName -Descending |
            Select-Object -First 1
        if ($found) {
            return $found.FullName
        }
    }

    throw "No se encontro mysqldump en PATH ni en C:\wamp64\bin\mysql"
}

if (-not (Test-Path $SourceRepo)) {
    throw "No existe la carpeta source: $SourceRepo"
}
if (-not (Test-Path $MirrorRepo)) {
    throw "No existe la carpeta mirror: $MirrorRepo"
}
if (-not (Test-Path (Join-Path $MirrorRepo ".git"))) {
    throw "La carpeta mirror no es un repo git: $MirrorRepo"
}

Write-Step "Cambiar a mirror repo"
Set-Location $MirrorRepo

Write-Step "Checkout rama $Branch"
& git checkout $Branch | Out-Null

if (-not $SkipPull) {
    Write-Step "Actualizar rama remota"
    & git pull --rebase origin $Branch
}

Write-Step "Sincronizar archivos desde local"
$robocopyArgs = @(
    $SourceRepo,
    $MirrorRepo,
    "/MIR",
    "/XD", ".git", "vendor", "node_modules", "storage\framework\cache", "storage\framework\sessions", "storage\framework\views", "storage\logs",
    "/XF", ".env"
)

& robocopy @robocopyArgs | Out-Null
$robocopyExit = $LASTEXITCODE
if ($robocopyExit -ge 8) {
    throw "Robocopy fallo con codigo $robocopyExit"
}

if ($IncludeDbBackup) {
    Write-Step "Generar backup SQL"

    $envFile = Join-Path $SourceRepo ".env"
    if (-not (Test-Path $envFile)) {
        throw "No existe archivo .env en source"
    }

    $dbHost = Get-EnvValue -EnvFile $envFile -Key "DB_HOST"
    $dbPort = Get-EnvValue -EnvFile $envFile -Key "DB_PORT"
    $dbName = Get-EnvValue -EnvFile $envFile -Key "DB_DATABASE"
    $dbUser = Get-EnvValue -EnvFile $envFile -Key "DB_USERNAME"
    $dbPass = Get-EnvValue -EnvFile $envFile -Key "DB_PASSWORD"

    if (-not $dbHost) { $dbHost = "127.0.0.1" }
    if (-not $dbPort) { $dbPort = "3306" }

    if (-not $dbName -or -not $dbUser) {
        throw "DB_DATABASE o DB_USERNAME vacios en .env"
    }

    $dumpExe = Resolve-MySqlDump
    $backupDir = Join-Path $MirrorRepo "database\backups"
    New-Item -ItemType Directory -Force -Path $backupDir | Out-Null

    $ts = Get-Date -Format "yyyyMMdd-HHmm"
    $dumpPath = Join-Path $backupDir "produccion-backup-$ts.sql"

    $env:MYSQL_PWD = $dbPass
    & $dumpExe --column-statistics=0 -h $dbHost -P $dbPort -u $dbUser --single-transaction --routines --triggers --databases $dbName --result-file=$dumpPath
    $dumpExit = $LASTEXITCODE
    Remove-Item Env:MYSQL_PWD -ErrorAction SilentlyContinue

    if ($dumpExit -ne 0) {
        throw "mysqldump fallo con codigo $dumpExit"
    }

    Write-Step "Backup creado en $dumpPath"
}

Write-Step "Agregar cambios"
& git add -A

$pending = & git status --porcelain
if (-not $pending) {
    Write-Step "Sin cambios para commitear"
    exit 0
}

Write-Step "Commit"
& git commit -m $CommitMessage

Write-Step "Push origin/$Branch"
& git push origin $Branch

Write-Step "Listo"
