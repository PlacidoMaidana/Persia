

<div class="card">
    <div class="card-body">
      <h3 class="card-title"Items</h3>
      <div class="row">
       
          <form class="row g-2">
            <div class="form-group col-md-4">
              <label for="">Producto</label>
              <input type="text" wire:model="producto" id="nombre_producto" class="form-control" placeholder="" aria-describedby="helpId" readonly >
              <small id="helpId" class="text-muted">Seleccione el producto de la lista</small>
         
            </div>
            <div class="form-group col-md-4 ">
              <button type="button" class="btn btn-primary" id="productos_buscar"
              data-bs-toggle="modal" data-bs-target="#productos">
              Productos
              </button>
            </div>
           </div>
  
          <div class="form-group col-md-4">
            <label for="">Cantidad</label>
            <input type="text" wire:model="cantidad" id="cantidad" class="form-control" placeholder="" aria-describedby="helpId">
            <small id="helpId" class="text-muted">Cantidad</small>
          </div>
  
          <div class="form-group col-md-4">
            <label for="">Precio</label>
            <input type="text" wire:model="precio" id="precio" class="form-control " 
            aria-describedby="helpId">

            <small id="helpId" class="text-muted">Precio</small>
          </div>
  
          
          <input type="hidden" wire:model="id_producto" id="id_producto" name="id_producto" >
          <input type="hidden" wire:model="total_general" id="total_general" name="total_general" >
  
          <input type="hidden" name="detalles_string" wire:model="detalles_string">
        
      </div>
      <div class="row ">
        <div class="col-md-4  ">
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
            <th>precio</th>
            <th>total</th>
            <th>acciones</th>
          </tr>
        </thead>
        <tbody>
          
         @foreach ($detalles as $index=>$item)
          <tr>
            <td scope="row">{{$item['id_producto']}}</td>
            <td scope="row">{{$item['producto']}}</td>
            <td>{{$item['cantidad']}}</td>
            <td>{{number_format($item['precio'], 2, '.', ',')}}</td>
            <td>{{number_format($item['total-linea'], 2, '.', ',')}}</td>
            <td><a wire:click.prevent="quitar({{$index}})"> Quitar</a></td>
          </tr>  
         @endforeach
         
         
        </tbody>
      </table>
         Subtotal:   {{number_format($total_general, 2, '.', ',')}} </tr>  

           <div class="form-group col-md-8 ">
           </div>
           <div class="form-group col-md-2 ">
            <label class="control-label" for="name">Subtotal</label>
            {{--<input type="text" class="form-control" name="subtotal" placeholder="Subtotal" value="{{$totales}}">--}}
            <input type="text" wire:model="subtotal" id="subtotal" name="subtotal" readonly >
           </div>
           <div class="row">
           </div>

           <div class="form-group col-xs-3 ">
            <label class="control-label" for="name">Iva 10.5 %</label>
           <input type="text" wire:model="iva_10_5" onchange="cacular_totales()" id="iva_10_5" name="iva_10_5"  value="0" >
           </div>
           <div class="form-group col-xs-3 ">
            <label class="control-label" for="name">Iva 21 %</label>
           <input type="text" wire:model="iva_21" onchange="cacular_totales()" id="iva_21" name="iva_21" value="0" >
         
           </div>
           <div class="form-group col-xs-3 ">
           <label class="control-label" for="name">Iva 27 %</label>
           <input type="text" wire:model="iva_27" onchange="cacular_totales()" id="iva_27" name="iva_27" value="0" >
           </div>
           {{--<div class="form-group col-xs-3 ">
           <label class="control-label" for="name">Iva</label>
           <input type="text" wire:model="iva" id="iva" name="iva" >
           </div>--}}
           <div class="row">
           </div>   
           <div class="form-group col-xs-3  ">
          <label class="control-label" for="name">Percepcion IIBB</label>
          <input type="text" wire:model="monto_perc_iibb"  onchange="cacular_totales()" id="monto_perc_iibb" name="monto_perc_iibb" value="0" >
         </div>
         <div class="form-group col-xs-3  ">
          <label class="control-label" for="name">Percepcion Iva</label>
          <input type="text" wire:model="monto_percepcion_iva" onchange="cacular_totales()" id="monto_percepcion_iva" name="monto_percepcion_iva" value="0" >
         </div>
         <div class="form-group col-xs-3  ">
          <label class="control-label" for="name">Perc. Ganancias</label>
          <input type="text" wire:model="monto_percep_ganancias" onchange="cacular_totales()" id="monto_percep_ganancias" name="monto_percep_ganancias" value="0" >
         </div>
         <div class="row">
         </div>
                                           
         <div class="form-group col-md-3   ">
          <label class="control-label" for="name">Otros Impuestos</label>
          <input type="text" wire:model="otros_impuestos" onchange="cacular_totales()" id="otros_impuestos" name="otros_impuestos" value="0"  >
         </div>
         <div class="row">
         </div> 

         <div class="form-group col-md-8 ">
         </div>
         <div class="form-group col-md-3 ">
          <label class="control-label" for="name">Total Impuestos</label>
          <input type="text" wire:model="total_impuestos" id="total_impuestos" name="total_impuestos" >
         </div>
         <div class="form-group col-md-8 ">
         </div>
         <div class="form-group  col-md-3   ">
          <label class="control-label" for="name">Total Factura</label>
          <input type="text" wire:model="total_factura" id="total_factura" name="total_factura" >
         </div>
    </div>
  </div>
  
  
  
  <script>
    function elegir(id,nom,precio)
    { 
     //alert(id+"  "+nom+"  "+precio);
     $('#productos').modal('hide');   
     Livewire.emit('actualiza', id, nom,precio);    
     
     }

  </script>
   
  <script>
    function cacular_totales() {

      $('#iva_21').val()?"":$('#iva_21').val(0);
      $('#iva_10_5').val()?"":$('#iva_10_5').val(0);
      $('#iva_27').val()?"":$('#iva_27').val(0);
      $('#monto_percep_ganancias').val()?"":$('#monto_percep_ganancias').val(0);
      $('#monto_perc_iibb').val()?"":$('#monto_perc_iibb').val(0);
      $('#monto_percepcion_iva').val()?"":$('#monto_percepcion_iva').val(0);
      $('#otros_impuestos').val()?"":$('#otros_impuestos').val(0);

      var subtotal=Number.parseFloat($('#subtotal').val()) ;
      var iva105= Number.parseFloat($('#iva_10_5').val()); 
      var iva21= Number.parseFloat($('#iva_21').val());   
      var iva27=Number.parseFloat($('#iva_27').val()) ;
      var iva= Number.parseFloat(iva105+iva21+iva27);
      if (iva>0) {
        $('#iva').val(iva);   
      }
      var percgcia= Number.parseFloat($('#monto_percep_ganancias').val()); 
      var percib= Number.parseFloat($('#monto_perc_iibb').val());   
      var perciva=Number.parseFloat($('#monto_percepcion_iva').val()) ;
      var otrosimp=Number.parseFloat($('#otros_impuestos').val()) ;
      var percep= Number.parseFloat(percgcia+percib+perciva); 
      var totalimp= Number.parseFloat(percep+iva+otrosimp);
      if (totalimp>0) {
        $('#total_impuestos').val(totalimp);   
      }
      var totalfact= Number.parseFloat(subtotal+totalimp);
      if (totalfact>0) {
        $('#total_factura').val(totalfact);   
      }
 
    }

  </script>
  
   
  
  {{-- FORMULARIO EMBEBIDO --}}
  
  
  
    
  
  
    