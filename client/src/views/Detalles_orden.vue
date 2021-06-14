<template>
    <v-container>
      <v-data-table
        :headers="encabezados"
        :items="detalles_ordenes"
        :items-per-page="5"
     >

     
  <template v-slot:top>
    <v-toolbar flat>
      <v-toolbar-title>Detalles de orden</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn color='success' @click="nl_dialog = true">Eliminar Detalle</v-btn>
    </v-toolbar>
  </template>

  </v-data-table>

<v-dialog v-model='nl_dialog' max-width="500px">
    <v-card>
      <v-card-title>
        Eliminar Detalle
      </v-card-title>
      <v-card-text>
        <v-container>
          <v-row>
            <v-col cols='6'>
              <v-text-field v-model="eliminar_detalle.det_ord_id" label='ID. orden' type="Number">
              </v-text-field>
            </v-col>
          </v-row>
        </v-container>
      </v-card-text>
        <v-card-actions>
          <v-btn color='success' @click="eliminar_detalles_orden()">Eliminar</v-btn>
        <v-spacer></v-spacer>
          <v-btn color='error' @click="cancelar()">Cancelar</v-btn>
        </v-card-actions>
    </v-card>
  </v-dialog>

    </v-container>
</template>


<script>
export default {
    name: 'Detalles_ordene',

    data(){
        return{
       encabezados: [
         {text: 'Identificardor', align: 'center', sortable: false, value: 'det_ord_id', },
         { text: 'producto', value: 'prod_nombre' },
         { text: 'Catidad', value: 'det_cantidad' },
         { text: 'Subtotal', value: 'det_subtotal' },
         { text: 'Detalles', value: 'det_detalles' },
         { text: 'Estado', value: 'det_entregado' },
       ],

      detalles_ordenes: [],

       nl_dialog: false,

       eliminar_detalle: {
           det_ord_id: '',
       },
    }   
},

created(){
    this.llenar_detalles_ordenes();
},
    methods: {
      async llenar_detalles_ordenes(){
      const api_data = await this.axios.get('/detalles_orden/detalles_ordenes/');
      this.detalles_ordenes = api_data.data;
    },

    async eliminar_detalles_orden(){
        const data = await this.axios.post('/detalles_orden/eliminar_detalles_de_orden/', this.eliminar_detalle);
        this.llenar_detalles_ordenes();
        this.cancelar();
    },
    cancelar(){
        this.eliminar_detalle = {};
        this.nl_dialog = false;
    },
},
}
</script>