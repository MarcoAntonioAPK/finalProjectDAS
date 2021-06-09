<template  >
  <v-container fill-height fluid>
    <v-row align="center" justify="space-around" class="mt-50">
      <v-btn color="primary" elevation="15" large x-large x-small rounded height="75" >   
        <router-link to ='/' id="ir">
          Administrador
        </router-link>
      </v-btn>

      <v-btn color="primary" elevation="15" large x-large x-small rounded height="75">   
        <router-link to ='/' id="ir">
          Mesero
        </router-link>
      </v-btn>

      <v-btn color="primary" elevation="15" large x-large x-small rounded height="75">   
        <router-link to ='/' id="ir">
          Menú
        </router-link>
      </v-btn>

      <v-btn color="primary" elevation="15" large x-large x-small rounded height="75">   
        <router-link to ='/' id="ir">
          Vista Cocina
        </router-link>
      </v-btn>
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