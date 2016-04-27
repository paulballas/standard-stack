var pluralize = require('pluralize');

exports.Configuration = {
  apiEndpoint: 'https://varsity.cdn.prismic.io/api',
  accessToken: 'MC5VMjZmNmdFQUFEQUFtY1Ix.Ou-_ve-_ve-_vWpFFC_vv73vv73vv70577-9DFUoN--_vQ_vv71wWHTvv70w77-9aFnvv71r77-977-9',
  clientId: 'U26c9AEAADQAmb5_',
  clientSecret: '6ff57c7c4708853e0b60af7d685e4d27',
  linkResolver: function(doc) {
    if (doc.isBroken) {
      return false;
    }
    return '/' + pluralize(doc.type) + '/' + doc.id + '/' + doc.slug;
  },
  onPrismicError: function(err, req, res) {
    return res.send(500, 'Error 500: ' + err.message);
  }
};
