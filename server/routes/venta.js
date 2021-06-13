
const express = require ('express');
const router = express.Router();

const connection = require('../connection');

router.get('/todas_las_ventas/', async(req,res) => { //Funcion asincrona
try{
    const query = 'SELECT ord_fecha_dia AS Fecha , SUM(ord_total_cuenta) AS Total '+
	    'FROM orden '+
        'GROUP BY ord_fecha_dia '+
        'ORDER BY ord_fecha_dia DESC ';
                   
    const ventas = await connection.query(query);

    res.json(ventas);
}catch (error){
    return res.json({
        error: error
    });
}
});

module.exports = router;