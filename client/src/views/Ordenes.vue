<template>
    <v-container>
      <v-data-table
        :headers="encabezados"
        :items="ordenes"
        :items-per-page="5"
     >
  <template v-slot:top>
    <v-toolbar flat>
      <v-toolbar-title>Orden</v-toolbar-title>
    </v-toolbar>
  </template>

  <template v-slot:[`item.actions`]="{item}">
      <v-icon @click="eliminar_orden(item)" small>
        fas fa-trash
        </v-icon>
        <v-spacer></v-spacer>
    </template>
  </v-data-table>

    </v-container>
</template>


<script>
export default {
    name: 'Ordenes',

    data(){
        return{
       encabezados: [
         {text: 'Identificardor', align: 'center', sortable: false, value: 'ord_id', },
         { text: 'Día de la orden', value: 'ord_fecha_dia' },
         { text: 'Hora de la orden', value: 'ord_fecha_hora' },
         { text: 'mesero', value: 'mese_nom_comp' },
         { text: 'mesa', value: 'ord_mesa_id' },
         { text: 'Estado', value: 'ord_estado' },
         { text: 'detalles de la orden', value: 'ord_detalles' },
         { text: 'total de la cuenta', value: 'ord_total_cuenta' },
         { text: 'Acciones', value: 'actions'},
       ],

      ordenes: [],

       nl_dialog: false,
    }   
},

created(){
    this.llenar_ordenes();
},
    methods: {
      async llenar_ordenes(){
      const api_data = await this.axios.get('/ordenes/todas_las_ordenes/');
      this.ordenes = api_data.data;
    },

    async eliminar_orden(item){
      const body = {
        ord_id: item.ord_id
      };
      const data = await this.axios.post('/ordenes/eliminar_orden/', body);
      this.llenar_ordenes();
    },
//{} vaciar nuevo libro
},
}
</script>