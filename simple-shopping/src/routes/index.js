const router = require('express').Router();
const wrap = require('../utils/asyncHandler');
const tienda = require('../controllers/tienda');
const carrito = require('../controllers/carrito');
const compra = require('../controllers/compra');

router.get('/', wrap(tienda.inicio));

router.get('/carrito', wrap(carrito.ver));
router.post('/agregar/:id', carrito.agregar);
router.post('/vaciar', carrito.vaciar);

router.post('/finalizar', wrap(compra.finalizar));
router.get('/resumen/:id', wrap(compra.resumen));

module.exports = router;
