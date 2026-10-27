const db = require('../config/db');

exports.crear = async ({ clienteId, iva, total, tipoPago, items }) => {
  const conn = await db.getConnection();
  try {
    await conn.beginTransaction();

    const [r] = await conn.query(
      `INSERT INTO compras (cliente_id, iva, total_pagar, total_descuento, tipo_pago, num_serie)
       VALUES (?, ?, ?, 0, ?, ?)`,
      [clienteId, iva, total, tipoPago, 'V-' + Date.now()]
    );

    for (const i of items) {
      await conn.query(
        `INSERT INTO detalles_compras (producto_id, compra_id, cantidad, precio, descuento)
         VALUES (?, ?, ?, ?, 0)`,
        [i.producto_id, r.insertId, i.cantidad, i.precio_venta]
      );
    }

    await conn.commit();
    return r.insertId;
  } catch (err) {
    await conn.rollback();
    throw err;
  } finally {
    conn.release();
  }
};

exports.buscarPorId = async (id) => {
  const [filas] = await db.query(
    `SELECT c.*, cl.nombre, cl.apellido1
       FROM compras c JOIN clientes cl ON cl.cliente_id = c.cliente_id
      WHERE c.compra_id = ?`,
    [id]
  );
  return filas[0];
};

exports.detalle = async (id) => {
  const [filas] = await db.query(
    `SELECT p.nombre_prod, d.cantidad, d.precio, d.cantidad * d.precio AS subtotal
       FROM detalles_compras d JOIN productos p ON p.producto_id = d.producto_id
      WHERE d.compra_id = ?`,
    [id]
  );
  return filas;
};
