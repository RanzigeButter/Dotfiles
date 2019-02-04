/*  ========================================================================
    # Webpack 4 Config - Common
    ========================================================================  */

/**
 * General used configuration.
 *
 * Table of Contents:
 * 1. Dependencies
 * 2. Loading Javascript
 * 3. Loading Images
 * 4. Config Common
 * 5. Module Exports
 */

/*  1. Dependencies
    ========================================================================  */

// General
const settings = require('./webpack.config.settings.js');
const merge = require('webpack-merge');
const path = require('path');

// Plugins
const CleanWebpackPlugin = require('clean-webpack-plugin');
const SvgSpritemapWebpackPlugin = require('svg-spritemap-webpack-plugin');
const CopyWebpackPlugin = require('copy-webpack-plugin');

/*  2. Loading Javascript
    ========================================================================  */

const loadingJavascript = () => {
  return {
    test: /\.js$/,
    include: path.resolve(__dirname, settings.paths.src.base),
    exclude: /node_modules/,
    use: {
      loader: 'babel-loader',
      options: {
        presets: [
          [
            '@babel/preset-env',
            {
              targets: {
                browsers: settings.browserslist.legacy,
              }
            }
          ]
        ],
        plugins: [
          '@babel/plugin-syntax-dynamic-import',
          '@babel/plugin-transform-runtime'
        ]
      }
    }
  };
};

/*  3. Loading Images
    ========================================================================  */

const loadingImages = () => {
  return {
    test: /\.(jpg|png|gif)$/,
    include: path.resolve(__dirname, settings.paths.src.base),
    exclude: /node_modules/,
    use: [
      {
        loader: 'file-loader',
        options: {
          name: `${settings.paths.dist.images}[name].[ext]`
        }
      },
      {
        loader: 'image-webpack-loader',
        options: {
          mozjpeg: {
            quality: 80
          },
          gifsicle: {
            optimizationLevel: 1,
            colors: 256
          },
          pngquant: {
            quality: 80,
            speed: 3
          },
          optipng: {
            enabled: false
          },
          svgo: {
            enabled: false
          }
        }
      }
    ]
  };
};

/*  4. Config Common
    ========================================================================  */

const configCommon = {
  entry: settings.entries,
  output: {
    path: path.resolve(__dirname, settings.paths.dist.base),
    filename: `${settings.paths.dist.js}[name].min.js`
  },
  module: {
    rules: [
      loadingJavascript(),
      loadingImages()
    ]
  },
  plugins: [

    // Clean Webpack Plugin
    new CleanWebpackPlugin(settings.paths.dist.base, {
      verbose: true // Write logs to console.
    }),

    // SVG Spritemap Webpack Plugin
    new SvgSpritemapWebpackPlugin(`${settings.paths.src.images}svg/**/*.svg`, {
      output: {
        filename: `${settings.paths.dist.images}svg/sprite.svg`
      },
      sprite: {
        prefix: false
      }
    }),

    // Copy Webpack Plugin
    new CopyWebpackPlugin(
      settings.copy
    )

  ]
};

/*  5. Module Exports
    ========================================================================  */

module.exports = merge(
  configCommon
);
