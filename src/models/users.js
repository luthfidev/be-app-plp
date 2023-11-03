const db = require('../utils/db')

module.exports = {
  getUserByCondition: (data) => {
    const sql = 'SELECT * FROM view_user_level WHERE ?'
    return new Promise((resolve, reject) => {
      db.query(sql, data, (error, results) => {
        if (error) {
          reject(Error(error))
        }
        resolve(results)
      })
    })
  },
}
