# Test runner mode
#
# TODO extract comments to wiki and issue
#
# on the after load state
# go to test state
#
#*1 YoDa populate with factory or something else
#-2 run test state
#-3 there will be a stop rule on update loop
#-4 there is test hook somewhere
#-5 there is a test stop condition somewhere
# 6 there a test ouput (ajax, web, page, console)
#-7 there a tear down (clean up)
#-8 there a chain to next test
#-9 there is an end test run

class window.Kaiser
  setup: ->
    @load_specs()
    console.log 'Test suite loaded'
    @play_tests()

  #
  # Select the next test or out
  #
  play_tests: ->
    if @times is 0
      console.log('test are over')
      return
    current_spec = @specs[@specs.length - @times]
    @times -=1
    window.AdviseRouterProxy.current_spec = current_spec
    console.log current_spec
    @create_game()

  create_game: ->
    window.game = new Phaser.Game 1280, 768, Phaser.AUTO, "phaser-example"
    states = "Boot Preload AfterLoad MainScreen Credits Level Choose1 Choose2".split ' '
    for state in states
      window.game.state.add state, window[state]
    window.game.state.start 'Boot'

  load_specs: ->
    @specs = AdviseBook.specs_name
    #
    # TODO specs run trow conditions like tag or group
    #
    #@specs = [@specs[2]]
    @times = 0
    for spec in @specs
      @times += 1
      window.AdviseRouterProxy.load_spec spec
    # for every spec in specs
    # inject point_cut
    # add point_cut in point_cut_hash
    
    # On run 
    # play de current spec advice

  call_after_game: ->
    window.game.destroy()
    window.kaiser.play_tests()
