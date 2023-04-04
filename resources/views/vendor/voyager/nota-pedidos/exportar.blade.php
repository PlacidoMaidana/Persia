@php
   use Dompdf\Dompdf;

@endphp

@php
            $cont=1;
            $i=0;
@endphp 
<html>
<head>
    <style>
           </style>
<link rel="stylesheet" href="css/presupuesto.css">
<!-- CSS de Bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-Taw2QsO7z+NhkuOwvYKWGTGQ2txINdxdKDE9Nc1emfzCid/zpH/5zPjUbjqqiqUH" crossorigin="anonymous">

<!-- JS de Bootstrap (necesario para algunos componentes de Bootstrap) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-UEJ1e0lh0bcLRKwRNSLJQ2GxpyEj54fX1+IDeM6Jzfl6pgM96fKj36wUw1eA/Dx" crossorigin="anonymous"></script>



</head>
<body>
  <header>
      <h1> </h1>
    
  </header>
  
  <main>
  
    @php
              
    $date =Carbon\Carbon::createFromDate($datosPedidos->fecha)->format('Y-m-d');
    @endphp
        <div class="cuerpo">
             <h2>PRESUPUESTO</h2> 
             {{-- <h3>Fecha: {{$datosPedidos->fecha}} </h3>  --}}
             <hr />
             Fecha: {{$date}}  <br>
             Cliente: {{$datosPedidos->nombre}} <br>
             Pedido Nro: {{$datosPedidos->id_pedido}} <br>
             Estado: {{$datosPedidos->estado}} <br>  
             <br>  
             <hr style="color: rgb(84, 83, 83); background-color: rgb(101, 100, 100); width:100% higth:2px ;" />
             Sr/:  <br>
             Por medio de la presente le envió el presupuesto solicitado.		<br>

        
    {{-- grilla --}}
  <div class="caja " style="height:210px;" >
        <table class="table" style="width:100%;" rules=all  >
          
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
              @php
                  $i++;
              @endphp
        <tr >
       {{--  <td> <div style="float: left;"> {{ $p->subrubro }} </div>  </td> --}} 
       
       
         <td> {{ $p->subrubro }}   </td>  
         <td> {{ $p->descripcion }}  </td>
         <td> {{ $p->cantidad }}  </td>
         <td> {{ $p->unidad }}   </td>
         <td> ${{ number_format($p->punit,2) }}</td>
         <td> ${{ number_format($p->total_linea,2) }}  </td> 
                 
        </tr>
             

        @if($i>10)
        <h5> Pedido Nro: {{$datosPedidos->id_pedido}}  pagina  {{$cont}}</h5> 
        <p style="page-break-before:always;"> </p>
        @php
            $cont++;            
            $i=0;
        @endphp
        
        @endif




        @endforeach
        
        

     </tbody>
     </table>

     @if($i<=10)
         <h5> Pedido Nro: {{$datosPedidos->id_pedido}}  pagina  {{$cont}}</h5>
     @endif
    
        
    </div>





    {{-- Totales --}}

    <div class="row">
      <div class="col-lg-10 col-md-10">
        <!-- Contenido de la primera columna aquí -->
      </div>
      <div class="col-lg-2  col-md-2">
          
          <table>
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
    </div>
    
   
    {{-- Detalles --}}
    <div  style="height:50px;" >
    <hr />
    <p style="font-size: 12px">
    OBSERVACIONES:     {{$datosPedidos->observaciones}}
    </p>
    <hr />
    <p style="font-size: 9px">
    FORMA DE PAGO: {{$texto->Forma_pago_Productos}}
    <br>
    </p>
    </div>


   </div>
 
    <div class="pie"></div>

    </div>  
    </div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>


  </main>
  
  <footer>
    
  </footer>
  


  
  
</body>
</html>