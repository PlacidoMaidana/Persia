

<td class="no-sort no-click bread-actions">
    <a href="{{url('/admin/movimientos_financieros/'.$id_movimiento.'/ingresos')}}" > <i class="voyager-search"></i>Editar: {{$detalle}} </a>
                                                                                        
    <a href="javascript:;" title="Delete" class="btn btn-sm btn-danger pull-right delete pato" onclick="borrar({{$id_movimiento}})" data-id="{{$id_movimiento}}" id="delete-{{$id_movimiento}}">
    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
    </a> 
                                       
</td>


