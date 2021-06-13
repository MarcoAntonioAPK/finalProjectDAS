const express = require('express');
const router = express.Router();

const connection = require('../connection');

router.get('/ordenes_no_entregadas', async(req, res)=>{//función asíncronica
try{
    const query = 'SELECT' +
                    ' orden.ord_id, orden.ord_mesa_id, producto_menu.prod_nombre, ' +
                    'detalles_orden.det_cantidad, detalles_orden.det_detalles, detalles_orden.det_entregado ' +
                    ' FROM orden, detalles_orden, producto_menu ' +
                    ' WHERE det_ord_id = ord_id AND det_prod_id = prod_id AND ord_estado = "Abierta" AND det_entregado = "No" ' +
	                ' ORDER BY ord_id';
    const orden_no_entregada = await connection.query(query);

    res.json(orden_no_entregada);

    }catch(error){
        console.log(error);
    return res.json({
    error: error
    });
   }
});


module.exports =router;