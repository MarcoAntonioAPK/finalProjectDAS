const express = require ('express');
const router = express.Router();

const connection = require('../connection');

router.get('/todas_las_mesas',async(req,res) => { //Funcion asincrona
    try{
        const query = 'SELECT * FROM mesa ';
        const mesas = await connection.query(query);

        res.json(mesas);
    }catch (error){
        return res.json({
            error: error
        });
    }
});
router.post('/eliminar_mesa',async(req,res) => { //Post ---> vamos a cambiar la base
    try{
       const mesa_id = req.body.mesa_id;
       const query ='DELETE FROM mesa WHERE mesa_id = ?';
      const result = await connection.query(query, [mesa_id]);

        res.json('ok');
    }catch (error){
        return res.json({
            error: error
        });
    }

});

router.post('/nueva_mesa', async(req, res) => { //Post ---> vamos a cambiar la base
    try{
       const body = req.body;
       const query ='INSERT INTO mesa (mesa_capacidad_personas, mesa_area, mesa_descripcion) VALUES(?, ?, ? )';
      const result = await connection.query(query, [body.mesa_capacidad_personas, body.mesa_area, body.mesa_descripcion]);

        res.json('ok');
    }catch (error){
        return res.json({
            error: error
        });
    }

});

router.post('/editada_mesa', async(req, res) => { //Post ---> vamos a cambiar la base
    try{
       const body = req.body;
       const query ='UPDATE mesa (mesa_capacidad_personas, mesa_area, mesa_descripcion) VALUES(?, ?, ? )';
      const result = await connection.query(query, [body.mesa_capacidad_personas, body.mesa_area, body.mesa_descripcion]);

        res.json('ok');
    }catch (error){
        return res.json({
            error: error
        });
    }

});


module.exports = router;