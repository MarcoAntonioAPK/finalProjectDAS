const express = require ('express');
const router = express.Router();

const connection = require('../connection');

router.get('/total_de_corte/', async(req,res) => { //Funcion asincrona
try{
    const query = ' SELECT SUM(ord_total_cuenta) AS Total '+
    ' FROM orden ';

                   
    const cortes = await connection.query(query);

    res.json(cortes);
}catch (error){
    return res.json({
        error: error
    });
}
});

module.exports = router;