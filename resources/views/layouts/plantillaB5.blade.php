<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    
     <!-- Bootstrap CSS -->
     <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.min.css">
    <title>Hello, world!</title>
    @livewireStyles
  </head>
  <body>
    <h1>Hello, world!</h1>

     @yield('content') 
    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
    @livewireScripts
     <!-- jQuery -->
   <script src="//code.jquery.com/jquery.js"></script>
   <!-- DataTables -->
   <script src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>
   <!-- Bootstrap JavaScript -->
   <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
   <!-- App scripts -->
   @stack('scripts')

  <script>
  $('#productos_buscar').on('click',function(){
    // $('#productos').modal({show:true});
     $('#x34').load("{{url('/tabla_productos_elegir')}}",function(){
         $('#productos').modal({show:true});
        });
  });
 </script> 

{{-- <script>
  $('#productos_buscar').on('click',function(){
     $('#x34').load('http://127.0.0.1/persia/public/tabla_productos_elegir',function(){
         $('#productos').modal('show');
     });
 });
 </script> --}}

  </body>
</html>

