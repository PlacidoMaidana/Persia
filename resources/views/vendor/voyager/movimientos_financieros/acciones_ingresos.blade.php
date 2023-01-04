<td class="no-sort no-click bread-actions">
    <a href="{{url('/admin/movimientos_financieros/'.$id.'/ingresos')}}" class="btn btn-primary"> <i class="voyager-search"></i> Editar </a> 
    <a href="{{url('/admin/mov-financieros/'.$id.'/recibo_cobranza')}}" class="btn btn-primary" > <i class="voyager-search"></i>Recibo</a>
    {{--<a href="{{url('/admin/mov-financieros/'.$id.'/edit_cobranzas')}}" > <i class="voyager-search"></i>Editar: {{$detalle}} </a>--}}
                                                                                                                                                                       
    <a href="javascript:;" title="Delete" class="btn btn-sm btn-danger pull-right delete pato" onclick="borrar({{$id}})" data-id="{{$id}}" id="delete-{{$id}}">
    <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Delete</span>
    </a> 
                                       
</td>
