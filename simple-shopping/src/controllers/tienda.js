const Producto = require('../models/producto');

exports.inicio = async (req, res) => {
  const productos = await Producto.listar();
  res.render('productos', { productos });
};
