
 <td class="no-sort no-click bread-actions">
<a href="#" > <i class="voyager-check"></i> pagar {{$id_pedido}}</a>
<a href="#" > <i class="voyager-check"></i> cliente {{$nombre}}</a>
                                           
                                                                                        
<a href="javascript:;" title="Delete" class="btn btn-sm btn-danger pull-right delete pato" onclick="borrar({{$id_pedido}})" data-id="{{$id_pedido}}" id="delete-{{$id_pedido}}">
<i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
</a> 
                                                    
                                                                                                                                            
<a href="{{url('admin/nota-pedidos/'.$id_pedido.'/edit')}}" title="Edit" class="btn btn-sm btn-primary pull-right edit">
<i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
</a>
                                                    
    {{-- <a href="http://127.0.0.1:8000/admin/nota-pedidos/3" title="View" class="btn btn-sm btn-warning pull-right view">
<i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">View</span>
</a> --}}
                                             
</td>