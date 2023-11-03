const db = require('../utils/db')

module.exports = {
  getPelangganCount: (data) => {
    const sql = `SELECT COUNT(*) as total FROM view_pelanggan_detail
                     WHERE nama_pelanggan LIKE '%${data.search || ''}%' 
                     ORDER BY nama_pelanggan ${parseInt(data.sort) ? 'DESC' : 'ASC'}`
    return new Promise((resolve, reject) => {
      db.query(sql, (error, results) => {
        if (error) {
          reject(Error(error).total)
        }
        resolve(results[0].total)
      })
    })
  },

  getPelangganByCondition: (data) => {
    const sql = 'SELECT * FROM view_pelanggan_detail WHERE ?'
    return new Promise((resolve, reject) => {
      db.query(sql, data, (error, results) => {
        if (error) {
          reject(Error(error))
        }
        resolve(results)
      })
    })
  },

  getAllPelanggan: (start, end, data) => {
    const sql = `SELECT * FROM view_pelanggan_detail
                     WHERE nama_pelanggan LIKE '%${data.search || ''}%' 
                     ORDER BY nama_pelanggan ${parseInt(data.sort) ? 'DESC' : 'ASC'} LIMIT ${end} OFFSET ${start}`
    return new Promise((resolve, reject) => {
      db.query(sql, (error, results) => {
        if (error) {
          reject(Error(error))
        }
        resolve(results)
      })
    })
  },

  createPelanggan: (data) => {
    const sql = 'INSERT INTO pelanggan SET ?'
    return new Promise((resolve, reject) => {
      db.query(sql, data, (error, results) => {
        if (error) {
          reject(Error(error))
        }
        resolve(true)
      })
    })
  },

  updatePelanggan: (data) => {
    console.log(data)
    const sql = 'UPDATE pelanggan SET ? WHERE ?'
    return new Promise((resolve, reject) => {
      db.query(sql, data, (error, results) => {
        if (error) {
          reject(Error(error))
        }
        resolve(results.affectedRows)
      })
    })
  },

  deletePelanggan: (data) => {
    const sql = 'DELETE FROM pelanggan WHERE ?'
    return new Promise((resolve, reject) => {
      db.query(sql, data, (error, results) => {
        if (error) {
          reject(Error(error))
        }
        resolve(results.affectedRows)
      })
    })
  },
}
