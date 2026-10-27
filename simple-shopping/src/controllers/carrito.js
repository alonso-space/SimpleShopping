const Cliente = require('../models/cliente');
const Carrito = require('../services/carrito');

exports.ver = async (req, res) => {
  const [datos, clientes] = await Promise.all([
    Carrito.calcular(req.session.carrito),
    Cliente.listar(),
  ]);
  res.render('carrito', { ...datos, clientes, vacio: datos.items.length === 0 });
};

exports.agregar = (req, res) => {
  Carrito.agregar(req.session.carrito, req.params.id);
  res.redirect('/');
};

exports.vaciar = (req, res) => {
  req.session.carrito = {};
  res.redirect('/carrito');
};
