<template  >
  <v-container fill-height fluid>
    <v-row align="center" justify="space-around" class="mt-50">
      <router-link to ='login_administrador' id="ir">
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75"   id="ir">   
          Administrador
        
        </v-btn>
      </router-link>
      <router-link to ='/login_mesero' id="ir">
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75"  id="ir">   
          Mesero
        </v-btn>
      </router-link>
      <router-link to ='menu'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75"  id="ir">   
          Menú
        </v-btn>
      </router-link>

      <router-link to ='cocina'>
        <v-btn color="secondary" elevation="15" large x-large x-small rounded height="75" id="ir">   
          Vista Cocina
        </v-btn>
      </router-link>
    </v-row>
  </v-container>
</template>

<script>
  export default {
    name: 'Home',

    components: {
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