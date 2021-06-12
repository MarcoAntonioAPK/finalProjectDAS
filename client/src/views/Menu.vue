<template>
    <v-conatainer>
        <v-data-table
            :headers="encabezados"
            :items="menu"
            :items-per-page="7"
        >
        <template v-slot:top>
        <v-toolbar flat>
          <v-tooltitle>Menú</v-tooltitle>
          <v-spacer></v-spacer>
        </v-toolbar>
        </template>
        </v-data-table>
    </v-conatainer>
</template>


<script>
export default {
    name: 'Menu',

    data() {
        return {
            encabezados:[
                {
                    text: 'Identificador',
                    align: 'start',
                    sortable: false,
                    value: 'prod_id',
                },
                { text: 'Producto', value: 'prod_nombre' },
                { text: 'Categoria', value: 'cat_tipo_producto' },
                {text: 'Descripción', value: 'cat_descripcion'},
                { text: 'Costo', value: 'prod_costo_unit' },

            ],
            menu:[],

            producto_menu:{
                prod_nombre:'',
                prod_cat_id:'',
                prod_costo_unit:'',
            }

        }

    },
    created() {
  this.llenar_menu();
},
    methods: {
        async llenar_menu(){
          const api_data = await this.axios.get('/menu/todo_el_menu/');
                this.menu = api_data.data;

                },

    },
}
</script>