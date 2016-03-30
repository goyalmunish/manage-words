import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('user');
  this.route('words');
  this.route('dictionaries');
  this.route('flags');
  this.route('backup');
});

export default Router;
