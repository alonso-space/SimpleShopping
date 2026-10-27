const express = require('express');
const session = require('express-session');
const path = require('path');
const config = require('./src/config');
const routes = require('./src/routes');
const carritoMiddleware = require('./src/middlewares/carrito');
const { noEncontrado, error } = require('./src/middlewares/errores');
require('./src/helpers/hbs');

const app = express();

app.set('view engine', 'hbs');
app.set('views', path.join(__dirname, 'src/views'));

app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'src/public')));
app.use(session({ secret: config.sessionSecret, resave: false, saveUninitialized: true }));
app.use(carritoMiddleware);

app.use(routes);
app.use(noEncontrado);
app.use(error);

app.listen(config.port, () => console.log(`Tienda en http://localhost:${config.port}`));
