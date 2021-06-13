const express = require('express');
const router = express.Router();

const connection = require('../connection');

router.get('/todas_las_ordenes_abiertas', async(req, res) => {
    // Función asincrona
    try{
        const query = 'SELECT * '+
                        'FROM orden '+
                        'WHERE ord_estado = "Abierta" ';
        const administradores = await connection.query(query);

        res.json(administradores);

    }catch(error){
        return res.json({
            error: error
        });
    }
});

router.post('/nueva_orden', async(req, res) => { // POST --> Vamos a modificar la base.
    try{
        const body = req.body;
        const query = 'INSERT INTO orden (ord_fecha, ord_mesero_id, ord_mesa_id, ord_estado, ord_detalles, ord_total_cuenta) '+
                        'VALUES(?,?,?,?,?,?)';
        const result= await connection.query(query, [body.ord_fecha, body.ord_mesero_id, body.ord_mesa_id, body.ord_estado, body.ord_detalles, body.ord_total_cuenta]);
        

        res.json('ok');

    }catch(error){
        return res.json({
            error: error
        });
    }
});

module.exports = router;