
const { APP_URL } = process.env
const transactionModel = require('../models/transactions')
const pagination = require('../utils/pagination')

module.exports = {

  getAllTagihan: async (req, res) => {
    const { page, limit, search, sort } = req.query
    const condition = {
      search,
      sort
    }

    try {

      const sliceStart = (pagination.getPage(page) * pagination.getPerPage(limit)) - pagination.getPerPage(limit)
      const sliceEnd = (pagination.getPage(page) * pagination.getPerPage(limit)) - sliceStart
      const totalData = await transactionModel.getTagihanCount(condition)
      const totalPage = Math.ceil(totalData / pagination.getPerPage(limit))
      const prevLink = pagination.getPrevLink(pagination.getPage(page), req.query)
      const nextLink = pagination.getNextLink(pagination.getPage(page), totalPage, req.query)

      const tagihanData = await transactionModel.getAllTagihan(sliceStart, sliceEnd, condition)
      const data = {
        success: true,
        message: 'List tagihan',
        data: tagihanData,
        pageInfo: {
          page: pagination.getPage(page),
          totalPage,
          perPage: pagination.getPerPage(limit),
          totalData,
          prevLink: prevLink && `${APP_URL}tagihan?${nextLink}`,
          nextLink: nextLink && `${APP_URL}tagihan?${nextLink}`
        }
      }
      res.status(200).send(data)
      
    } catch (error) {
      const data = {
        success: false,
        message: error.message
      }
      res.status(500).send(data);
    }
  },

  hitungTagihan: async (req, res) => {
    const { id_pelanggan, bulan, tahun } = req.body;
    try {

      const tagihanData = {
        id_pelanggan,
        bulan,
        tahun
      };

    /**
     * Menghitung tagihan berdasarkan id, bulan, tahun
     *
     * @constructor
     * @param {number} x - id_pelanggan
     * @param {number} y - bulan
     * @param {tahun} y - bulan
     */
     const result = await transactionModel.hitungTagihan(tagihanData);

     if (!result) throw new Error('Failed to calculate bill');
     
     const data = {
      success: true,
      message: result
    }
    res.status(200).send(data);
      
    } catch (error) {
      const data = {
        success: false,
        message: error.message
      }
      res.status(500).send(data);
    }
  },

  getAllPembayaran: async (req, res) => {
    const { page, limit, search, sort } = req.query
    const condition = {
      search,
      sort
    }

    try {

      const sliceStart = (pagination.getPage(page) * pagination.getPerPage(limit)) - pagination.getPerPage(limit)
      const sliceEnd = (pagination.getPage(page) * pagination.getPerPage(limit)) - sliceStart
      const totalData = await transactionModel.getPembayaranCount(condition)
      const totalPage = Math.ceil(totalData / pagination.getPerPage(limit))
      const prevLink = pagination.getPrevLink(pagination.getPage(page), req.query)
      const nextLink = pagination.getNextLink(pagination.getPage(page), totalPage, req.query)

      const pembayaranData = await transactionModel.getAllPembayaran(sliceStart, sliceEnd, condition)
      const data = {
        success: true,
        message: 'List pembayaran',
        data: pembayaranData,
        pageInfo: {
          page: pagination.getPage(page),
          totalPage,
          perPage: pagination.getPerPage(limit),
          totalData,
          prevLink: prevLink && `${APP_URL}pembayaran?${nextLink}`,
          nextLink: nextLink && `${APP_URL}pembayaran?${nextLink}`
        }
      }
      res.status(200).send(data)
      
    } catch (error) {
      const data = {
        success: false,
        message: error.message
      }
      res.status(500).send(data);
    }
  },

  bayarTagihan: async (req, res) => {
    const { id_pelanggan, id_tagihan, id_user } = req.body;
    try {

      const bayarTagihanData = {
        id_pelanggan,
        id_tagihan,
        id_user
      };
     const result = await transactionModel.bayarTagihan(bayarTagihanData);

     if (!result) throw new Error('Failed to pay bill');
     
     const data = {
      success: true,
      message: result
    }
    res.status(200).send(data);
      
    } catch (error) {
      const data = {
        success: false,
        message: error.message
      }
      res.status(500).send(data);
    }
  },

  updateSaldoPelanggan: async (req, res) => {
    const {id_pelanggan, saldo} = req.body;
    try {
      
      const topUpData = {
        id_pelanggan,
        saldo
      };
     const result = await transactionModel.topUpSaldo(topUpData);

     if (!result) throw new Error('Failed to update saldo');
     
     const data = {
      success: true,
      message: result
    }
    res.status(200).send(data);

    } catch (error) {
      const data = {
        success: false,
        message: error.message
      }
      res.status(500).send(data);
    }
  },

  detailTagihanByPelanggan: async (req, res) => {
    const { id_pelanggan } = req.body;
    try {

      const result = await transactionModel.getTagihanByCondition({id_pelanggan});

      if (result) {
        const data = {
          success: true,
          data: result
        }
        res.status(201).send(data)
      }

      
    } catch (error) {
      const data = {
        success: false,
        message: error.message
      }
      res.status(500).send(data);
    }
  }

}
