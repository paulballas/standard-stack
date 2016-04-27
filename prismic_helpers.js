var Prismic = require('prismic.io').Prismic;
var Configuration = require('./prismic_configuration').Configuration;
var http = require('http');
var https = require('https');
var url = require('url');
var querystring = require('querystring');

exports.previewCookie = Prismic.previewCookie;

exports.getApiHome = function(accessToken, callback) {
  Prismic.Api(Configuration.apiEndpoint, callback, accessToken);
};

exports.getDocument = function(ctx, id, slug, onSuccess, onNewSlug, onNotFound) {
  ctx.api.forms('everything').ref(ctx.ref).query('[[:d = at(document.id, "' + id + '")]]').submit(function(err, documents) {
    var doc, results;
    results = documents.results;
    doc = results && results.length ? results[0] : void 0;
    if (err) {
      onSuccess(err);
    } else if (doc && (!slug || doc.slug === slug)) {
      onSuccess(null, doc);
    } else if (doc && doc.slugs.indexOf(slug) > -1 && onNewSlug) {
      onNewSlug(doc);
    } else if (onNotFound) {
      onNotFound();
    } else {
      onSuccess();
    }
  });
};

exports.getDocuments = function(ctx, ids, callback) {
  if (ids && ids.length) {
    ctx.api.forms('everything').ref(ctx.ref).query('[[:d = any(document.id, [' + ids.map(function(id) {
      return '"' + id + '"';
    }).join(',') + '])]]').submit(function(err, documents) {
      callback(err, documents.results);
    });
  } else {
    callback(null, []);
  }
};

exports.getBookmark = function(ctx, bookmark, callback) {
  var id;
  id = ctx.api.bookmarks[bookmark];
  if (id) {
    exports.getDocument(ctx, id, void 0, callback);
  } else {
    callback();
  }
};

exports.onPrismicError = Configuration.onPrismicError;

exports.route = function(callback) {
  return function(req, res) {
    var accessToken;
    accessToken = req.session && req.session['ACCESS_TOKEN'] || Configuration.accessToken;
    exports.getApiHome(accessToken, function(err, Api) {
      var ctx;
      if (err) {
        exports.onPrismicError(err, req, res);
        return;
      }
      ctx = {
        api: Api,
        ref: req.cookies[Prismic.experimentCookie] || req.cookies[Prismic.previewCookie] || Api.master(),
        linkResolver: function(doc) {
          return Configuration.linkResolver(doc);
        }
      };
      res.locals.ctx = ctx;
      callback(req, res, ctx);
    });
  };
};
