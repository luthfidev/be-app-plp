const jwt = require('jsonwebtoken')
const bcrypt = require('bcrypt')
const saltRounds = 10
const { TOKEN_SECRET, TOKEN_ALGORITMA } = process.env
const authModel = require('../models/auth')
// const logsModel = require('../models/logs')

module.exports = {

  signIn: async (req, res) => {
    const { username, password, id_level } = req.body
    
    try {

      let isFound
      if (parseInt(id_level) === 3) {
        isFound = await authModel.getAuthPelangganCondition({ username });
      } else {
        isFound = await authModel.getAuthCondition({ username });
      }

      if (isFound.length < 1) throw new Error('Failed match password');

      if (isFound.length > 0) {
        const isFoundPassword = isFound[0].password
        await bcrypt.compare(password, isFoundPassword, function (error, isMatch) {

          if (error) throw new Error('Failed match password');

          if (!isMatch) throw new Error('Password not match');

            const payload = {
              id_user: isFound[0].id_user ? isFound[0].id_user : isFound[0].id_pelanggan,
              username: isFound[0].username,
              nama_level: isFound[0].nama_level,
              id_level: isFound[0].id_level,
              nama_user: isFound[0].nama_admin ? isFound[0].nama_admin : isFound[0].nama_pelanggan
            }

            const token = jwt.sign(payload, TOKEN_SECRET,
              {
                expiresIn: '24h',
                algorithm: TOKEN_ALGORITMA
              })
            const data = {
              success: true,
              message: 'Password Match',
              userData: { ...payload },
              token: token
            }
            res.status(200).header('Authorization', token).send(data)
    
        })
      }
    } catch (error) {
      const data = {
        success: false,
        message: error.message
      }
      res.status(500).send(data);
    }
  },

  signUp: async (req, res) => {
    const { username, password, nama_admin, id_level } = req.body

    try {
      const passwordHash = await bcrypt.hash(password, saltRounds);
      const isExist = await authModel.getAuthCondition({ username });

      if (isExist.length > 0) throw new Error('username is exist, please use another username');

      const registerData = {
        username,
        password: passwordHash,
        nama_admin,
        id_level
      }

      const results = await authModel.signUp(registerData)

      if (!results) throw new Error('Failed to sign up');
      
      const data = {
        success: true,
        message: 'Register success',
        data: registerData.username
      }
      res.status(201).send(data)

    } catch (error) {
      console.log("signUp", error)
      const data = {
        success: false,
        message: error.message
      }
      res.status(500).send(data);
    }
  },

}
