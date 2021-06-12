const express = require('express');
const router = express.Router();

const connection = require('../connection');

router.get('/todo_el_menu', async(req, res)=>{//función asíncronica
try{
    const query = 'SELECT'+
                    ' p.prod_id, p.prod_nombre, p.prod_costo_unit, c.cat_tipo_producto, c.cat_descripcion'+
                    ' FROM producto_menu AS p'+
                    ' INNER JOIN categoria_producto AS c'+
	                ' ON p.prod_cat_id = c.cat_id';
    const producto_menu = await connection.query(query);

    res.json(producto_menu);
    }catch(error){
        console.log(error);
    return res.json({
    error: error
    });
   }
});


module.exports =router;