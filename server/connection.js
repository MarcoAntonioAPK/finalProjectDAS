const mysql = require('mysql');
const { promisify } = require('util');

// Configurar la conexión a la base de datos.
const connection = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'restaurante_db'
});


connection.getConnection(
    (err, conn)=> {
        if(err){
            console.log('Problema para conecta a la DB');
        }
        if(conn){
            console.log('¡DB conectada');
        }
        return;
    }
);

connection.query = promisify(connection.query);

module.exports = connection;