/*  ========================================================================
    # Webpack 4 Config - Development
    ========================================================================  */

/**
 * Additional configuration that is only used for development.
 *
 * Table of Contents:
 * 1. Dependencies
 * 2. Development Server
 * 3. Lint Javascript
 * 4. Loading SCSS
 * 5. Loading Fonts
 * 6. Config Development
 * 7. Module Exports
 */

/*  1. Dependencies
    ========================================================================  */

// General
const settings = require('./webpack.config.settings.js');
const configCommon = require('./webpack.config.common.js');
const webpack = require('webpack');
const merge = require('webpack-merge');
const path = require('path');

// Plugins
const FriendlyErrorsWebpackPlugin = require('friendly-errors-webpack-plugin');
const StylelintWebpackPlugin = require('stylelint-webpack-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');

/*  2. Development Server
    ========================================================================  */

const devServer = () => {
  return {
    public: settings.developmentServer.public(),
    host: settings.developmentServer.host(),
    contentBase: path.resolve(__dirname, settings.paths.dist.base),
    publicPath: '/',
    open: true,
    hot: true,
    hotOnly: true,
    quiet: true,
    watchOptions: {
      poll: settings.developmentServer.poll()
    },
    disableHostCheck: true
  };
};

/*  3. Lint Javascript
    ========================================================================  */

const lintJavascript = () => {
  return {
    test: /\.(js|vue)$/,
    include: path.resolve(__dirname, settings.paths.src.base),
    exclude: /node_modules/,
    enforce: 'pre',
    use: [
      'eslint-loader'
    ]
  };
};

/*  4. Loading SCSS
    ========================================================================  */

const loadingSCSS = () => {
  return {
    test: /\.scss$/,
    include: path.resolve(__dirname, settings.paths.src.base),
    exclude: /node_modules/,
    use: [
      {
        loader: 'style-loader'
      },
      {
        loader: 'css-loader',
        options: {
          importLoaders: 3,
          sourceMap: false
        }
      },
      {
        loader: 'clean-css-loader',
        options: {
          level: {
            2: {
              mergeMedia: false
            }
          }
        }
      },
      {
        loader: 'postcss-loader',
        options: {
          ident: 'postcss',
          plugins: [
            /* eslint-disable */
            require('postcss-flexbugs-fixes')(),
            require('autoprefixer')({
              cascade: false,
              browsers: settings.browserslist.legacy,
            })
            /* eslint-enable */
          ]
        }
      },
      {
        loader: 'sass-loader'
      }
    ]
  };
};

/*  5. Loading Fonts
    ========================================================================  */

const loadingFonts = () => {
  return {
    test: /\.(woff2|woff|eot|otf|ttf)$/,
    include: path.resolve(__dirname, settings.paths.src.base),
    exclude: /node_modules/,
    use: [
      {
        loader: 'file-loader',
        options: {
          name: `${settings.paths.dist.fonts}[name].[ext]`
        }
      }
    ]
  };
};

/*  6. Config Development
    ========================================================================  */

const configDevelopment = {
  mode: 'development',
  devServer: devServer(),
  module: {
    rules: [
      lintJavascript(),
      loadingSCSS(),
      loadingFonts()
    ]
  },
  plugins: [

    // Specify the Environment
    new webpack.DefinePlugin({
      'process.env.NODE_ENV': JSON.stringify('development')
    }),

    // Hot Module Replacement Plugin
    new webpack.HotModuleReplacementPlugin(),

    // Friendly Errors Webpack Plugin
    new FriendlyErrorsWebpackPlugin({
      compilationSuccessInfo: {
        messages: ['Your application is running at: localhost:8080'],
        notes: ['Hot reloading is enabled.']
      },
      clearConsole: true,
    }),

    // Stylelint Webpack Plugin
    new StylelintWebpackPlugin({
      syntax: 'scss'
    }),

    // HTML Webpack Plugin
    new HtmlWebpackPlugin({
      template: './src/index.html',
      filename: './index.html',
      inject: 'body',
      minify: {
        removeComments: 'false',
        collapseWhitespace: 'true',
        preserveLineBreaks: 'true',
        minifyCSS: 'false',
        minifyJS: 'false'
      }
    })

  ]
};

/*  7. Module Exports
    ========================================================================  */

module.exports = merge(
  configCommon,
  configDevelopment
);
