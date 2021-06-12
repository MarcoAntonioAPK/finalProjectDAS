<template>
    <v-container>
      <v-data-table
        :headers="encabezados"
        :items="categoria"
        :items-per-page="5"
     >
  <template v-slot:top>
    <v-toolbar flat>
      <v-toolbar-title>Categoria</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-btn color='success' @click="nl_dialog = true">Nueva categoria</v-btn>
    </v-toolbar>
  </template>

  <template v-slot:[`item.actions`]="{item}">
      <v-icon @click="eliminar_categoria(item)" small>
        fas fa-trash
        </v-icon>
        <v-spacer></v-spacer>
      <v-icon @click="editar_categoria(item)" small>
        fas fa-edit
        </v-icon>
    </template>
  </v-data-table>

<v-dialog v-model='nl_dialog' max-width="500px">
    <v-card>
      <v-card-title>
        Nueva categoria
      </v-card-title>
      <v-card-text>
        <v-container>
          <v-row>
            <v-col cols='6'>
              <v-text-field v-model="nueva_categoria.cat_tipo_producto" label='Categoria'>
              </v-text-field>
            </v-col>
            <v-col cols='6'>
              <v-text-field v-model="nueva_categoria.cat_descripcion" label='Descripción'>
              </v-text-field>
            </v-col>
          </v-row>
        </v-container>
      </v-card-text>
        <v-card-actions>
          <v-btn color='success' @click="guardar()">Guardar</v-btn>
          <v-spacer></v-spacer>
          <v-btn color='error' @click="cancelar()">Cancelar</v-btn>
        </v-card-actions>
    </v-card>
  </v-dialog>

    </v-container>
</template>


<script>
export default {
    name: 'Categoria',

    data(){
        return{
       encabezados: [
         {text: 'Identificardor', align: 'center', sortable: false, value: 'cat_id', },
         { text: 'Tipo de producto', value: 'cat_tipo_producto' },
         { text: 'Descripción', value: 'cat_descripcion' },
         { text: 'Acciones', value: 'actions'},
       ],

      categoria: [],

       nl_dialog: false,

       nueva_categoria: {
         cat_tipo_producto: '',
         cat_descripcion: '',
       },
    }   
},

created(){
    this.llenar_categoria();
},
    methods: {
      async llenar_categoria(){
      const api_data = await this.axios.get('/categoria/todas_las_categorias/');
      this.categoria = api_data.data;
    },

    async eliminar_categoria(item){
      const body = {
        cat_id: item.cat_id
      };
      await this.axios.post('/categoria/eliminar_categoria/', body);
      this.llenar_categoria();
    },
//{} vaciar nuevo libro
      cancelar(){
    this.nueva_categoria = {};
//que se cierre
    this.nl_dialog = false;
  },

    async guardar(){
    await this.axios.post('/categoria/nueva_categoria/', this.nueva_categoria);
    this.llenar_categoria();
    this.cancelar();
  },
},
    components: {
//Lo que va aquí viene de components
    },
}
</script>