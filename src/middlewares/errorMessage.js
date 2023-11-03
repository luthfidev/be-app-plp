module.exports = async function (err, req, res, next) {
    const status = err.code || 500;
    const newToken = res.newToken ? res.newToken : null;
    const data = {
      success: false,
      message: err.message,
      newToken,
    };
    console.error('ERROR:', err.message);
  
    res.status(status);
    res.status(status).send(data);
  };
  