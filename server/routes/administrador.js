const express = require('express');
const router = express.Router();

const connection = require('../connection');

router.get('/todos_los_administradores', async(req, res) => {
    // Función asincrona
    try{
        const query = 'SELECT * FROM administrador';
        const administradores = await connection.query(query);

        res.json(administradores);

    }catch(error){
        return res.json({
            error: error
        });
    }
});

router.post('/eliminar_administrador', async(req, res) => { // POST --> Vamos a modificar la base.
    try{
        const adm_id = req.body.adm_id;
        const query = 'DELETE FROM administrador WHERE adm_id = ?';
        const result= await connection.query(query, [adm_id]);

        res.json('ok');

    }catch(error){
        return res.json({
            error: error
        });
    }
});

router.post('/nuevo_administrador', async(req, res) => { // POST --> Vamos a modificar la base.
    try{
        const body = req.body;
        const query = 'INSERT INTO administrador(adm_usuario, adm_contrasena) VALUES(?, ?)';
        const result= await connection.query(query, [body.adm_usuario, body.adm_contrasena]);
        

        res.json('ok');

    }catch(error){
        return res.json({
            error: error
        });
    }
});

module.exports = router;