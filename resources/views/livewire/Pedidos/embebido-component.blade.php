

<div class="card">
  <div class="card-body">
    <h3 class="card-title">Nuevo item</h3>
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
            productos..
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
          <input type="text" wire:model="precio" id="precio" class="form-control" placeholder="" aria-describedby="helpId">
          <small id="helpId" class="text-muted">Precio</small>
        </div>
        <input type="hidden" wire:model="id_producto" id="id_producto" name="id_producto" >

        <input type="hidden" name="detalles_string" wire:model="detalles_string">
      
    </div>
    <div class="row ">
      <div class="col-md-4  ">
        <button  type="button" id="agregar" class="btn btn-sm btn-primary"
                 wire:click='addDetalles' >+ Agregar</button>
      </div>    
    </div>
     {{-- <button type="button" wire:click="$emit('actualiza', '1', 'papa','33')">actualiza</button> --}}
     
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
          <td>{{$item['precio']}}</td>
          <td>{{$item['total-linea']}}</td>
          <td><a wire:click.prevent="quitar({{$index}})"> Quitar</a></td>
        </tr>  
       @endforeach
       
       
      </tbody>
    </table>
        total general {{$total_general}}
      
  </div>
</div>



<script>
  function elegir(id,nom,precio)
  { 
   $('#productos').modal('hide');   
   Livewire.emit('actualiza', id, nom,precio); 
   // Livewire.on('seleccion_producto', nombre,id,precio => {
   //         alert('cargo los valores: ' + nombre);
   //     })
   // $("#nombre_producto").val(nom);
   // $("#id_producto").val(id);
   // $("#precio").val(precio);

  
   
  
   }
</script>

 

{{-- FORMULARIO EMBEBIDO --}}



  


  