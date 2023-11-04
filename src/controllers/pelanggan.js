const { APP_URL } = process.env
const bcrypt = require('bcrypt')
const saltRounds = 10
const pelangganModel = require('../models/pelanggan')
const pagination = require('../utils/pagination')

module.exports = {

  getAllPelanggan: async (req, res) => {
    const { page, limit, search, sort } = req.query
    const condition = {
      search,
      sort
    }

    const sliceStart = (pagination.getPage(page) * pagination.getPerPage(limit)) - pagination.getPerPage(limit)
    const sliceEnd = (pagination.getPage(page) * pagination.getPerPage(limit)) - sliceStart
    const totalData = await pelangganModel.getPelangganCount(condition)
    const totalPage = Math.ceil(totalData / pagination.getPerPage(limit))
    const prevLink = pagination.getPrevLink(pagination.getPage(page), req.query)
    const nextLink = pagination.getNextLink(pagination.getPage(page), totalPage, req.query)

    const pelangganData = await pelangganModel.getAllPelanggan(sliceStart, sliceEnd, condition)
    const data = {
      success: true,
      message: 'List pelanggan',
      data: pelangganData,
      pageInfo: {
        page: pagination.getPage(page),
        totalPage,
        perPage: pagination.getPerPage(limit),
        totalData,
        prevLink: prevLink && `${APP_URL}pelanggan?${nextLink}`,
        nextLink: nextLink && `${APP_URL}pelanggan?${nextLink}`
      }
    }
    res.status(200).send(data)
  },

  detailPelanggan: async (req, res) => {
    const { id_pelanggan } = req.body;
    try {

      const result = await pelangganModel.getPelangganByCondition({id_pelanggan});

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
  },

  createPelanggan: async (req, res) => {
    const { username, password, nomor_kwh, nama_pelanggan, alamat, id_tarif } = req.body
    try {
      
      const isExistUsername = await pelangganModel.getPelangganByCondition({ username });

      // if (isExistUsername.length > 0) throw new Error('Username already exists');
      if (isExistUsername.length > 0) throw new Error('Username already exists')

      const passwordHash = await bcrypt.hash(password, saltRounds);

      const pelangganData = { username, password: passwordHash , nomor_kwh, nama_pelanggan, alamat, id_tarif };
      const results = await pelangganModel.createPelanggan(pelangganData);

      if (!results) throw new Error('Failed create pelanggan');

      if (results) {
        const data = {
          success: true,
          message: 'Create pelanggan has ben success'
        }
        res.status(201).send(data)
      }

    } catch (error) {
      // next(error);
       const data = {
        success: false,
        message: error.message
      }
      res.status(500).send(data);
    }
  },

  updatePelanggan: async (req, res) => {

    let { id_pelanggan, username, password, nomor_kwh, nama_pelanggan, alamat, id_tarif } = req.body
    
    try {

      const isExistPelanggan = await pelangganModel.getPelangganByCondition({ id_pelanggan: parseInt(id_pelanggan) });

      if (isExistPelanggan.length < 1) throw new Error("Pelanggan not found");

      const passwordHash = await bcrypt.hash(password, saltRounds);

      username = username || isExistPelanggan[0].username
      password = password || isExistPelanggan[0].password
      nomor_kwh = nomor_kwh || isExistPelanggan[0].nomor_kwh
      nama_pelanggan = nama_pelanggan || isExistPelanggan[0].nama_pelanggan
      alamat = alamat || isExistPelanggan[0].alamat
      id_tarif = id_tarif || isExistPelanggan[0].id_tarif

      const pelangganData = [
        { username, password: passwordHash, nomor_kwh, nama_pelanggan, alamat, id_tarif},
        { id_pelanggan: id_pelanggan }
      ]

      const results = await pelangganModel.updatePelanggan(pelangganData)

      if (!results) throw new Error("Update pelanggan failed");

      delete pelangganData[0].password

        const data = {
          success: true,
          message: 'Pelanggan has been update',
          data: pelangganData[0]
        }
        res.status(201).send(data)
      
    } catch (error) {
      const data = {
        success: false,
        message: error.message
      }
      res.status(500).send(data);
    }
  },

  deletePelanggan: async (req, res) => {
    const { id } = req.params
    try {

      const checkId = await pelangganModel.getPelangganByCondition({ id_pelanggan: parseInt(id) })
      
      if (checkId.length < 1) throw new Error("Pelanggan not found");

      const results = await pelangganModel.deletePelanggan({ id_pelanggan: parseInt(id) });

      if (!results) throw new Error("Failed delete pelanggan");

      const data = {
        success: true,
        message: 'Pelanggan has been deleted successfully',
      }
      res.status(201).send(data)
      
    } catch (error) {
      const data = {
        success: false,
        message: error.message
      }
      res.status(500).send(data);
    }
  },

}
