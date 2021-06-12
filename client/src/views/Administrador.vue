<template>
    <v-container >
        <v-data-table
            :headers="encabezados"
            :items="administradores"
            :items-per-page="5"
        >
            <template v-slot:top>
                <v-toolbar flat>
                    <v-toolbar-title>Administradores</v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-btn color= 'success' @click="nl_dialog= true">Nuevo Administrador</v-btn>
                </v-toolbar>
            </template>

            <template v-slot:[`item.actions`]="{item}">
                <v-icon @click="eliminar_administrador(item)" small>
                    far fa-trash-alt
                </v-icon>
            </template>
        </v-data-table>

        <v-dialog v-model= 'nl_dialog' max-width= '500px'>
            <v-card>
                <v-card-title>
                    Nuevo Administrador
                </v-card-title>
                <v-card-text>
                    <v-container>
                        <v-row>
                            <v-col cols= '6'>
                                <v-text-field v-model= "nuevo_administrador.adm_usuario" label= 'Usuario'> </v-text-field>
                            </v-col>
                            <v-col cols= '6'>
                            <v-text-field v-model= "nuevo_administrador.adm_contrasena" label= 'Contrasena'> </v-text-field>
                            </v-col>
                        </v-row>
                    </v-container>
                </v-card-text>

                <v-card-actions>
                <v-spacer></v-spacer>
                <v-btn color= 'success' @click= "guardar()"> Guardar</v-btn>
                <v-btn color= 'error' @click= "cancelar()">Cancelar</v-btn>
                <v-spacer></v-spacer>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-container>

</template>

<script>
export default {
    name: 'Administrador',

    data(){
        return{
          encabezados: [
            { text: 'Identificador', align: 'start', sortable: false, value: 'adm_id',},
            { text: 'Administrador', value: 'adm_usuario' },
            { text: 'Contrasena', value: 'adm_contrasena' },
            { text: 'Acciones', value: 'actions'},
            ],

            administradores: [],

            nl_dialog: false,

            nuevo_administrador: {
            adm_usuario: '',
            adm_contrasena: '',
            }

        }
    },

    created(){
        this.llenar_administradores();
    },

    methods:{
        async llenar_administradores(){
            const api_data = await this.axios.get('/administradores/todos_los_administradores');
            this.administradores = api_data.data;
      },

        async eliminar_administrador(item){
            const body = {
            usu_id: item.adm_id
            };
            const data= await this.axios.post('/administradores/eliminar_administrador', body);

            this.llenar_administradores();
        },

        cancelar(){
            this.nuevo_administrador = {};
            this.nl_dialog = false;
        },

        async guardar(){
            await this.axios.post('/administradores/nuevo_administrador/', this.nuevo_administrador);
            this.llenar_administradores();
            this.cancelar();
        },
    },

}
</script>