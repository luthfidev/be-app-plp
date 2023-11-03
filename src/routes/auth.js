const router = require('express').Router()
const authController = require('../controllers/auth')
const verify = require('../utils/verifyToken')
const { authValidationRules, validate } = require('../utils/validators')

router.post('/signin',
  // authValidationRules(),
  // validate,
  authController.signIn)
  .post('/signup',
    // authValidationRules(),
    // validate,
    authController.signUp)

module.exports = router
