
 <td class="no-sort no-click bread-actions">
 {{--
    <a href="{{url('/admin/ordenes_fabricacion/'.$id_orden_fabricacion.'/edit')}}" > <i class="voyager-search"></i> {{$descripcion}} </a>
<a href="{{url('/pagar_pedidos/'.$id_pedido)}}" > <i class="voyager-check"></i> Pagar {{$id_pedido}}</a> --}}
 {{-- aqui podriamos cargar la informacion requerida para la creacion del movimiento financiero a variables de session --}}
{{--

<a href="javascript:;" title="Delete" class="btn btn-sm btn-danger pull-right delete pato" onclick="borrar({{$id_orden_fabricacion}})" data-id="{{$id_orden_fabricacion}}" id="delete-{{$id_orden_fabricacion}}">
<i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
</a> --}}
                                                    
                                                                                                                                            
<a href="{{url('admin/ordenes_fabricacion/'.$id.'/edit')}}" title="Edit" class="btn btn-sm btn-primary pull-right edit">
<i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
</a>

<a href="{{url('ordenes_fabricacion/export/'.$id)}}" class="btn btn-primary" > <i class="voyager-search"></i>Imprime Orden</a>
                                                    
    {{-- <a href="http://127.0.0.1:8000/admin/nota-pedidos/3" title="View" class="btn btn-sm btn-warning pull-right view">
<i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">View</span>
</a> --}}
                                             
</td>