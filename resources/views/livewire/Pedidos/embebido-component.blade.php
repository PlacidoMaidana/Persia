

 

<div class="card">
  <div class="card-body">
    <h3 class="card-title"Items</h3>
    <div class="row">
     
        <form class="row g-2">
          <div class="col-auto">
            <label for="">Producto</label>
            <input type="text" wire:model="producto" id="nombre_producto" class="form-control" placeholder="" aria-describedby="helpId">
            <small id="helpId" class="text-muted">Seleccione el producto de la lista</small>
       
          </div>
          <div class="col-auto">
            <button type="button" class="btn btn-primary" id="productos_buscar"
            data-bs-toggle="modal" data-bs-target="#productos">
            Productos
            </button>
          </div>
         </div>

        <div class="form-group col">
          <label for="">Cantidad</label>
          <input type="text" wire:model="cantidad" id="cantidad" class="form-control" placeholder="" aria-describedby="helpId">
          <small id="helpId" class="text-muted">Cantidad</small>
        </div>

        <div class="form-group col">
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
          <th>detalle</th>
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
        total general: {{number_format($total_general, 2, '.', ',')}}
      
  </div>
</div>



<script>
  function elegir(id,nom,precio)
  { 
   $('#productos').modal('hide');   
   Livewire.emit('actualiza', id, nom,precio); 
   
   
  
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


 

{{-- FORMULARIO EMBEBIDO --}}



  


  