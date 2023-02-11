<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/grid2.css">
    <title>Presupuesto</title>
    
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
          @php
              $date =Carbon\Carbon::createFromDate($datosPedidos->fecha)->format('Y-m-d');
          @endphp
          <div class="cuerpo">
               <h1>PRESUPUESTO</h1> 
               {{-- <h3>Fecha: {{$datosPedidos->fecha}} </h3>  --}}
               <h3>Fecha: {{$date}} </h3> 
               <h3>Cliente: {{$datosPedidos->nombre}}</h3> 
               <br>
               <hr />
               <br>
               Pedido Nro: {{$datosPedidos->id_pedido}} <br>
               Estado: {{$datosPedidos->estado}} <br>  
               <br>  
               <hr style="color: rgb(84, 83, 83); background-color: rgb(101, 100, 100); width:100% higth:2px ;" />
               Sr/:  <br>
               Por medio de la presente le envió el presupuesto solicitado.		<br>
               <table class="table" >
                   <tbody>
                       <thead >
                           <tr>
                             <th scope="col">Subrubro</th>
                             <th scope="col">Descripcion</th>
                             <th scope="col">Cantidad</th>
                             <th scope="col">Unidad</th>
                             <th scope="col">Precio Unitario</th>
                             <th scope="col">Total linea</th>
                           </tr>
                         </thead>
               @foreach($detallesPedidos as $p)
               <tr >
                   <td> {{ $p->subrubro }}</td>
                   <td> {{ $p->descripcion }}</td>
                   <td> {{ $p->cantidad }}</td>
                   <td> {{ $p->unidad }}</td>
                   <td> $ {{ number_format($p->punit,2) }} </td>
                   <td> $ {{ number_format($p->total_linea,2) }}</td>


               </tr>

               @endforeach
             
               </tbody>
               </table>
               <br>
               <h4  style='text-align:right'>
               
                 Total gravado: $ {{number_format($datosPedidos->totalgravado, 2, '.', ',')}} <br>
                 Monto Recargo o Descuento (+/-) :  $ {{number_format($datosPedidos->montodescuento, 2, '.', ',')}}  <br>
                 Gravado con descuento/recargo: $ {{number_format($datosPedidos->gravadocondescuento, 2, '.', ',')}} <br>
                 IVA 21: $ {{number_format($datosPedidos->monto_iva, 2, '.', ',')}}  <br>
                 Total con IVA: $ {{number_format($datosPedidos->totalconiva, 2, '.', ',')}}  <br>
                 <br>
               </h4>
               {{-- 
               Total sin IVA: {{$datosPedidos->totalgravado}} <br>
               Descuento: {{$datosPedidos->descuento}} <br>
               IVA: {{$datosPedidos->monto_iva}} <br>
               Total general: {{$datosPedidos->total}} <br>
               <br>
               --}}

               <hr />
               <br>
               <p>


               OBSERVACIONES:     {{$datosPedidos->observaciones}}
               <br>
               <br>
               <hr />
               <br>
               FORMA DE PAGO: {{$texto->Forma_pago_Productos}} <br>
              


               </p>
               
              

          </div>
          <div class="pie"></div>
      </div>
      </div>


    
</body>

</html>