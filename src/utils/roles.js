// 1 Admin
// 2 User

const permit = (...allowed) => {
  const isAllowed = role => allowed.indexOf(role) > -1
  return (req, res, next) => {
    const role = req.payload.role
    if (role && isAllowed(role)) {
      next()
    } else {
      const data = {
        susccess: false,
        message: 'Not Allowed'
      }
      res.status(401).send(data)
    }
  }
}
module.exports = permit
