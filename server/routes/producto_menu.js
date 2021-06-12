const express = require('express');
const router = express.Router();

const connection = require('../connection');

router.get('/todos_los_productos', async(req, res) => {
    // Función asincrona
    try{
        const query = 'SELECT * FROM producto_menu';
        const productos = await connection.query(query);

        res.json(productos);

    }catch(error){
        return res.json({
            error: error
        });
    }
});

router.post('/eliminar_producto', async(req, res) => { // POST --> Vamos a modificar la base.
    try{
        const prod_id = req.body.prod_id;
        const query = 'DELETE FROM producto_menu WHERE prod_id = ?';
        const result = await connection.query(query, [prod_id]);
        // connection.query(query);

        res.json('ok');

    }catch(error){
        return res.json({
            error: error
        });
    }
});

router.post('/nuevo_producto', async(req, res) => { // POST --> Vamos a modificar la base.
    try{
        const body = req.body;
        const query = 'INSERT INTO producto_menu(prod_nombre, prod_cat_id, prod_costo_unit) VALUES(?, ?, ?)';
        const result = await connection.query(query, [body.prod_nombre, body.prod_cat_id, body.prod_costo_unit]);


        res.json('ok');

    }catch(error){
        return res.json({
            error: error
        });
    }
});

module.exports = router;