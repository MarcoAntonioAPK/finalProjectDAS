<template>
    <v-container fill-height fluid >
        <v-row align="center" justify= "space-around"> 
            <v-card>
                <v-card-title>
                    El Total de Venta es:
                </v-card-title>
                <v-card-text >
                  {{cortes}}
                </v-card-text>
        </v-card>
        </v-row>
    </v-container>
</template>

<script>
  export default {
    name: 'Cortes',

        data() {
          return{
            

            cortes:[],
                
          }
         
    },
    created()
    {
      this.llenar_dato();
    },
          

       methods:{

          async llenar_dato(){
             const api_data = await this.axios.get('/cortes/total_de_corte');
              this.cortes = api_data.data; //los datos de extraccion se guardan en la variable appi_data
             }
       },
        
}

</script>