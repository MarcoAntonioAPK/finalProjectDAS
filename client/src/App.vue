<template>
  <v-app>
    <v-app-bar
      app
      color="primary"
      dark
      height="100"
    >
    <v-spacer></v-spacer>
      <div class="d-flex align-center">
        <v-img
          alt="Vuetify Name"
          class="shrink hidden-sm-and-down"
          contain
          min-width="100"
          src="./assets/logo.png"
          width="100"
        />
      </div>
      <v-spacer></v-spacer>
    </v-app-bar>

    <v-main>
      <router-view/>
    </v-main>
    
  </v-app>
</template>

<script>

export default {
  name: 'App',

  data: () => ({
    //
  }),
};
</script>
