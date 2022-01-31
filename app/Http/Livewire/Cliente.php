<?php

namespace App\Http\Livewire;

use App\Models\Cliente  as ModelsCliente;
use App\Models\User;
use Livewire\Component;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\View\Component as ViewComponent;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;

class Cliente  extends  DataTableComponent // Component 
{
    // public function render()
    // {
    //     $Clientes =ModelsCliente::all();
    //     return view('livewire.cliente',compact('Clientes'))
    //     ->extends('layouts.app')
    //     ->section('content');
    // }

    public function columns(): array
    {
        return [
            Column::make('name')
                ->sortable()
                ->searchable(),
            Column::make('email', 'email')
                ->sortable()
                ->searchable(),
            Column::make('Verified', 'email_verified_at')
                ->sortable(),
        ];
    }

    public function query(): Builder
    {
        return User::query();
    }
}
