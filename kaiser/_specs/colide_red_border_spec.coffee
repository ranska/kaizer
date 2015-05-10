#
# An less DLS way to write spec
#
#
class window.KaiserSpec
  # Given a spec
  # 1 register it for the run
  @spec_one: ->
    ## Init
    #
    #
    window.YouAreDaChef
      .clazz(Boot)
        .method('create')
          .before (index) ->
            console.log '##########_ before Boot #####'
          .after ->
            console.log '##########_ after Boot #####'
    
            window.setTimeout window.KaiserSpec.out_and_clear, 3000
    # code change
      .clazz(Dave)
        .method('set_direction')
          .before (index) ->
            @spec_has_change_direction = 0

        .method('process_change_direction')
          .before ->
            @spec_has_change_direction += 1
            console.log 'change direction'
            window.KaiserSpec.test_out = @spec_has_change_direction
          .after ->

    console.log 'spec one'

