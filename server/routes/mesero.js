const express = require('express');
const router = express.Router();

const connection = require('../connection');

router.get('/todos_los_meseros', async (req, res) => { // Función asíncrona
    try{
        const query = 'SELECT * FROM mesero';
        const meseros = await connection.query(query);

        res.json(meseros);
    } catch(error){
        return res.json({
            error: error
        });
    }
});

router.post('/nuevo_mesero', async (req, res) => { // POST--> vamos a realizar un cambio en la base
    try{
        const body = req.body;
        const query = 'INSERT INTO mesero (mesero_usuario, mesero_contrasena, mesero_nombre, mesero_ap_pat, mesero_ap_mat, mesero_fecha_nacimiento, mesero_fecha_contrato, mesero_genero, mesero_tel_propio, mesero_tel_emergencia, mesero_dir, mesero_activo) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
        const result = await connection.query(query, [body.mesero_usuario, body.mesero_contrasena, body.mesero_nombre, body.mesero_ap_pat, body.mesero_ap_mat, body.mesero_fecha_nacimiento, body.mesero_fecha_contrato, body.mesero_genero,body.mesero_tel_propio, body.mesero_tel_emergencia, body.mesero_dir, body.mesero_activo]);

        res.json('ok');
    } catch(error){
        return res.json({
            error: error
        });
    }
});

router.post('/eliminar_mesero', async (req, res) => { // POST--> vamos a realizar un cambio en la base
    try{
        const mesero_id = req.body.mesero_id;
        const query = `DELETE FROM mesero WHERE mesero_id = ?`;
        const result = await connection.query(query, [mesero_id]);

        res.json('ok');
    } catch(error){
        return res.json({
            error: error
        });
    }
});


module.exports = router;

