const { body, validationResult } = require('express-validator')

// auth
const authValidationRules = () => {
  return [
    body('email').isEmail().withMessage('Must be Email'),
    body('password').isLength({ min: 2 }).withMessage('Min password 2 character')
  ]
}

// author
const authorValidationRules = () => {
  return [
    body('name').isLength({ max: 25 }).withMessage('Max character 25'),
    body('description').isLength({ min: 5 })
      .isLength({ max: 100 }).withMessage('Max character 100')
  ]
}

// genre
const genreValidationRules = () => {
  return [
    body('name').isLength({ max: 25 }).withMessage('Max character 25'),
    body('description').isLength({ min: 5 })
      .isLength({ max: 100 }).withMessage('Max character 100')
  ]
}

// book
const bookValidationRules = () => {
  return [
    body('title').isLength({ max: 25 }).withMessage('Max character 25'),
    body('description').isLength({ min: 5 })
      .isLength({ max: 100 }).withMessage('Max character 100'),
    body('genre_id').isInt({ min: 1 }),
    body('author_id').isInt({ min: 1 }),
    body('release_date').isLength({ min: 5 }),
    body('status_id').isIn(['1', '2'])
  ]
}

// transaction
const transactionValidationRules = () => {
  return [
    body('transaction_date').isLength({ max: 25 }).withMessage('Max character 25'),
    body('user_id').isNumeric().withMessage('User id must be Numeric'),
    body('book_id').isNumeric().withMessage('must be numeric'),
    body('status_id').isNumeric().withMessage(' must be numeric')
  ]
}

// transaction user
const transactionUserValidationRules = () => {
  return [
    body('transaction_date').isLength({ max: 25 }).withMessage('Max character 25'),
    body('book_id').isNumeric().withMessage('must be numeric')
  ]
}

const validate = (request, response, next) => {
  const errors = validationResult(request)
  if (errors.isEmpty()) {
    return next()
  }
  const extractedErrors = []
  errors.array().map(err => extractedErrors.push({ [err.param]: err.msg }))

  const data = {
    success: false,
    message: extractedErrors
  }
  return response.status(400).send(data)
}

module.exports = {
  authValidationRules,
  authorValidationRules,
  genreValidationRules,
  bookValidationRules,
  transactionValidationRules,
  transactionUserValidationRules,
  validate
}
