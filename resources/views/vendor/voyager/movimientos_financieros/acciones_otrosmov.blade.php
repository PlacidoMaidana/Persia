<td class="no-sort no-click bread-actions">
    <a href="{{url('/admin/movimientos_financieros/'.$id.'/edit_otrosmov')}}" > <i class="voyager-search"></i>Editar: {{$detalle}} </a>
                                                                                                                                                                     
    <a href="javascript:;" title="Delete" class="btn btn-sm btn-danger pull-right delete pato" onclick="borrar({{$id}})" data-id="{{$id}}" id="delete-{{$id}}">
    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
    </a> 
                                       
</td>
