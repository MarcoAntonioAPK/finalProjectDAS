const express = require('express');
const router = express.Router();

const connection = require('../connection');


router.get('/mostrar_ticket/:ord_id', async(req, res)=>{//función asíncronica
    try{
        const ord_id = req.params.ord_id;
        const query = 'SELECT producto_menu.prod_nombre, producto_menu.prod_costo_unit, '+
		                'detalles_orden.det_cantidad, detalles_orden.det_subtotal '+
	                    'FROM orden '+
	                    'INNER JOIN detalles_orden '+
		                'ON detalles_orden.det_ord_id = orden.ord_id '+
	                    'INNER JOIN producto_menu '+
		                'ON producto_menu.prod_id = detalles_orden.det_prod_id '+ 
                        'AND producto_menu.prod_costo_unit '+
	                    'WHERE orden.ord_id = ?';

        const result = await connection.query(query, [ord_id]);
        res.json(result);

        }catch(error){
            console.log(error);
            return res.json({
                error: error
        });
   }
});

router.get('/total/:ord_id', async(req, res)=>{//función asíncronica
    try{
        const ord_id = req.params.ord_id;
        const query = 'SELECT SUM(detalles_orden.det_subtotal) AS \' $\' ' +
                        'FROM detalles_orden ' +
                        'INNER JOIN orden ' +
                        'ON orden.ord_id = det_ord_id ' +
                        'WHERE orden.ord_id = ? ';

        const result = await connection.query(query, [ord_id]);
        res.json(result);

        }catch(error){
            console.log(error);
            return res.json({
                error: error
        });
   }
});


module.exports =router;