<template  >
  <v-container fill-height fluid>
    <v-row align="center" justify="space-around" class="mt-50">
      <router-link to ='administradores'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Editar Administradores
        </v-btn>
      </router-link>
      <router-link to ='meseros'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Editar Meseros
        </v-btn>
      </router-link>
      <router-link to ='categoria'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Editar Categoria Prod.
        </v-btn>
      </router-link>
      
    </v-row>

    <v-row align="center" justify="space-around" class="mt-50">        
      <router-link to ='mesas'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Editar Mesa
        </v-btn>
      </router-link>
      <router-link to ='productos'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Editar Prod. Menú
        </v-btn>
      </router-link>
      <router-link to ='ordenes'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75"  id="ir">   
          Editar Órdenes
        </v-btn>
      </router-link>
    </v-row>

    <v-row align="center" justify="space-around" class="mt-50">
      <router-link to ='detalles_orden'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Editar Det. Órd.
        </v-btn>
      </router-link>
      <router-link to ='ventas'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Historial de Ventas/Dia
        </v-btn>
      </router-link>
      <router-link to ='cortes'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Corte All
        </v-btn>
      </router-link>
    </v-row>
  </v-container>
</template>


<script>
    export default{
        name: 'BotonesAdministrador',
        
        data(){
          return{

          }
        },

        methods: {
            
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