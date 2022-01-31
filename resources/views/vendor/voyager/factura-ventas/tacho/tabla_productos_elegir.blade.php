
@extends('layouts.tablas')

@section('modal_elejir')
<div class="card" style="min-width: 70%">
    <img class="card-img-top" src="holder.js/100x180/" alt="">
    <div class="card-body">
        <h4 class="card-title">Productos</h4>
        <table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:60%">
            <thead>
              <tr>
                  <th>id</th>
                  <th>descripcion</th>
                  <th>rubro</th>
                  <th>subrubro</th>
                  <th>preciovta</th>
                  <th>seleccionar</th>
                
              </tr>
             </thead>
        
            </table>
        
        
    </div>
</div>
@stop

@push('scripts')


<script>
    $(document).ready(function() {
        $('#example').dataTable( {
             "serverSide": true,
             "ajax":"{{url('/productos_elegir')}}",                
             "columns":[
                     {data: 'id', name: 'productos.id', width: '50px'},
                     {data: 'descripcion', name: 'productos.descripcion', width: '205px'},
                     {data: 'rubro', name: 'r.rubro', width: '30px'},
                     {data: 'subrubro', name: 's.descripcion_subrubro', width: '205px'},
                     {data: 'preciovta', name: 'productos.preciovta', width: '205px'},
                     {data: 'seleccionar', name: 'seleccionar', width: '150px'},
                                              
                      ]           
        } );
    } );


 </script> 


<script>
    function elegir(id,nom,precio)
    {     
    $("#nombre_producto").val(nom);
    $("#id_producto").val(id);
    $("#precio").val(precio);
    //$('#productos').modal('hide');
   
    }
</script>
@endpush

