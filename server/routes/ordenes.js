//Para hacer las consultas (tablas)

//Vamos a generar peticiones
const express = require('express');
//Para manejar las rutas para peticiones
const router = express.Router();

//Para conocer desde donde se hace la conexión
const connection = require('../connection');

//async: para decir que es una función asincrona
router.get('/todas_las_ordenes', async (req,res) => {
    try{
        const query = 'SELECT '+
                            'o.ord_id, m.mesero_id, CONCAT_WS(\' \', m.mesero_nombre, m.mesero_ap_pat, m.mesero_ap_mat) AS mese_nom_comp, '+
                            'o.ord_fecha_dia, o.ord_fecha_hora, o.ord_mesa_id, o.ord_estado, o.ord_detalles, o.ord_total_cuenta '+
                            'FROM orden AS o '+
                            'INNER JOIN mesero AS m  '+
                            'ON o.ord_id = m.mesero_id ';
        const ordenes = await connection.query(query);
        //Lo tranforma a formato .jason para poder manipularlo
        res.json(ordenes);
    } catch(error){
        return res.json({
            //nombre del atributo y lo que almacena
            error: error
        });
    }
});

router.post('/eliminar_orden', async (req,res) => {
    try{

        const ord_id = req.body.ord_id;
        const query = 'DELETE FROM orden WHERE ord_id = ?';
        //Ejecutar la consulta
        //await: para esperar a que termine
        const result = await connection.query(query, [ord_id]);
        //Lo tranforma a formato .jason para poder manipularlo
        res.json('ok');
   
    } catch(error){
        return res.json({
            //nombre del atributo y lo que almacena
            error: error
        });
    }
});



//Para que mande llamar la petición
module.exports = router