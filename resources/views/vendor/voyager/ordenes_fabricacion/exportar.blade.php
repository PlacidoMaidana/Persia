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
    
    <h2>ORDEN DE FABRICACION NRO: {{$datosOrden->id}} </h2>
    <hr />
    Fecha: {{$datosOrden->fecha}} <br> 
    Cliente: {{$datosOrden->nombre}}<br>    
    Pedido Nro: {{$datosOrden->id_pedido}} <br>
    Producto: {{$datosOrden->descripcion}} <br>
    Cantidad: {{$datosOrden->cantidad}} mt2<br>
    
     

    <hr style="color: rgb(84, 83, 83); background-color: rgb(101, 100, 100); width:100% higth:2px ;" />
    BASE
    <table class="table">
     
        <tbody>
            <thead >
                <tr>
                  <th scope="col">Insumo</th>
                  <th scope="col">Cantidad</th>
                  <th scope="col">Unidad</th>
                </tr>
              </thead>
              @foreach($detallesbase as $p)
              <tr >
                  <td> {{ $p->descripcion }}</td>
                  <td> {{ $p->cantidad }}</td>
                  <td> {{ $p->unidad }}</td>
              </tr>
                  
              @endforeach

        </tbody>
    </table>
LISTONES
    <table class="table">
      <tbody>
          <thead >
              <tr>
                
                <th scope="col">Insumo</th>
                <th scope="col">Unidad</th>
                <th scope="col">Cantidad liston 1</th>
                <th scope="col">Cantidad liston 2</th>
                <th scope="col">Cantidad liston 3</th>
                
              </tr>
            </thead>
            @foreach($detalleslistones as $l)
            <tr >
                
                <td> {{ $l->descripcion }}</td>
                <td> {{ $l->unidad }}</td>
                <td> {{ $l->liston_1 }}</td>
                <td> {{ $l->liston_2 }}</td>
                <td> {{ $l->liston_3 }}</td>
                
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