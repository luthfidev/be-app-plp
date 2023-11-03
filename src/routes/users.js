const router = require('express').Router()
const usersController = require('../controllers/users')
// const verify = require('../utils/verifyToken')
// const checkRole = require('../utils/roles')

router
  .post('/detail',
    usersController.detailUser)

module.exports = router
