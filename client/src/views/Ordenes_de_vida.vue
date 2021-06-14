<template>
    <v-container>
        <v-data-table
            :headers="encabezados"
            :items="orden"
            :items-per-page="7"
        >
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title>Ordenes</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-card-actions class="px-3 pb-3">
                        <v-btn color='#9b6b04' @click="nl_dialog = true" class="mr-5" >Ordenes de Meseros</v-btn >
                    </v-card-actions>
                </v-toolbar>
            </template>
        </v-data-table>

        <v-dialog v-model="nl_dialog" max-width="500px">
            <v-card>
                <v-card-title>Consulta por mesero</v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols='12'>
                                <v-select
                                    :items="meseros"
                                    v-model="buscar_orden.ord_mesero_id"
                                    label='Mesero'
                                >
                                </v-select>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color='success' @click="buscar()"> Buscar</v-btn>
                    <v-btn color='error' @click="cancelar()"> Cancelar</v-btn>
                </v-card-actions>
            </v-card>
            <v-card>
            </v-card>
        </v-dialog>
    </v-container>
</template>

<script>
export default {
    name:'Ordenes_de_vida',
    data() {
        return {
            encabezados:[
                {
                    text: 'Identificador',
                    align: 'start',
                    sortable: false,
                    value: 'ord_id',
                },
                { text: 'Día', value: 'ord_fecha_dia' },
                { text: 'Hora', value: 'ord_fecha_hora' },
                { text: 'Mesero', value: 'ord_mesero_id'},
                { text: 'Mesa', value: 'ord_mesa_id' },
                { text: 'Estado', value: 'ord_estado' },
                { text: 'Detalles', value: 'ord_det_id' },
                { text: 'Total de cuenta', value: 'ord_total_cuenta' },

            ],
            orden:[],
            meseros:[],

            nl_dialog: false,

            buscar_orden:{
                ord_id:'',
                ord_fecha_dia:'',
                ord_fecha_hora:'',
                ord_mesero_id:'',
                ord_mesa_id:'',
                ord_estado:'',
                ord_det_id:'',
                ord_total_cuenta:'',
            }
            
        }
    },
    created() {
        this.llenar_orden();
        this.llenar_meseros();
    },
    methods: {
        async llenar_orden(){
            const api_data = await this.axios.get('/orden/todas_las_ordenes');
            this.orden = api_data.data;

        },
        async llenar_meseros(){
            const api_data = await this.axios.get('/meseros/todos_los_meseros/');
                api_data.data.forEach((item) => {
                    this.meseros.push({
                        text: item.mesero_nombre + ' ' + item.mesero_ap_pat + ' ' + item.mesero_ap_mat,
                        value: item.mesero_id
                    }); 
                });
        },
        cancelar(){
                this.buscar_orden = {};
                this.nl_dialog = false;
               
         },
         async buscar(){
            const body = {
                ord_mesero: this.buscar_orden.ord_mesero_id,
            };
            console.log(body);
            const api_data = await this.axios.get('/ordenes_de_vida/buscar_orden_de_mesero_vida/' + body.ord_mesero.toString());
            this.orden = api_data.data;
        },
                
    },
             
}
</script>
