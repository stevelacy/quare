(function() {
  define(function(require) {
    var ListenerMixin, ModelViewMixin, app, dermis, me;
    app = require('./dermis/dermis-app');
    ListenerMixin = {
      listenTo: function(ee, event, listener) {
        ee.on(event, listener);
        return this;
      },
      removeListener: function(ee, event, listener) {
        if (ee.off != null) {
          ee.off(event, listener);
        } else if (ee.removeListener) {
          ee.removeListener(event, listener);
        }
        return this;
      },
      componentWillMount: function() {
        this.listeners = [];
      },
      componentWillUnmount: function() {
        var l, _i, _len, _ref;
        _ref = this.listeners;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          l = _ref[_i];
          this.removeListener(l.ee, l.event, l.listener);
        }
      }
    };
    ModelViewMixin = {
      mixins: [ListenerMixin],
      componentWillMount: function() {
        if (this.props.model != null) {
          return this.model = this.props.model;
        } else if (this.props.params.id != null) {
          this.model = new this.modelConstructor({
            id: this.props.params.id
          });
          this.listenTo(this.model, 'change', this.forceUpdate);
          return this.model.fetch();
        }
      }
    };
    me = require('auth');
    dermis = {
      app: app,
      middleware: {
        auth: 'vendor/dermis/middleware/auth',
        clearFB: 'vendor/dermis/middleware/clearFB',
        log: 'vendor/dermis/middleware/log'
      },
      mixins: {
        Listener: ListenerMixin
      },
      view: function(config) {
        return React.createClass(dermis.alias(config));
      },
      modelView: function(config) {
        if (config.model == null) {
          throw new Error('Missing model attribute');
        }
        if (config.mixins == null) {
          config.mixins = [];
        }
        config.mixins.push(ModelViewMixin);
        return dermis.view(config);
      },
      collectionView: function(config) {
        var CollectionViewMixin;
        CollectionViewMixin = {
          mixins: [ListenerMixin],
          renderItems: function() {
            if (this.itemView != null) {
              this.items = this.collection.map((function(_this) {
                return function(m) {
                  return _this.itemView({
                    model: m,
                    key: m.id
                  });
                };
              })(this));
            }
            return this.forceUpdate();
          },
          componentWillMount: function() {
            var ctor;
            if (this.collection == null) {
              ctor = dermis.collection(config.model);
              this.collection = new ctor;
              return this.collection.fetch({
                success: (function(_this) {
                  return function() {
                    _this.renderItems();
                    return _this.listenTo(_this.collection, 'add change remove', function(e) {
                      return _this.renderItems();
                    });
                  };
                })(this)
              });
            } else {
              return this.renderItems();
            }
          }
        };
        if (!((this.collection != null) || (this.model != null))) {
          throw new Error('Requires either collection or model attribute');
        }
        if (config.mixins == null) {
          config.mixins = [];
        }
        config.mixins.push(CollectionViewMixin);
        return dermis.view(config);
      },
      alias: function(config) {
        var aliases, k, v;
        aliases = {
          init: 'getInitialState',
          mounting: 'componentWillMount',
          mounted: 'componentDidMount',
          unmounting: 'componentWillUnmount'
        };
        for (k in aliases) {
          v = aliases[k];
          if (config[k] != null) {
            if (config[v] == null) {
              config[v] = config[k];
            }
          }
        }
        if (config.mixins == null) {
          config.mixins = [];
        }
        return config;
      },
      collection: function(model) {
        var col, inst;
        if (model.prototype.getType() === 'model') {
          inst = new model;
          if (!(inst instanceof Backbone.Model)) {
            throw new Error("dermis#collection: Model provided not a Backbone Model");
          }
          col = Backbone.Collection.extend({
            model: model,
            url: inst.urlRoot
          });
        } else if (model instanceof Backbone.Collection) {
          col = Backbone.Collection.extend(model);
        } else {
          throw new Error("dermis#collection: Model or Collection specified invalid: " + model);
        }
        return col;
      },
      model: function(model) {
        var m;
        model.urlRoot = model.url;
        delete model.url;
        m = Backbone.Model.extend(model, {
          modelType: model.name
        });
        m.prototype.getType = function() {
          return "model";
        };
        return m;
      }
    };
    return dermis;
  });

}).call(this);
