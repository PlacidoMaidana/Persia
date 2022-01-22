
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Seleccionar producto</title>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.6/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/responsive/2.2.6/js/responsive.bootstrap4.min.js"></script>
    

</head>
<body>
    {{-- <h1>Seleccionar producto</h1> --}}
   

<table id="example" class="table table-striped table-bordered dt-responsive nowrap" style="width:100%">
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






    <!-- Scripts -->
   

    <script>
        $(document).ready(function() {
            $('#example').dataTable( {
                 "serverSide": true,
                 "ajax":"{{url('/productos_elegir')}}",
                 "columns":[
                         {data:'id' } ,
                         {data:'descripcion' } ,
                         {data:'rubro' } ,
                         {data:'descripcion_subrubro' } ,
                         {data:'preciovta' } ,
                         {data:'seleccionar' },                             
                          ]           
            } );
        } );


     </script> 

    <script>
        function elejir(id,nombre) {
           alert(nombre);
           //asignarinterno(id,nombre,apellido,pabellon);
        }
    </script>

</body>
</html>
