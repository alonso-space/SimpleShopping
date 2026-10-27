const hbs = require('hbs');

hbs.registerHelper('clp', (n) => '$' + Number(n).toLocaleString('es-CL'));
