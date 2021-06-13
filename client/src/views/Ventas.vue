<template>
  <v-container>
     <v-data-table 
     :headers="encabezados"
     :items="ventas"
     :items-per-page="5">
     </v-data-table>
  </v-container>
</template>

<script>



  export default {
    name: 'Ventas',

        data() {
          return{
            encabezados: [
          
          { text: 'Fecha de venta', value : 'Fecha' },
          { text: 'Total de cuenta', value : 'Total' },
          
            ],

            ventas:[],
                
          }
         
    },
    created()
    {
      this.llenar_datos();
    },
          

       methods:{

          async llenar_datos(){
             const api_data = await this.axios.get('/ventas/todas_las_ventas/');
              this.ventas = api_data.data; //los datos de extraccion se guardan en la variable appi_data
             }
       },
        
}

</script>