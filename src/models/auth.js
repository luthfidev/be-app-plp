const db = require('../utils/db')

module.exports = {
  getAuthCondition: (data) => {
    const sql = `SELECT u.id_user, 
                            u.username, 
                            u.password, 
                            l.nama_level, 
                            l.id_level,
                            u.nama_admin 
                      FROM user u
                     JOIN level l ON l.id_level = u.id_level WHERE u.username = ?`
    return new Promise((resolve, reject) => {
      db.query(sql, data.username, (error, results) => {
        if (error) {
          console.log(error)
          reject(Error(error))
        }
        resolve(results)
      })
    })
  },

  getAuthPelangganCondition: (data) => {
    const sql = `SELECT pl.id_pelanggan, 
                            pl.username, 
                            pl.password, 
                            l.nama_level,
                            l.id_level, 
                            pl.nama_pelanggan 
                      FROM pelanggan pl
                     JOIN level l ON l.id_level = pl.id_level WHERE pl.username = ?`
    return new Promise((resolve, reject) => {
      db.query(sql, data.username, (error, results) => {
        if (error) {
          console.log(error)
          reject(Error(error))
        }
        resolve(results)
      })
    })
  },


  signUp: (data) => {
    const sql = 'INSERT INTO user SET ?'
    return new Promise((resolve, reject) => {
      db.query(sql, data, (error, results) => {
        if (error) {
          reject(Error(error))
        }
        resolve(true)
      })
    })
  },

  signUpAdmin: (data) => {
    const sql = 'INSERT INTO user SET ?'
      return new Promise((resolve, reject) => {
        db.query(sql, data, (error, results) => {
          if (error) {
            reject(Error(error))
          }
          resolve(true)
        })
      })
  }
}
