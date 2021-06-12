<template>
    <v-container>
    <v-data-table
      :headers="encabezados"
      :items="meseros"
      :items-per-page="5"
    >
        <template v-slot:top>
            <v-toolbar flat>
                <v-toolbar-tittle>Meseros</v-toolbar-tittle>
                <v-spacer></v-spacer>
                <v-btn color='success' @click="nl_dialog = true">Nuevo Mesero</v-btn>
            </v-toolbar>
        </template>

        <template v-slot:[`item.actions`]="{item}">
            <v-icon @click="eliminar_mesero(item)" small>
                fas fa-trash
            </v-icon>
        </template>      
    </v-data-table>

    <v-dialog v-model='nl_dialog' max-width="500px">
        <v-card>
                <v-card-tittle>
                    Nuevo Mesero
                </v-card-tittle>
                    <v-card-text>
                        <v-container>
                            <v-row>
                                <v-col cols='6'>
                                    <v-text-field v-model="nuevo_mesero.mesero_nombre" label='Nombre'>
                                    </v-text-field>
                                </v-col>
                                <v-col cols='6'>
                                    <v-text-field v-model="nuevo_mesero.mesero_ap_pat" label='Apellido Paterno'>
                                    </v-text-field>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col cols='6'>
                                    <v-text-field v-model="nuevo_mesero.mesero_ap_mat" label='Apellido Materno'>
                                    </v-text-field>
                                </v-col>
                                <v-col cols='6'>
                                    <v-text-field v-model="nuevo_mesero.mesero_fecha_nacimiento" label='Fecha de Nacimiento'>
                                    </v-text-field>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col cols='6'>
                                    <v-text-field v-model="nuevo_mesero.mesero_tel_propio" label='Telefono'>
                                    </v-text-field>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col cols='6'>
                                    <v-text-field v-model="nuevo_mesero.mesero_tel_emergencia" label='Tel. de emergencia'>
                                    </v-text-field>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col cols='6'>
                                    <v-text-field v-model="nuevo_mesero.mesero_dir" label='Dirección'>
                                    </v-text-field>
                                </v-col>
                            </v-row>
                            <v-row>
                                <v-col cols='6'>
                                    <v-text-field v-model="nuevo_mesero.mesero_activo" label='Activo'>
                                    </v-text-field>
                                </v-col>
                            </v-row>
                        </v-container>
                    </v-card-text>
                    <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn  color='success' @click="guardar()">Guardar</v-btn>
                    <v-btn  color='error' @click="cancelar()">Cancelar</v-btn>  
                    </v-card-actions>
        </v-card>
    </v-dialog>

    </v-container>
</template>

<script>
    export default {
        name: 'Meseros',

        data(){
            return {
                    encabezados: [
                        { text: 'Identificador', align: 'start', sortable: false, value: 'mesero_id',},
                        { text: 'Usuario', value: 'mesero_usuario' },
                        { text: 'Contraseña', value: 'mesero_contrasena' },
                        { text: 'Nombre', value: 'mesero_nombre' },
                        { text: 'Apellido Paterno', value: 'mesero_ap_pat' },
                        { text: 'Apellido Materno', value: 'mesero_ap_mat' },
                        { text: 'Fecha de Nacimiento', value: 'mesero_fecha_nacimiento' },
                        { text: 'Telefono', value: 'mesero_tel_propio'},
                        { text: 'Telefono de Emergencia', value: 'mesero_tel_emergencia'},
                        { text: 'Dirección', value: 'mesero_dir'},
                        { text: 'Activo', value: 'mesero_activo'},
                        { text: 'Acciones', value: 'actions'}
                    ],

                    meseros: [],

                    nl_dialog: false,

                    nuevo_mesero: {
                        mesero_nombre: '',
                        mesero_ap_pat: '',
                        mesero_ap_mat: '',
                        mesero_fecha_nacimiento: '',
                        mesero_tel_propio: '',
                        mesero_tel_emergencia: '',
                        mesero_dir: '',
                        usu_activo: ''
                    },
            }
        },

            created(){
                this.llenar_meseros();
            },

        methods: {
                async llenar_meseros(){
                    const api_data = await this.axios.get('/meseros/todos_los_meseros/');
                    this.meseros = api_data.data;
                },
            
                async eliminar_mesero(item){
                    const body = {mesero_id: item.mesero_id};
                    await this.axios.post('/meseros/eliminar_mesero/', body);
                    this.llenar_meseros();
                },


                async guardar(){
                    await this.axios.post('meseros/nuevo_mesero/', this.nuevo_mesero);
                    this.llenar_meseros();
                    this.cancelar();
                },

                cancelar(){
                    this.nuevo_mesero = {};
                    this.nl_dialog = false;
                },

        },
    }
</script>
