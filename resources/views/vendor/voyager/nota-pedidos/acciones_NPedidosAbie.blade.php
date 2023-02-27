
 <td class="no-sort no-click bread-actions">
<a href="{{url('/admin/clientes/'.$id_cliente.'/edit')}}" class=" btn  btn-primary "> Cliente </a>
{{--<a href="{{url('/pagar_pedidos/'.$id_pedido)}}" > <i class="voyager-check"></i>  Pagar {{$id_pedido}} </a>
  aqui podriamos cargar la informacion requerida para la creacion del movimiento financiero a variables de session --}}
                                                                                        
<a href="javascript:;" title="Delete" class="btn btn-sm btn-danger delete pato" onclick="borrar({{$id_pedido}})" data-id="{{$id_pedido}}" id="delete-{{$id_pedido}}">
<i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
</a> 
                                                                                                                                                                                              
<a href="{{url('admin/nota-pedidos/'.$id_pedido.'/edit')}}" title="Edit" class="btn btn-sm btn-primary  edit">
<i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
</a>

<a href="{{url('/pedidos/export/'.$id_pedido)}}" title="Presupuesto" class="btn btn-primary ">Presupuesto</a>
<a href="{{url('/CobranzasPedido/'.$id_pedido)}}" class="btn btn-primary ">Cobranzas</a>

</td>