const express = require('express');
const router = express.Router();

const connection = require('../connection');

router.get('/todas_las_ordenes', async(req, res)=>{//función asíncronica
try{
    const query = 'SELECT * FROM orden';
    const orden = await connection.query(query);
    res.json(orden);
    }catch(error){
        return res.json({
        error: error
    });
   }
});

router.get('/buscar_orden_de_mesero_vida/:ord_mesero_id', async(req, res)=>{
    try{
        const ord_mesero_id = req.params.ord_mesero_id;
        const query =   'SELECT orden.* '+
                        'FROM orden '+
                        'INNER JOIN mesero '+
                            'ON orden.ord_mesero_id = mesero.mesero_id '+
                        'WHERE mesero.mesero_id = 1 '+
                            'ORDER BY orden.ord_fecha_dia DESC';
    
        const orden = await connection.query(query,[ord_mesero_id]);
        console.log(orden);
        res.json(orden);
    }catch(error){
        return res.json({
        error: error
    });
       }
    
    });

module.exports =router;