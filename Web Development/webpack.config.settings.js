/*  ========================================================================
    # Webpack 4 Config - Settings
    ========================================================================  */

/**
 * Settings for the Webpack configuration.
 *
 * Table of Contents:
 * 1. Paths
 * 2. Entries
 * 3. Copy
 * 4. Browserslist
 * 5. Development Server
 */

module.exports = {

  /*  1. Paths
      ======================================================================  */

  paths: {
    src: {
      base: './src/',
      templates: './src/templates/',
      assets: './src/assets/',
      css: './src/assets/css/',
      js: './src/assets/js/',
      images: './src/assets/images/',
      fonts: './src/assets/fonts/'
    },
    dist: {
      base: './dist/',
      templates: './templates/',
      assets: './web/assets/',
      css: './web/assets/css/',
      js: './web/assets/js/',
      images: './web/assets/images/',
      fonts: './web/assets/fonts/'
    }
  },

  /*  2. Entries
      ======================================================================  */

  entries: {
    ranzigebutter: [
      './src/assets/js/main.js',
      './src/assets/css/main.scss'
    ]
  },

  /*  3. Copy
      ======================================================================  */

  copy: [
    // System Files
    {
      from: './src/system_files',
      to: '../dist'
    },
    // Templates
    {
      from: './src/templates',
      to: '../dist/templates'
    },
    // Favicons
    {
      from: './src/assets/images/favicons',
      to: '../dist/web/assets/images/favicons',
      ignore: ['*.psd']
    },
    // Sharing Images
    {
      from: './src/assets/images/sharing',
      to: '../dist/web/assets/images/sharing',
      ignore: ['*.psd']
    },
    // Misc Images
    {
      from: './src/assets/images/misc',
      to: '../dist/web/assets/images/misc',
      ignore: ['*.psd']
    }
  ],

  /*  4. Browserslist
      ======================================================================  */

  browserslist: {
    legacy: [
      '> 1%',
      'last 2 versions',
      'Firefox ESR'
    ],
    modern: [
      'last 2 Chrome versions',
      'not Chrome < 60',
      'last 2 Firefox versions',
      'not Firefox < 54',
      'last 2 Edge versions',
      'not Edge < 15',
      'last 2 Safari versions',
      'not Safari < 10.1',
      'last 2 iOS versions',
      'not iOS < 10.3'
    ]
  },

  /*  5. Development Server
      ======================================================================  */

  developmentServer: {
    public: () => {
      return process.env.DEVSERVER_PUBLIC || 'http://localhost:8080';
    },
    host: () => {
      return process.env.DEVSERVER_HOST || 'localhost';
    },
    poll: () => {
      return process.env.DEVSERVER_POLL || false;
    }
  }
};
