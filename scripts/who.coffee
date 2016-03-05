module.exports = (robot) ->

  robot.respond /who is @?([\w .\-]+)\?*$/i, (res) ->
    name = res.match[1].trim()

    description = robot.brain.get 'who_' + name
    res.send "#{name} \n #{description}"