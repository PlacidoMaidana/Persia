<?php

namespace App\Http\Livewire;

use Illuminate\Database\Eloquent\Builder;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;
use App\Models\Producto;

class ProductoTable extends DataTableComponent
{

    public function columns(): array
    {
        return [
            Column::make('descripcion')
                ->sortable()
                ->searchable(),
            Column::make('rubro', 'rubro_id')
                ->sortable(),
               
            Column::make('subrubro', 'subrubro_id')
                ->sortable(),
            
        ];
    }

    public function query(): Builder
    {
        return Producto::query();
    }

    public function rowView(): string
    {
        return 'livewire-tables.rows.producto_table';
    }
}
