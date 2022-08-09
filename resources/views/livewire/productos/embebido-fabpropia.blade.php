
<div class="card">
  <div class="card-body">
    <h3 class="card-title">  Composicion del producto</h3>
    <div class="row">
     
        <form class="row g-2">
          <div class="form-group col-md-4">
            <label for="">Insumo</label>
            <input type="text" wire:model="producto" id="nombre_producto" class="form-control" placeholder="" aria-describedby="helpId" readonly>
            <small id="helpId" class="text-muted">Seleccione el insumo de la lista</small>
       
          </div>
          <div class="form-group col-md-4">
            <button type="button" class="btn btn-primary" id="productos_buscar"
            data-bs-toggle="modal" data-bs-target="#productos">
            Insumos
            </button>
          </div>
         </div>

        <div class="form-group col-md-4">
          <label for="">Cantidad</label>
          <input type="text" wire:model="cantidad" id="cantidad" class="form-control" placeholder="" aria-describedby="helpId">
          <small id="helpId" class="text-muted">Cantidad</small>
        </div>   
        <div class="form-group col-md-4">
          <label for="">Unidad consumo</label>
          <input type="text" wire:model="unidad" id="unidad" class="form-control" placeholder="" aria-describedby="helpId">
          <small id="helpId" class="text-muted">Unidad</small>
        </div> 
        <div class="form-group col-md-4">
          <label for="">Color</label>
          <input type="text" wire:model="color" id="color" class="form-control" placeholder="" aria-describedby="helpId">
          <small id="helpId" class="text-muted">Color</small>
        </div> 

        <input type="hidden" wire:model="id_insumo_producto" id="id_insumo_producto" name="id_insumo_producto" >
       
        
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
          <th>insumo</th>
          <th>color  </th>
          <th>cantidad  </th>
          <th>unidad</th>
          <th>acciones</th>
        </tr>
      </thead>
      <tbody>
        
       @foreach ($detalles as $index=>$item)
        <tr>
          <td scope="row">{{$item['id_producto']}}</td>
          <td scope="row">{{$item['producto']}}</td>
          <td>{{$item['color']}}</td>
          <td>{{$item['cantidad']}}</td>
          <td>{{$item['unidad']}}</td>
          <td><a wire:click.prevent="quitar({{$index}})"> Quitar</a></td>
        </tr>  
       @endforeach
       
       
      </tbody>
    </table>
              
  </div>
</div>

<script>
  function elegir(id,nom)
  { 
   $('#productos').modal('hide');   
   Livewire.emit('actualiza', id, nom);    
  
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



  


  