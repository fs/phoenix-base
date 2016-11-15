const path = require('path');

module.exports = (karmaConfig) => {
  karmaConfig.set({
    browsers: ['PhantomJS'],
    singleRun: true,
    basePath: path.resolve(__dirname, '../'),
    files: [
      './spec/javascripts/**/*_spec.js'
    ],
    frameworks: ['jasmine'],
    preprocessors: {
      './spec/javascripts/**/*_spec.js': ['webpack', 'sourcemap']
    },
    reporters: ['dots'],
    webpack: {
      devtool: 'inline-source-map',
      module: {
        loaders: [
          {
            test: /\.jsx?$/,
            exclude: /node_modules/,
            loader: 'babel'
          },
          {
            test: /\.json$/,
            loader: 'json-loader'
          }
        ]
      },
      externals: {
        'react/addons': true,
        'react/lib/ExecutionEnvironment': true,
        'react/lib/ReactContext': 'window'
      }
    },
    webpackMiddleware: {
      quiet: true
    }
  });
};
