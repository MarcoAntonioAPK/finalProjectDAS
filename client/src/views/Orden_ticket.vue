<template>
    <v-container >
        <v-data-table
            :headers="encabezados"
            :items="ticket"
            :items-per-page="5"
        >
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title>Tickets</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-btn color= 'secondary' @click="nl_dialog= true">ID Orden</v-btn>
                </v-toolbar>
            </template>
        </v-data-table>


        <v-dialog v-model= 'nl_dialog' max-width= '500px'>
            <v-card>
                <v-card-title>
                    ID Orden
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols= '6'>
                                <v-text-field v-model= "orden_id.ord_id" label= 'ID' type="number"> </v-text-field>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card-text>

                <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color= 'secondary' @click= "llenar_ticket()">Listo</v-btn>
                <v-btn color= 'primary' @click= "cancelar()">Cancelar</v-btn>
                <v-spacer></v-spacer>
                </v-card-actions>
            </v-card>
        </v-dialog>

        <div >
           El Total de Cuenta es {{total}}
        </div>
    </v-container>
</template>
<script>

export default {
    name: 'Ticket',

    data() {
        return {
            encabezados:[
                { text: 'Producto', align: 'start', sortable: false, value: 'prod_nombre' },
                { text: 'Costo Unitario', value: 'prod_costo_unit' },
                { text: 'Cantidad', value: 'det_cantidad'},
                { text: 'Suntotal', value: 'det_subtotal'},

            ],

            ticket: [],

             nl_dialog: false,

            total: [],


            orden_id: {
                ord_id: '',
            },

        }

    },

    methods: {

        async llenar_ticket(){
                const body = {
                    or_id: this.orden_id.ord_id,
                };
                const api_data = await this.axios.get('/ticket/mostrar_ticket/' + body.or_id.toString());
                this.ticket = api_data.data;
                this.ver_total();
                this.cancelar();

        },

        async ver_total(){
                const body = {
                    or_id: this.orden_id.ord_id,
                };
                const api_data = await this.axios.get('/ticket/total/' + body.or_id.toString());
                this.total = api_data.data;
        },

        cancelar(){
                this.orden_id = {};
                this.nl_dialog = false;
        },
    },
}
</script>