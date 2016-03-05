module.exports = (robot) ->

  robot.respond /describe @?([\w .\-]+)\?* as ([\w\s]*)$/i, (res) ->
    name = res.match[1].trim()
    description = res.match[2].trim()

    robot.brain.describe(name, description)

    res.send "#{name} - #{description}"
