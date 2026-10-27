const Compra = require('../models/compra');
const Carrito = require('../services/carrito');

exports.finalizar = async (req, res) => {
  const { cliente_id, tipo_pago } = req.body;
  const datos = await Carrito.calcular(req.session.carrito);

  if (datos.items.length === 0 || !cliente_id || !tipo_pago) {
    return res.redirect('/carrito');
  }

  const compraId = await Compra.crear({
    clienteId: cliente_id,
    iva: datos.iva,
    total: datos.total,
    tipoPago: tipo_pago,
    items: datos.items,
  });

  req.session.carrito = {};
  res.redirect('/resumen/' + compraId);
};

exports.resumen = async (req, res) => {
  const compra = await Compra.buscarPorId(req.params.id);
  if (!compra) return res.redirect('/');

  const items = await Compra.detalle(req.params.id);
  res.render('resumen', {
    compra,
    items,
    unidades: items.reduce((s, i) => s + i.cantidad, 0),
    subtotal: compra.total_pagar - compra.iva,
  });
};
