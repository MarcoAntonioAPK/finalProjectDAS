<template>
    <v-container >
        <v-data-table
            :headers="encabezados"
            :items="productos"
            :items-per-page="5"
            >
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title>Productos</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-btn color= 'secondary' @click="nl_dialog= true">Nuevo Producto</v-btn>
                </v-toolbar>
            </template>

            <template v-slot:[`item.actions`]="{item}">
                <v-icon @click="eliminar_producto(item)" class="mr-5" small>
                    far fa-trash-alt
                </v-icon>
                <v-icon @click="editar_producto(item)" small>
                    fas fa-pen
                </v-icon>
            </template>
        </v-data-table>

        <v-dialog v-model= 'nl_dialog' max-width= '500px'>
            <v-card>
                <v-card-title>
                    Nuevo Producto
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols= '6'>
                                <v-text-field v-model= "nuevo_producto.prod_nombre" label= 'Nombre del Producto'> </v-text-field>
                            </v-col>
                            <v-col cols= '6'>
                            <v-text-field v-model= "nuevo_producto.prod_cat_id" label= 'Identificador de Categoria' type="Number"> </v-text-field>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col cols= '6'>
                                <v-text-field v-model= "nuevo_producto.prod_costo_unit" label= 'Costo Unitario'> </v-text-field>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card-text>

                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color= 'secondary' @click= "guardar()"> Guardar</v-btn>
                    <v-btn color= 'primary' @click= "cancelar()">Cancelar</v-btn>
                    <v-spacer></v-spacer>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-container>

</template>

<script>
export default {
    name: 'Producto_menu',

    data(){
        return{
            encabezados: [
                { text: 'Identificador', align: 'start', sortable: false, value: 'prod_id'},
                { text: 'Nombre del Producto', value: 'prod_nombre' },
                { text: 'Identifiacdor de Categoria', value: 'prod_cat_id' },
                { text: 'Costo Unitario', value: 'prod_costo_unit' },
                { text: 'Acciones', value: 'actions'},
            ],

            productos: [],

            nl_dialog: false,

            nuevo_producto: {
                prod_nombre: '',
                prod_cat_id: '',
                prod_costo_unit: '',
            }
        }
    },

    created(){
        this.llenar_productos();
    },

    methods:{
        async llenar_productos(){
            const api_data = await this.axios.get('/productos/todos_los_productos');
            this.productos = api_data.data;
        },

        async eliminar_producto(item){
            const body = {
                prod_id: item.prod_id
            };
            const data = await this.axios.post('/productos/eliminar_producto', body);

            this.llenar_productos();
        },

        cancelar(){
            this.nuevo_producto = {};
            this.nl_dialog = false;
        },

        async guardar(){
            await this.axios.post('/productos/nuevo_producto', this.nuevo_producto);
            this.llenar_productos();
            this.cancelar();
        },
    },

}
</script>