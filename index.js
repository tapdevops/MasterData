const express = require('express')

// nilai constant untuk port & host
const PORT = 8080
const HOST = '0.0.0.0'

// variabel app yang mereferensi ke express
const app = express()

// route public `/` yang mengembalikan respons string `Hello World`
app.get('/', (req, res) => {
  res.send('Hello World')
})

// listen untuk menjalakan express
app.listen(PORT, HOST, () => {
  console.log(`Running on http://${HOST}:${PORT}`)
})
