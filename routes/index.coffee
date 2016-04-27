Prismic = require('prismic.io').Prismic
_ = require('underscore')
express = require 'express'
router = express.Router()
prismic = require('../prismic_helpers')

router.route('/').get prismic.route (request, response, context) ->
  context.api.form('everything').ref(context.ref).query(
    Prismic.Predicates.at('document.type', 'stack')
  ).fetchLinks(['stack.title', 'stack.category', 'stack.subcategory']).orderings('[my.stack.category]').submit (error, data) ->
    if (error)
      response.sendStatus(500)
    else
      context.api.form('everything').ref(context.ref).query(
        Prismic.Predicates.at('document.type', 'stack')
      ).orderings('[my.stack.category]').submit (error, positionData) ->
        if (error)
          response.sendStatus(500)
        else
          catGroup = _.groupBy data.results, (result) -> result.data['stack.category'].value
          response.render 'index', { title: 'Standard Stack', context: context, results: catGroup, positionResults: positionData.results }
          
module.exports = router
