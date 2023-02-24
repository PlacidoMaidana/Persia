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
			/* background: #f0f0f0; */
			color: #313030;
		}
		table td {
			border:1px solid #b3adad;
			text-align:center;
			padding:5px;
			/* background: #ffffff; */
			color: #313030;
		}
    .right {
    padding-top: 10px;
    padding-left: 197px;
    margin-left: 10px;
    position: relative;
    float: left;
    /* width: 45%; */
    /* border: steelblue solid 1px; */
    height: auto;
}

    .caja{
      border:1px solid black;
      /* background-color: #ffffff;      */
      text-align:right;
      /*grid-template-columns: reapeat(auto-fill,minimax(15rem,1fr));*/
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
                    

     {{-- grilla --}}
            <div class="caja " style="height:210px;">
                  <table class="table" style="width:100%;"  >
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
                   <td> ${{ number_format($p->punit,2) }}</td>
                   <td> ${{ number_format($p->total_linea,2) }}</td>
                  </tr>
                  @endforeach             
               </tbody>
               </table>
              </div>















   {{-- Totales --}}
       <div class="caja " style="height:200px;">
        <br>
        
        <table class="right" style="border:1px text-align:right;
        font-family: Tahoma, Verdana, Segoe, sans-serif;
        font-size: 14px; 
        font-style: normal;">
          <tbody>
            <tr>
              <td style="text-align:right;">Total gravado:$</td><td style="text-align:right;"> {{number_format($datosPedidos->totalgravado, 2, '.', ',')}}</td>
            </tr>
            <tr>
              <td style="text-align:right;">Monto Recargo o Descuento (+/-) :$</td><td style="text-align:right;">{{number_format($datosPedidos->montodescuento, 2, '.', ',')}}</td>
            </tr>
            <tr>
              <td style="text-align:right;">Gravado con descuento/recargo:$</td><td style="text-align:right;">{{number_format($datosPedidos->gravadocondescuento, 2, '.', ',')}}</td>
            </tr>
            <tr >
              <td style="text-align:right;">IVA 21:$</td><td style="text-align:right;"> {{number_format($datosPedidos->monto_iva, 2, '.', ',')}}  </td>
            </tr>
            <tr>
              <td style="text-align:right;">Total con IVA:$</td><td style="text-align:right;">{{number_format($datosPedidos->totalconiva, 2, '.', ',')}}</td>
            </tr>
            
          </tbody>
        </table>
          
             
        
       </div>
    

  {{-- Detalles --}}
  <div  style="height:100px;">
    <hr />
    <br>            
    <p>
    OBSERVACIONES:     {{$datosPedidos->observaciones}}
    <br>
    <br>
    <hr />
    <br>
    FORMA DE PAGO: {{$texto->Forma_pago_Productos}}
    <br>
    </p>
   </div>















             </div>
           
      <div class="pie"></div>

      </div>  
  </div>      
</body>

</html>