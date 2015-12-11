npm = "jspm_packages/npm"

module.exports = (config) ->
  config.set
    frameworks: ["jspm", "jasmine"]
    reporters: ["dots"]
    port: 8877
    colors: true
    logLevel: config.LOG_INFO
    autoWatch: false
    # Does not yet work in PhantomJS, since WeakMap is not supported: https://github.com/ariya/phantomjs/issues/13652
    browsers: ["Chrome"]
    captureTimeout: 30000
    singleRun: true
    reportSlowerThan: 500
    browserNoActivityTimeout: 30000
    jspm:
      loadFiles: [
        "#{npm}/reflect-metadata*.js"
        "#{npm}/zone.js*.js"
        ".tmp/test-bundle.js"
        "tests/unit/setup.ts"
        "tests/unit/**/*.ts"
      ]
    proxies:
      ###
       * Wrong references to rxjs operators in angular2@2.0.0-alpha.48
       * Change of path happened in rxjs@5.0.0-alpha.12
      ###
      "/#{npm}/rxjs@5.0.0-alpha.14/operators": "/base/#{npm}/rxjs@5.0.0-alpha.14/operator"
      "/jspm_packages": "/base/jspm_packages"
      "/scripts": "/base/scripts"
      "/tests": "/base/tests"
      "/.tmp": "/base/.tmp"