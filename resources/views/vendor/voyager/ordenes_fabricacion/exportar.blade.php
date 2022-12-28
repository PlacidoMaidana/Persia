<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    
    <title>Orden de Fabricacion</title>
    
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

    <img class="img-responsive" 
    src="{{public_path("images/cabeza.jpg")}}" width="70%" alt="">
    <h2>ORDEN DE FABRICACION</h2> 
    <h3>Fecha: {{$datosOrden->fecha}} </h3> 
    <h3>Cliente: {{$datosOrden->nombre}}</h3> 
    <hr />
    
    Pedido Nro: {{$datosOrden->id_orden}} <br>
    Producto: {{$datosOrden->descripcion}} <br>
    Cantidad: {{$datosOrden->cantidad}} mt2<br>
    Estado: {{$datosOrden->estado}} <br>  
     

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
    @foreach($detallesOrden as $p)
    <tr >
        <td> {{ $p->id_producto }}</td>
        <td> {{ $p->descripcion }}</td>
        <td> {{ $p->cantidad }}</td>
        <td> {{ $p->unidad }}</td>
        

    </tr>
        
    @endforeach

    </tbody>
    </table>
    <br>
   {{-- 
    Total sin IVA: {{$datosPedidos->totalgravado}} <br>
    IVA: {{$datosPedidos->monto_iva}} <br>
    Descuento: {{$datosPedidos->descuento}} <br>
    Total general: {{$datosPedidos->total}} <br>
    
    <br>
    <hr />
    <br>
    Observaciones: {{$datosPedidos->observaciones}} <br>
    <br>
    <hr />
    <br>
    Forma pago: {{$texto->Forma_pago_Productos}} <br>

    <img class="img-responsive" 
    src="{{public_path("images/cabeza.jpg")}}" width="70%" alt="">
    --}}
  
</body>

</html>