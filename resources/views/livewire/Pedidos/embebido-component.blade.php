<div class="card">
  <div class="card-body">
        <h3 class="card-title">Nuevo Item</h3>
          <div class="row">

          <form class="row g-2">
            <div class="col-md-6">
                <input type="text" wire:model="producto" id="nombre_producto" class="form-control" placeholder="" aria-describedby="helpId" readonly>
                <small id="helpId" class="text-muted">Seleccione el producto de la lista</small>
            </div>
            <div class="col-md-2">
                <button type="button" class="btn btn-primary" id="productos_buscar"
                data-bs-toggle="modal" data-bs-target="#productos">
                Productos
                </button>
            </div>
            <div class="form-group col-md-2">
                <input type="text" wire:model="cantidad" id="cantidad" class="form-control" placeholder="" aria-describedby="helpId">
                <small id="helpId" class="text-muted">Cantidad</small>
            </div>

            <div class="form-group col-md-2">
              <input type="text" wire:model="precio" id="precio" class="form-control " 
              aria-describedby="helpId">
              <small id="helpId" class="text-muted">Precio</small>
            </div>
          </div>
       
        <input type="hidden" wire:model="id_producto" id="id_producto" name="id_producto" >
        <input type="hidden" wire:model="totalgravado" id="totalgravado" name="totalgravado" >
        <input type="hidden" name="detalles_string" wire:model="detalles_string">
      
    </div>
    <div class="row ">
      <div class="col-md-2  ">
        <button  type="button" id="agregar" class="btn btn-sm btn-primary"
                 wire:click='addDetalles' >Agregar</button>
      </div>    
    </div>
    
    
     
    <table class="table">
      <thead>
        <tr>
          <th>id</th>
          <th>producto</th>
          <th>cantidad  </th>
          <th>unidad  </th>
          <th>precio</th>
          <th>importe</th>
          <th>estado Fabric</th>
          <th>acciones</th>
        </tr>
      </thead>
      <tbody>
        
       @foreach ($detalles as $index=>$item)
        <tr>
          <td scope="row">{{$item['id_producto']}}</td>
          <td scope="row">{{$item['producto']}}</td>
          <td>{{$item['cantidad']}}</td>
          <td>{{$item['unidad']}}</td>
          <td>{{number_format($item['precio'], 2, '.', ',')}}</td>
          <td>{{number_format($item['total-linea'], 2, '.', ',')}}</td>
          <td>{{$item['estado']}}</td>
          <td><a wire:click.prevent="quitar({{$index}})"> Quitar</a></td>
        </tr>  
       @endforeach
       
       
      </tbody>
    </table>
     
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-md-5">
    
        </div>
       
    
        <div class="col-lg-6 col-md-6">
          <div class=" right_NPedido_livewire " style="width:100%;">
            <table style="width:100%;">
              <tbody>
                <tr>
                  <td style="text-align:right;"> Total gravado :   $</td><td style="text-align:right;"> {{number_format($totalgravado, 2, '.', ',')}}</td>
                </tr>
                <tr>
                  <td style="text-align:right;">Recargo / Descuento (+ / -):   $</td><td style="text-align:right;">{{number_format($descuento, 2, '.', ',')}}</td>
                </tr>
                <tr>
                  <td style="text-align:right;">Gravado con descuento:   $</td><td style="text-align:right;">{{number_format($gravadocondescuento, 2, '.', ',')}}</td>
                </tr>
                <tr >
                  <td style="text-align:right;">IVA 21 :   $</td><td style="text-align:right;"> {{number_format($monto_iva, 2, '.', ',')}}  </td>
                </tr>
                <tr>
                  <td style="text-align:right;">Total con IVA :   $</td><td style="text-align:right;">{{number_format($totalconiva, 2, '.', ',')}}</td>
                </tr>
                <tr>
                  <td style="text-align:right;">Total Pedido :   $</td><td style="text-align:right;">{{number_format($total, 2, '.', ',')}}</td>
                </tr>
              </tbody>
            </table>
          </div>

          
        </div>
      </div>
    </div>

       {{-- Totales --}}
       
        




  </div>
</div>



<script>
  function elegir(id,nom,precio,unidad)
  { 
    //alert("La unidad"+unidad);
   $('#productos').modal('hide');   
   Livewire.emit('actualiza', id, nom,precio,unidad);    
  
   }
</script>

{{-- Para formatear los numeros en livewire se debe crear una clase --}}
<script>
  $(function () {
      $(".money").maskMoney({
          decimal: '.',
          thousands: ''
          //prefix : 'R$ '
      });
  });
</script>


<script>
  function calculos()
  { 
        
    Livewire.emit('totales',$("#Modalidad :selected " ).val(), $("#descuento" ).val());
    
   }
   
</script>

 

{{-- FORMULARIO EMBEBIDO --}}



  


  