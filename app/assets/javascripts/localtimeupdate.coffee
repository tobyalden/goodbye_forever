class Sync.Post extends Sync.View

  afterUpdate: ->
    super
    # console.log 'afterUpdate custom hook called'
    LocalTime.run()

  afterInsert: ->
    super
    # console.log 'afterInsert custom hook called'
    LocalTime.run()

class Sync.AdminPost extends Sync.View

  afterUpdate: ->
    super
    # console.log 'afterUpdate custom hook called'
    LocalTime.run()

  afterInsert: ->
    super
    # console.log 'afterInsert custom hook called'
    LocalTime.run()
