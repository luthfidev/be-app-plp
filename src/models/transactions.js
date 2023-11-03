const db = require('../utils/db')

module.exports = {
  topUpSaldo: (data) => {
    const sql = 'call topup_pelanggan(?, ?)'
    return new Promise((resolve, reject) => {
      db.query(sql, [parseInt(data.id_pelanggan), parseInt(data.saldo)],(error, results) => {
        if (error) {
          reject(Error(error))
        }
        resolve(results[0][0])
      })
    })
  },

  getTagihanCount: (data) => {
    const sql = `SELECT COUNT(*) as total FROM view_tagihan_pelanggan
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

  getAllTagihan: (start, end, data) => {
    const sql = `SELECT * FROM view_tagihan_pelanggan
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

  hitungTagihan: (data) => {
    const sql = 'call hitung_tagihan_pln(?, ?, ?)'
    return new Promise((resolve, reject) => {
      db.query(sql, [parseInt(data.id_pelanggan), parseInt(data.bulan), parseInt(data.tahun)],(error, results) => {
        if (error) {
          reject(Error(error))
        }
        resolve(results[0][0])
      })
    })
  },

  getPembayaranCount: (data) => {
    const sql = `SELECT COUNT(*) as total FROM view_pembayaran_pelanggan
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

  getAllPembayaran: (start, end, data) => {
    const sql = `SELECT * FROM view_pembayaran_pelanggan
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

  bayarTagihan: (data) => {
    const sql = 'call pembayaran_tagihan(?, ?, ?)'
    return new Promise((resolve, reject) => {
      db.query(sql, [parseInt(data.id_pelanggan), parseInt(data.id_tagihan), parseInt(data.id_user)],(error, results) => {
        if (error) {
          reject(Error(error))
        }
        resolve(results[0][0])
      })
    })
  },

  getTagihanByCondition: (data) => {
    console.log(data)
    const sql = 'SELECT * FROM view_tagihan_pelanggan WHERE ?'
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
