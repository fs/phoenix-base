// Example webpack configuration with asset fingerprinting in production.
import path from 'path';
import Webpack from 'webpack';

const production = process.env.MIX_ENV === 'prod' || process.env.MIX_ENV == 'staging';

const config = {
  entry: {
    application: './web/static/js/index.js'
  },

  module: {
    loaders: [{
      test: /\.jsx?$/,
      exclude: /(node_modules)/,
      loader: 'babel'
    }, {
      test: /\.json/,
      loader: 'json-loader'
    }]
  },

  output: {
    path: "./priv/static/js",
    publicPath: "/",
    filename: production ? 'app-[chunkhash].js' : 'app.js'
  },

  resolve: {
    root: path.join(__dirname, '..', 'web', 'static', 'js'),
    modulesDirectories: ['node_modules', 'vendor/assets/javascript'],
    extensions: ['', '.js', '.jsx', '.json'],
    alias: {
      jquery: 'jquery/dist/jquery',
      'jquery-mousewheel': 'jquery.mousewheel',
      'jquery-ui/widget': 'jquery.ui.widget/jquery.ui.widget',
      foundation: 'foundation-sites/js/foundation.min'
    }
  },

  plugins: [
  // Important to keep React file size down
    new Webpack.DefinePlugin({
      "process.env": {
        "NODE_ENV": process.env.MIX_ENV
      },
    })
  ]
};

if (production) {
  config.plugins.push(
    new webpack.NoErrorsPlugin(),
    new webpack.optimize.UglifyJsPlugin({
      compressor: { warnings: false },
      sourceMap: false
    }),
    new webpack.optimize.DedupePlugin(),
    new webpack.optimize.OccurenceOrderPlugin()
  );
} else {
  // Source maps
  config.devtool = 'cheap-module-eval-source-map';
}

export default config;
