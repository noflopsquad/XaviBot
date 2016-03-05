module.exports = (robot) ->
  robot.brain.describe = (name, description) ->
    robot.brain.set 'who_' + name, description

