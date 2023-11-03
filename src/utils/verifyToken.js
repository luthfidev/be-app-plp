const jwt = require('jsonwebtoken')
const verifyToken = async (req, res, next) => {
  const bearerHeader = req.header('Authorization')
  if (!bearerHeader || bearerHeader.indexOf(' ') === -1) {
    const data = {
      success: false,
      message: 'Missing Authorization Header'
    }
    return res.status(401).send(data)
  }
  const token = bearerHeader.split(' ')[1]

  const data = {
    success: false,
    message: 'Access Denied'
  }
  if (!token) return res.status(401).send(data)

  try {
    const verified = jwt.verify(token, process.env.TOKEN_SECRET)
    req.payload = verified
    next()
  } catch (error) {
    const data = {
      success: false,
      message: 'Invalid Token'
    }
    res.status(400).send(data)
  }
}

module.exports = verifyToken
