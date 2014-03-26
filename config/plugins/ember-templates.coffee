_ = require("underscore")

module.exports = (lineman) ->
  app = lineman.config.application

  config:
    loadNpmTasks: app.loadNpmTasks.concat("grunt-ember-templates")

    prependTasks:
      common: app.prependTasks.common.concat("emberTemplates")

    removeTasks:
      common: app.removeTasks.common.concat("handlebars")


    emberTemplates:
        options:
          templateBasePath: "app/templates/"
          templateFileExtensions: /\.(hbs|hb|handlebars|handlebar)/
        compile:
          files:
            "<%= files.template.generatedHandlebars %>": "<%= files.template.handlebars %>"

    watch:
      handlebars:
        tasks: ["emberTemplates:compile", "concat_sourcemap:js"]
