const db = require('../config/db');

exports.listar = async () => {
  const [filas] = await db.query('SELECT cliente_id, nombre, apellido1 FROM clientes');
  return filas;
};
