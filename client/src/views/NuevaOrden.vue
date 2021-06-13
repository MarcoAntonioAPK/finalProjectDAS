<template>
    <v-container>
        <v-data-table
            :headers= "encabezados"
            :items= "ordenes"
            :items-per-page= "10"
        >
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title>
                        Ordenes
                    </v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-btn color= 'success' @click="nl_dialog= true">
                        Nueva Órden
                    </v-btn>
                </v-toolbar>
            </template>
            <template v-slot:[`item.actions`]="{item}">
                <v-icon @click="eliminar_administrador(item)" small>
                    far fa-edit
                </v-icon>
            </template>
        </v-data-table>

        <v-dialog v-model= 'nl_dialog' max-width= '500px'>
            <v-card>
                <v-card-title>
                    Nueva Órden
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols= "6">
                                <v-text-field v-model= "nueva_orden.ord_fecha_dia" label = "Fecha"></v-text-field>
                            </v-col>
                            <v-col cols= "6">
                                <v-text-field v-model= "nueva_orden.ord_hora" label = "Hora"></v-text-field>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col cols= "6">
                                <v-text-field v-model= "nueva_orden.ord_mesero_id" label = "Mesero"></v-text-field>
                            </v-col>
                            <v-col cols= "6">
                                <v-text-field v-model= "nueva_orden.ord_mesa_id" label = "Mesa"></v-text-field>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col cols= "6">
                                <v-text-field v-model= "nueva_orden.ord_estado" label = "Abierta/Cerrada"></v-text-field>
                            </v-col>
                            <v-col cols= "6">
                                <v-text-field v-model= "nueva_orden.ord_detalles" label = "Det. Generales de Órden"></v-text-field>
                            </v-col>
                        </v-row>
                        <v-row>
                            <v-col cols= "12">
                                <v-text-field v-model= "nueva_orden.ord_estado" label = "Total de Cuenta"></v-text-field>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color= 'success' @click= "guardar()"> Guardar</v-btn>
                    <v-btn color= 'error' @click= "cancelar()">Cancelar</v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-container>
</template>

<script>
    export default{
        name: 'NuevaOrden',
        
        data(){
            return{
                encabezados: [
                    { text: 'Id Orden', align: 'start', sortable: false, value: 'ord_id',},
                    { text: 'Fecha', value: 'ord_fecha_id' },
                    { text: 'Hora', value: 'ord_fecha_hora' },
                    { text: 'Mesero', value: 'ord_mesero_id'},
                    { text: 'Mesa', value: 'ord_mesa_id'},
                    { text: 'Estado', value: 'ord_estado'},
                    { text: 'Detalles', value: 'ord_detalles'},
                    { text: 'Total de cuenta', value: 'ord_total_cuenta'},
                    { text: 'Acciones', value: 'actions'},
                ],

                ordenes: [],

                nueva_orden:{
                    ord_fecha_dia: '',
                    ord_fecha_hora: '',
                    ord_mesero_id: '',
                    ord_mesa_id: '',
                    ord_estado: '',
                    ord_detalles: '',
                    ord_total_cuenta: '',
                },

                nl_dialog: false,
            }
        },

        created(){
            this.llenar_ordenes();
        },

        methods:{
            async llenar_ordenes(){
            const api_data = await this.axios.get('/nueva_orden/todas_las_ordenes_abiertas');
            this.ordenes = api_data.data;
            },

            cancelar(){
                this.nueva_orden = {};
                this.nl_dialog = false;
            },

            async guardar(){
                await this.axios.post('/nueva_orden/nueva_orden', this.nueva_orden);
                this.cancelar();
            },
        }
    }
</script>