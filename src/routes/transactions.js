const router = require('express').Router()
const checkRole = require('../utils/roles')
const verify = require('../utils/verifyToken')
const cekBiodata = require('../utils/cekBiodata')
const transactionController = require('../controllers/transactions')
// const {
//   transactionValidationRules,
//   transactionUserValidationRules,
//   validate
// } = require('../utils/validators')

router
  .post('/pelanggan/update-saldo',
    transactionController.updateSaldoPelanggan)
  .get('/tagihan', 
    transactionController.getAllTagihan)
  .post('/tagihan-by-pelanggan',
    transactionController.detailTagihanByPelanggan)
  .post('/hitung-tagihan',
    transactionController.hitungTagihan)
  .get('/bayar', 
    transactionController.getAllPembayaran)
  .post('/bayar-tagihan', 
    transactionController.bayarTagihan)

module.exports = router
