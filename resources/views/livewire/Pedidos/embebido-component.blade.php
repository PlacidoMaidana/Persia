<div class="card">
  <div class="card-body">
    <h3 class="card-title">Nuevo item</h3>
    <div class="row">
     
        <div class="form-group col">
          <label for="">Prducto</label>
          <button type="button" class="btn btn-primary" id="productos_buscar"
          data-bs-toggle="modal" data-bs-target="#productos">
             productos..
         </button>
         
          <input type="text" wire:model="producto" id="nombre_producto" class="form-control col-md-4" placeholder="" aria-describedby="helpId">
          <small id="helpId" class="text-muted">Seleccione el producto de la lista</small>
        </div>

        <div class="form-group col">
          <label for="">Cantidad</label>
          <input type="text" wire:model="cantidad" id="" class="form-control" placeholder="" aria-describedby="helpId">
          <small id="helpId" class="text-muted">Help text</small>
        </div>

        <div class="form-group col">
          <label for="">Precio</label>
          <input type="text" wire:model="precio" id="precio" class="form-control" placeholder="" aria-describedby="helpId">
          <small id="helpId" class="text-muted">Help text</small>
        </div>
        <input type="text" wire:model="id_producto" id="id_producto" name="detalles_string" >

        <input type="hidden" name="detalles_string" wire:model="detalles_string">

    </div>
    <div class="row ">
      <div class="col-md-4  ">
        <button class="btn btn-sm btn-primary"
                 wire:click.prevent='addDetalles' >+ Agregar</button>
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
        </tr>
      </thead>
      <tbody>
        
       @foreach ($detalles as $item)
        <tr>
          <td scope="row">{{$item['id_producto']}}</td>
          <td scope="row">{{$item['producto']}}</td>
          <td>{{$item['cantidad']}}</td>
          <td>{{$item['precio']}}</td>
          <td>{{$item['total-linea']}}</td>
        </tr>  
       @endforeach
       
       
      </tbody>
    </table>
        
      
  </div>
</div>


{{-- <script>
  $('#productos_buscar').on('click',function(){
     $('#x34').load('http://127.0.0.1/persia/public/tabla_productos_elegir',function(){
         $('#productos').modal('show');
     });
 });
 </script> --}}



  