<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/grid2.css">
    <title>Remito</title>
    <style>
		table {
			border:1px solid #b3adad;
			border-collapse:collapse;
			padding:5px;
		}
		table th {
			border:1px solid #b3adad;
			padding:5px;
			background: #f0f0f0;
			color: #313030;
		}
		table td {
			border:1px solid #b3adad;
			text-align:center;
			padding:5px;
			background: #ffffff;
			color: #313030;
		}
	</style>

</head>
<body>
    
    {{-- <img class="img-responsive" 
    src="{{asset("images\cabeza.jpg")}}"  alt=""> --}}

    <div class="container">

      <div class="filas">
          <div class="cabeza">
          </div>
          <div class="cuerpo">
            <h1>REMITO</h1> 
            <h3>Numero Remito: {{$datosPedidos->nro_remito}}</h3>
            <h3>Fecha: {{$datosPedidos->fecha_entrega}} </h3> 
            <h3>Cliente: {{$datosPedidos->nombre}}</h3> 
            <br>
            <hr />
            <br>
            Pedido Nro: {{$datosPedidos->id_pedido}} <br>
            Estado: {{$datosPedidos->estado}} <br>  
            <br>  
            <hr style="color: rgb(84, 83, 83); background-color: rgb(101, 100, 100); width:100% higth:2px ;" />
            <table class="table">
              <tbody>
                  <thead >
                      <tr>
                        <th scope="col">id producto</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Cantidad</th>
                        <th scope="col">Unidad</th>
                      </tr>
                    </thead>
                    @foreach($detallesPedidos as $p)
                    <tr >
                        <td> {{ $p->id_producto }}</td>
                        <td> {{ $p->descripcion }}</td>
                        <td> {{ $p->cantidad }}</td>
                        <td> {{ $p->unidad }}</td>
                
                    </tr>
                        
                    @endforeach
          </tbody>
          </table>
          </div>
          <div class="pie"> 
          </div>
      </div>
      </div>
      





    <img class="img-responsive" 
    src="{{public_path("images/cabeza.jpg")}}" width="70%" alt="">
    

    <hr style="color: rgb(84, 83, 83); background-color: rgb(101, 100, 100); width:100% higth:2px ;" />

    
    
   
    
</body>

</html>