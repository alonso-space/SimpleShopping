const Producto = require('../models/producto');
const { iva: tasaIva } = require('../config');

exports.agregar = (carrito, id) => {
  carrito[id] = (carrito[id] || 0) + 1;
};

exports.contarUnidades = (carrito) =>
  Object.values(carrito).reduce((suma, c) => suma + c, 0);

exports.calcular = async (carrito) => {
  const productos = await Producto.buscarPorIds(Object.keys(carrito));

  const items = productos.map((p) => {
    const cantidad = carrito[p.producto_id];
    return { ...p, cantidad, subtotal: p.precio_venta * cantidad };
  });

  const subtotal = items.reduce((s, i) => s + i.subtotal, 0);
  const iva = Math.round(subtotal * tasaIva);

  return {
    items,
    subtotal,
    iva,
    total: subtotal + iva,
    unidades: exports.contarUnidades(carrito),
  };
};
