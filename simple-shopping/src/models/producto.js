const db = require('../config/db');

const COLUMNAS = 'producto_id, nombre_prod, precio_venta, imagen';

exports.listar = async () => {
  const [filas] = await db.query(`SELECT ${COLUMNAS} FROM productos`);
  return filas;
};

exports.buscarPorIds = async (ids) => {
  if (ids.length === 0) return [];
  const [filas] = await db.query(
    `SELECT ${COLUMNAS} FROM productos WHERE producto_id IN (?)`,
    [ids]
  );
  return filas;
};
