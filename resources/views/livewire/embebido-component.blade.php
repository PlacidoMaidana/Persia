
   
    <div>
        <div>
            
           <div class="card">
               <img class="card-img-top" src="holder.js/100x180/" alt="">
               <div class="card-body">
                   <h4 class="card-title">Nueva linea</h4>
                   
        <div class="form-group">
            <label for="">Prducto</label>
            <input type="text" wire:model="producto" id="" class="form-control" placeholder="" aria-describedby="helpId">
            <small id="helpId" class="text-muted">Help text</small>
          </div>
          <div class="form-group">
              <label for="">Cantidad</label>
              <input type="text" wire:model="cantidad" id="" class="form-control" placeholder="" aria-describedby="helpId">
              <small id="helpId" class="text-muted">Help text</small>
            </div>
            <div class="form-group">
              <label for="">Precio</label>
              <input type="text" wire:model="precio" id="" class="form-control" placeholder="" aria-describedby="helpId">
              <small id="helpId" class="text-muted">Help text</small>
            </div>
            <div class="form-group">
              <label for="">Total</label>
              <input type="text" wire:model="total_linea" id="" class="form-control" placeholder="" aria-describedby="helpId">
              <small id="helpId" class="text-muted">Help text</small>
            </div>
            <div class="form-group">
              <label for="">Prducto</label>
              <input type="text" wire:model="producto" id="" class="form-control" placeholder="" aria-describedby="helpId">
              <small id="helpId" class="text-muted">Help text</small>
            </div>
             <button type="button" wire:click='addDetalles' class="btn btn-primary">Agregar</button>
               </div>
           </div>
            


         @php
         var_dump($detalles);
            foreach ($detalles as $key => $value) {
                echo $value['producto'];
             }
         @endphp


        </div>
    
    </div>

