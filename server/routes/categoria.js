//Para hacer las consultas (tablas)

//Vamos a generar peticiones
const express = require('express');
//Para manejar las rutas para peticiones
const router = express.Router();

//Para conocer desde donde se hace la conexión
const connection = require('../connection');

//async: para decir que es una función asincrona
router.get('/todas_las_categorias', async (req,res) => {
    try{
          const query = 'SELECT * FROM categoria_producto';
        //Ejecutar la consulta
        //await: para esperar a que termine
        const categoria = await connection.query(query);
        //Lo tranforma a formato .jason para poder manipularlo
        res.json(categoria);
    } catch(error){
        return res.json({
            //nombre del atributo y lo que almacena
            error: error
        });
    }
});

router.post('/eliminar_categoria', async (req,res) => {
    try{

        const cat_id = req.body.cat_id;
        const query = 'DELETE FROM categoria_producto WHERE cat_id = ?';
        //Ejecutar la consulta
        //await: para esperar a que termine
        const result = await connection.query(query, [cat_id]);
        //Lo tranforma a formato .jason para poder manipularlo
        res.json('ok');
   
    } catch(error){
        return res.json({
            //nombre del atributo y lo que almacena
            error: error
        });
    }
});


router.post('/nueva_categoria', async (req,res) => {
    try{

        const body = req.body;
        const query = 'INSERT INTO categoria_producto (cat_tipo_producto, cat_descripcion) VALUES (?, ?)';
        //Ejecutar la consulta
        //await: para esperar a que termine
        const result = await connection.query(query, [body.cat_tipo_producto, body.cat_descripcion]);
        //Lo tranforma a formato .jason para poder manipularlo
        res.json('ok');
   
    } catch(error){
        return res.json({
            //nombre del atributo y lo que almacena
            error: error
        });
    }
});

router.post('/editar_categoria', async (req,res) => {
    try{

        const body = req.body;
        const query = 'INSERT INTO categoria_producto (cat_tipo_producto, cat_descripcion) VALUES (?, ?)';
        //Ejecutar la consulta
        //await: para esperar a que termine
        const result = await connection.query(query, [body.cat_tipo_producto, body.cat_descripcion]);
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