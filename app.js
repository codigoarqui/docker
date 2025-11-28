const express = require('express')
const app = express()
const port = process.env.PORT

app.get('/', (req, res) => {
  res.send('¡Hola! Esta es mi primera imagen propia en Docker 🐳')
})

app.listen(port, () => {
  console.log(`La aplicación está escuchando en el puerto ${port}`)
})
