exports.noEncontrado = (req, res) => res.status(404).send('Página no encontrada');

exports.error = (err, req, res, next) => {
  console.error(err);
  res.status(500).send('Error interno del servidor');
};
