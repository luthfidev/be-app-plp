const qs = require('querystring')

module.exports = {

  getPage: (_page) => {
    const page = parseInt(_page)
    if (page && page > 0) {
      return page
    } else {
      return 1
    }
  },
  getPerPage: (_perPage) => {
    const perPage = parseInt(_perPage)
    if (perPage && perPage > 0) {
      return perPage
    } else {
      return 5
    }
  },
  getNextLink: (page, totalPage, currentQuery) => {
    page = parseInt(page)
    if (page < totalPage) {
      const generatePage = {
        page: page + 1
      }
      return qs.stringify({ ...currentQuery, ...generatePage })
    } else {
      return null
    }
  },
  getPrevLink: (page, currentQuery) => {
    page = parseInt(page)
    if (page > 1) {
      const generatePage = {
        page: page - 1
      }
      return qs.stringify({ ...currentQuery, ...generatePage })
    } else {
      return null
    }
  }
}
