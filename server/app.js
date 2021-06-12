const express = require('express');
const app = express();
const morgan = require('morgan');
const cors = require('cors');
const path = require('path');
const history = require('connect-history-api-fallback');

app.use(cors());
app.use(morgan('tiny'));
app.use(history());

app.use(express.json());
app.use(express.urlencoded({extended: true}));
app.use(express.static(path.join(__dirname, 'public')));

//Esto debe de ir después de todo el middleware'


// API REST --> HTTP --->  Web.
// GET, POST -->  Enviar y recuperar información.
// GET --> No modifica el estado de la base de datos.
//   HEAD 
// POST --> Si modifica el estado de la base de datos.
//   PUT 

// Nuestra primera petición.
/*app.get('/', function(req, res){
    res.send('¡Hola mundo!');
});

app.get('/hola', function(req, res){
    res.send('¡Hola desde la otra!');
});*/

app.use('/administradores', require('./routes/administrador'));
app.use('/productos', require('./routes/producto_menu'));

//Decirle a nuestra API en qué pueto correr (escuchar)
app.listen(3000, function(){
    console.log('¡API está corriendo!');
}); 