<?php

namespace App\Http\Livewire\Productos;

use Livewire\Component;
use App\Models\Producto;//  as ModelsProducto;
use App\Models\User;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\View\Component as ViewComponent;
use PhpParser\Node\Expr\Empty_;
use Rappasoft\LaravelLivewireTables\DataTableComponent;
use Rappasoft\LaravelLivewireTables\Views\Column;


class SeleccionarComponent extends DataTableComponent
{
    /*public function render()
    {
        return view('livewire.productos.seleccionar-component');
    }*/

    public function columns(): array
    {
        return [
            Column::make('descripcion')
                ->sortable()
                ->addClass('hidden md:table-cell')
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

    public function getTableRowUrl($row) :  ?string
    {
        if ($row->type === 'this') {
            return '_blank';
        }
       
        //return view('livewire.pedidos.embebido-component',['id' => $row['id'],'detalles'=>[]]);
        return "/vista?id=".$row['id'];
      
    }

}
