<div class="card">
  <div class="card-body">
    <h3 class="card-title">Nuevo item</h3>
    <div class="row">
     
        <div class="form-group col">
          <label for="">Prducto</label>
         
          <input type="text" wire:model="producto" id="" class="form-control" placeholder="" aria-describedby="helpId">
          <small id="helpId" class="text-muted">Help text</small>
        </div>

        <div class="form-group col">
          <label for="">Cantidad</label>
          <input type="text" wire:model="cantidad" id="" class="form-control" placeholder="" aria-describedby="helpId">
          <small id="helpId" class="text-muted">Help text</small>
        </div>

        <div class="form-group col">
          <label for="">Precio</label>
          <input type="text" wire:model="precio" id="" class="form-control" placeholder="" aria-describedby="helpId">
          <small id="helpId" class="text-muted">Help text</small>
        </div>

        <input type="hidden" name="detalles_string" wire:model="detalles_string">

    </div>
    <div class="row ">
      <div class="col-md-4  ">
        <button type="button  " wire:click.prevent='addDetalles' class="btn btn-primary">Agregar</button>
      </div>
    </div>

    <table class="table">
      <thead>
        <tr>
          <th>producto</th>
          <th>cantidad  </th>
          <th>precio</th>
          <th>detalle</th>
        </tr>
      </thead>
      <tbody>
        
       @foreach ($detalles as $item)
        <tr>
          <td scope="row">{{$item['producto']}}</td>
          <td>{{$item['cantidad']}}</td>
          <td>{{$item['precio']}}</td>
          <td>{{$item['total-linea']}}</td>
        </tr>  
       @endforeach
       
        <tr>
          <td scope="row"></td>
          <td></td>
          <td></td>
        </tr>
      </tbody>
    </table>
        
      
  </div>
</div>






  