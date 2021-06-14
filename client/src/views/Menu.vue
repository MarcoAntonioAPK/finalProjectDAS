<template>
    <v-container>
        <v-data-table
            :headers="encabezados"
            :items="menu"
            :items-per-page="7"
            :search="search"
            class="elevation-1"
        >
            <template v-slot:top>
            <v-toolbar flat>
            <v-toolbar-title>
                Menú
                <v-spacer></v-spacer>
                <v-text-field
                    v-model="search"
                    append-icon="fas fa-search"
                    label="Buscar en la tabla"
                    single-line
                    hide-details
                >
                </v-text-field>
            </v-toolbar-title>
            </v-toolbar>
            </template>
        </v-data-table>
    </v-container>
</template>


<script>
export default {
    name: 'Menu',

    data() {
        return {
            search: '',
            tab: null, 
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