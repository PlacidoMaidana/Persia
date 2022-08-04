

<td class="no-sort no-click bread-actions">
    <a href="{{url('/admin/productos/'.$id_producto.'/editrevta')}}" > <i class="voyager-search"></i>Editar: {{$descripcion}} </a>
                                                                                        
    <a href="javascript:;" title="Delete" class="btn btn-sm btn-danger pull-right delete pato" onclick="borrar({{$id_producto}})" data-id="{{$id_producto}}" id="delete-{{$id_producto}}">
    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
    </a> 
                                       
</td>


