<template>
    <v-container fill-height fluid>
        <v-row align="center" justify="center">
               <v-col align="center" justify="center">
                    <v-card
                    class="mx-auto px-5 py-5"
                    max-width="344"
                    >
                         <v-card-title>
                              Iniciar Sesión
                         </v-card-title>

                         <v-card-text>
                              <v-form v-model="login_form" >
                                   <v-text-field v-model="usuario" label="Usuario"></v-text-field>
                                   <v-text-field @keyup.enter= "login()" label="Contraseña"></v-text-field>
                              </v-form>
                         </v-card-text>

                         <v-card-actions>
                              <v-btn @click="login()" :disabled="!login_form" class="my-3" block small color="primary">Iniciar Sesión</v-btn>
                         </v-card-actions>

                    </v-card>
               </v-col>
          </v-row>
    </v-container>
</template>

<script>
import router from '../router';
export default {
    name: 'LoginMesero',
    data(){
        return{
            login_form: false,
            usuario: "",
            contrasena: "",
            error: false,
            mensaje_error: "",
        }
    },
    methods:{
        login(){
             router.push({ path: '/acciones_mesero' })
        }
    },
 
}
</script>

<style scoped>
#ir{
    color: #FFF;
    text-decoration: none;
    font-size: 30px;
}
</style>