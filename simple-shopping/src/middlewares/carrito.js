const Carrito = require('../services/carrito');

module.exports = (req, res, next) => {
  if (!req.session.carrito) req.session.carrito = {};
  res.locals.cantidadCarrito = Carrito.contarUnidades(req.session.carrito);
  next();
};
