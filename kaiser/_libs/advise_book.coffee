class window.AdviseBook
  # hash:
  #   spec:
  #     clazz:
  #       method:
  #         advise:
  @routes: {}

  @specs: {}

  @add_route: (klass, method, instant) ->
    unless @routes[klass]?
      @routes[klass] = {}
    unless @routes[klass][method]?
      @routes[klass][method] = {}
    unless @routes[klass][method][instant]?
      @routes[klass][method][instant] = true

  @specs_name: []

  @validation_condition: {}

  @add_spec: (name, spec) ->
    AdviseBook.specs_name.push name
    AdviseBook.specs[name] = spec.describe
    AdviseBook.validation_condition[name] = ->
      AdviseBook.out_and_clear spec.should

  @out_and_clear: (test) ->
    if test()
      console.log '%c spec pass ', 'background-color: #66ee44; color: #333333'
    else
      console.error 'spec failed'
    window.kaiser.call_after_game()
