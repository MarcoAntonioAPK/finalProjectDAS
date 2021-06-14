<template  >
  <v-container fill-height fluid>
    <v-row align="center" justify="space-around" class="mt-50">
      <router-link to ='nueva_orden'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Nueva Orden
        </v-btn>
      </router-link>
      <router-link to ='/'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Editar Orden
        </v-btn>
      </router-link>
      <router-link to ='menu'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Menú
        </v-btn>
      </router-link>
      
    </v-row>

    <v-row align="center" justify="space-around" class="mt-50">        
      <router-link to ='/'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Total de Cuenta Ord.
        </v-btn>
      </router-link>
      <router-link to ='/'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Ord. Vida
        </v-btn>
      </router-link>
      <router-link to ='/'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75"  id="ir">   
          Ord. Abiertas
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