
 <td class="no-sort no-click bread-actions">
                                                                                        
<a href="javascript:;" title="Delete" class="btn btn-sm btn-danger pull-right delete pato" onclick="borrar({{$id}})" data-id="{{$id}}" id="delete-{{$id}}">
<i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
</a> 
                                                    
                                                                                                                                            
<a href="{{url('admin/facturas-compras/'.$id.'/edit')}}" title="Edit" class="btn btn-sm btn-primary pull-right edit">
<i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Edit</span>
</a>
 {{--                                                    
<a href="{{url('admin/nota-pedidos/'.$id_pedido)}}" title="View" class="btn btn-sm btn-warning pull-right view">
<i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">View</span>
</a> 
--}}
                                             
</td>