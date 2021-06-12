<template>
   <v-container>
            <v-data-table
                :headers="encabezados"
                :items="mesas"
                :items-per-page="5"
                >
                <template v-slot:top>
                    <v-toolbar flat>
                        <v-toolbar-title>Mesas</v-toolbar-title>
                        <v-spacer> </v-spacer>
                        <v-btn color = 'success' @click="nl_dialog = true"> Nueva Mesa</v-btn>
                    </v-toolbar>
                </template>

                <template v-slot:[`item.actions`]="{item}">
                    <v-icon @click="eliminar_mesa(item)" small class="mr-3">
                    fas fa-trash
                    </v-icon>
                    <v-icon @click="formEditar(item)" small >
                    fas fa-pencil-alt
                    </v-icon>
                </template>
           </v-data-table>

        <v-dialog v-model ='nl_dialog' max-width="500px" >
           <v-card>
                <v-card-title>
                    Nueva Mesa
                </v-card-title>
              <v-card-text>
                    <v-container>
                                <v-row>
                                <v-col cols ='6'>
                                        <v-text-field v-model="nueva_mesa.mesa_capacidad_personas" label='Capacidad de personas'>
                                        </v-text-field>
                                </v-col>
                                <v-col cols ='6'>
                                        <v-text-field v-model="nueva_mesa.mesa_area" label='Area de la mesa'>
                                        </v-text-field>
                                    </v-col>
                            </v-row>
                            <v-row>
                                <v-col cols ='6'>
                                    <v-text-field v-model="nueva_mesa.mesa_descripcion" label='Descripcion de la mesa'>
                                    </v-text-field>
                                </v-col>
                            </v-row>
                    </v-container>
               </v-card-text>
               <v-card-actions>
                    <v-spacer></v-spacer>
                        <v-btn color ='success' @click="guardar()" type="submit" >Guardar</v-btn>
                        <v-btn color ='error' @click="cancelar()">Cancelar</v-btn>
                    <v-spacer></v-spacer>
               </v-card-actions>
             </v-card> 
        </v-dialog>
    </v-container>
</template>

<script>

export default {
    
        name: 'Mesas',

        data(){
            return{
                encabezados: [
          
                { text: 'Identificador', align: 'start', sortable: false, value: 'mesa_id',},
                { text: 'Capacidad de personas', value: 'mesa_capacidad_personas' },
                { text: 'Area de la mesa', value: 'mesa_area' },
                { text: 'Descripcion de la mesa', value: 'mesa_descripcion' },
                {text: 'Acciones', value: 'actions'}
          
        ],

                mesas: [],
               

                nl_dialog: false,
                

                 nueva_mesa: {
                    mesa_capacidad_personas: '',
                    mesa_area: '',
                    mesa_descripcion: '',
                    
                },
                 

            }
         },

        created(){
            this.llenar_mesas();
            
        },
        methods: { 
             async llenar_mesas(){
             const api_data = await this.axios.get('/mesas/todas_las_mesas/');
              this.mesas = api_data.data;
             },

                async eliminar_mesa(item){
                  const body = {
                    mesa_id:  item.mesa_id
                     };
                    await this.axios.post('/mesas/eliminar_mesa/', body);
                    this.llenar_mesas(); 
                 },

                cancelar(){
                    this.nueva_mesa ={}; //se vasea la informacion
                    this.nl_dialog = false; //se cierra el dialogo
                },

                async guardar(){
                    await this.axios.post('/mesas/nueva_mesa/', this.nueva_mesa);
                    this.llenar_mesas(); //se actualiza
                    this.cancelar(); //se vacea y se cierra 
                },

                 async FormEditar(item){ 
                
                this.nl_dialog=true;
                    
                }


        },
    
}
</script>