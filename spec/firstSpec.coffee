Helper = require('hubot-test-helper')
# helper loads all scripts passed a directory
helper = new Helper('../scripts')

# helper loads a specific script if it's a file
scriptHelper = new Helper('../scripts/who.coffee')

co     = require('co')
expect = require('chai').expect

describe 'meet members', ->

  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  context 'described member', ->
    beforeEach ->
      co =>
        yield @room.user.say 'Xavi', '@hubot describe Xavi as the teacher'
        yield @room.user.say 'bob',   '@hubot who is Xavi'

    it 'could be met by another member', ->
      expect(@room.messages).to.eql [
        ['Xavi', '@hubot describe Xavi as the teacher']
        ['hubot', 'Xavi - the teacher']
        ['bob',   '@hubot who is Xavi']
        ['hubot', 'Xavi \n the teacher']
      ]