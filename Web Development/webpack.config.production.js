/*  ========================================================================
    # Webpack 4 Config - Production
    ========================================================================  */

/**
 * Additional configuration that is only used for production.
 *
 * Table of Contents:
 * 1. Dependencies
 * 2. Loading SCSS
 * 3. Loading Fonts
 * 4. Config Production
 * 5. Module Exports
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
const TerserWebpackPlugin = require('terser-webpack-plugin');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');

/*  2. Loading SCSS
    ========================================================================  */

const loadingSCSS = () => {
  return {
    test: /\.scss$/,
    include: path.resolve(__dirname, settings.paths.src.base),
    exclude: /node_modules/,
    use: [
      MiniCssExtractPlugin.loader,
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

/*  3. Loading Fonts
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
          publicPath: '../',
          outputPath: settings.paths.dist.assets,
          name: 'fonts/[name].[ext]'
        }
      }
    ]
  };
};

/*  4. Config Production
    ========================================================================  */

const configProduction = {
  mode: 'production',
  module: {
    rules: [
      loadingSCSS(),
      loadingFonts()
    ]
  },
  plugins: [

    // Specify the Environment
    new webpack.DefinePlugin({
      'process.env.NODE_ENV': JSON.stringify('production')
    }),

    // Terser Webpack Plugin
    new TerserWebpackPlugin({
      parallel: true,
      terserOptions: {
        keep_fnames: false,
        keep_classnames: true,
        mangle: true,
        ie8: false,
        safari10: false,
        output: {
          beautify: false,
          comments: false
        }
      }
    }),

    // Mini CSS Extract Plugin
    new MiniCssExtractPlugin({
      filename: `${settings.paths.dist.css}[name].min.css`
    })

  ]
};

/*  5. Module Exports
    ========================================================================  */

module.exports = merge(
  configCommon,
  configProduction
);
