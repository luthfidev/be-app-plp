const router = require('express').Router()
const pelangganController = require('../controllers/pelanggan')
// const checkRole = require('../utils/roles')
// const cekBiodata = require('../utils/cekBiodata')
// const verify = require('../utils/verifyToken')
// const { authorValidationRules, validate } = require('../utils/validators')

router.get('/',
  pelangganController.getAllPelanggan)
  .post('/',
    // verify,
    // checkRole('admin'),
    pelangganController.createPelanggan)
  .post('/detail',
    // verify,
    // checkRole('admin'),
    pelangganController.detailPelanggan)
  .post('/update',
    // verify,
    // checkRole('admin'),
    pelangganController.updatePelanggan)
  .delete('/:id',
    // verify,
    // checkRole('admin'),
    pelangganController.deletePelanggan)

module.exports = router
