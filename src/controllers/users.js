
const userModel = require('../models/users')

module.exports = {

  detailUser: async (req, res) => {
    const { id_user } = req.body;
  
    try {

      const result = await userModel.getUserByCondition({id_user});

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

}
