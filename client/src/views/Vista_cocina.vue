<template>
    <v-conatainer>
        <v-data-table
            :headers="encabezados"
            :items="orden_no_entregada"
            :items-per-page="7"
        >
        <template v-slot:top>
        <v-toolbar flat>
          <v-tooltitle>Ordenes Pendientes</v-tooltitle>
          <v-spacer></v-spacer>
        </v-toolbar>
        </template>
        </v-data-table>
    </v-conatainer>
</template>


<script>
export default {
    name: 'Vista_cocina',

    data() {
        return {
            encabezados:[
                { text: 'Identificador', align: 'start', sortable: false, value: 'ord_id'},
                { text: 'Mesa', value: 'ord_mesa_id' },
                { text: 'Platillo', value: 'prod_nombre' },
                { text: 'Cantidad', value: 'det_cantidad'},
                { text: 'Detalles', value: 'det_detalles'},
                { text: 'Entregado', value: 'det_entregado'},

            ],
            orden_no_entregada: [],

            orden: {
                ord_mesa_id: '',
                prod_nombre:'',
                det_cantidad:'',
                det_detalles:'',
                det_entregado: '',
            }

        }

    },
    created() {
        this.llenar_ordenes();
    },

    methods: {
        async llenar_ordenes(){
          const api_data = await this.axios.get('/cocina/ordenes_no_entregadas/');
                this.orden_no_entregada = api_data.data;

        },

    },
}
</script>