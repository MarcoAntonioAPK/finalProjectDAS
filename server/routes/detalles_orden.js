//Para hacer las consultas (tablas)

//Vamos a generar peticiones
const express = require('express');
//Para manejar las rutas para peticiones
const router = express.Router();

//Para conocer desde donde se hace la conexión
const connection = require('../connection');

//async: para decir que es una función asincrona
router.get('/detalles_ordenes', async (req,res) => {
    try{
        const query = 'SELECT '+
                            'd.det_ord_id, p.prod_id, '+
                            'p.prod_nombre, d.det_cantidad, d.det_subtotal, d.det_detalles, d.det_entregado '+
                            'FROM detalles_orden AS d '+
                            'INNER JOIN producto_menu AS p  '+
                            'ON d.det_ord_id = p.prod_id '+
                            'ORDER BY d.det_ord_id DESC' ;
        const detalles_orden = await connection.query(query);
        //Lo tranforma a formato .jason para poder manipularlo
        res.json(detalles_orden);
    } catch(error){
        return res.json({
            //nombre del atributo y lo que almacena
            error: error
        });
    }
});

router.post('/eliminar_detalles_de_orden', async (req,res) => {
    try{

        const det_ord_id = req.body.det_ord_id;
        const query = 'DELETE FROM detalles_orden WHERE det_ord_id = ?';
        //Ejecutar la consulta
        //await: para esperar a que termine
        const result = await connection.query(query, [det_ord_id]);
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