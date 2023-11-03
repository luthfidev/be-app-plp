require('dotenv').config()
const PORT = process.env.PORT || 7000
const express = require('express')
const bodyparser = require('body-parser')
const cors = require('cors')
const app = express()
const helmet = require('helmet')

app.use(bodyparser.json())
app.use(bodyparser.urlencoded({ extended: true }))
app.use('/uploads', express.static('uploads'))
app.use(cors())
app.use(helmet())

app.get('/', (req, res) => {
  const data = {
    name: 'Welcome to Aplikasi pembayaran listrik pascabayar',
    version: '1.0.0'
  }
  res.send(data)
})

const auth = require('./src/routes/auth')
const users = require('./src/routes/users')
const pelanggan = require('./src/routes/pelanggan')
const transactions = require('./src/routes/transactions')

app.use('/auth', auth)
app.use('/users', users)
app.use('/pelanggan', pelanggan)
app.use('/transactions', transactions)

app.get('*', (req, res) => {
  res.status(404).send('Page not found')
})

app.listen(PORT, () => {
  console.log('Server running')
})

module.exports = app
