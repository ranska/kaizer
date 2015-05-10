#
# Spec example
#
#
AdviseBook.add_spec 'from_green_to_red',
  #
  # For every class and method you can add pointcut
  #
  #
  describe:
    'Boot':
      create:
        before: =>
          #console.log 'boot 1 before'
        after: ->
          #console.log 'boot 1'
          window.setTimeout(
            window.AdviseBook.validation_condition['from_green_to_red'], 3000)
    'Dave':
      set_direction:
        before: =>
          @spec_has_change_direction = 0
      process_change_direction:
        before: =>
          @spec_has_change_direction += 1
          #console.log 'change direction'
          window.KaiserSpec.test_out = @spec_has_change_direction

  #
  # Like rspec there is an expectation to make test green or red
  #
  should: ->
    window.KaiserSpec.test_out is 1
