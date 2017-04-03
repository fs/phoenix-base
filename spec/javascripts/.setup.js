require('babel-register')();

var jsdom = require('jsdom').jsdom;
var React = require('react').React;

var exposedProperties = ['window', 'navigator', 'document'];

global.window.React = React;
global.document = jsdom('');
global.window = document.defaultView;
Object.keys(document.defaultView).forEach((property) => {
  if (typeof global[property] === 'undefined') {
    exposedProperties.push(property);
    global[property] = document.defaultView[property];
  }
});

global.navigator = {
  userAgent: 'node.js'
};

documentRef = document;
