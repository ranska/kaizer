class window.AdviseRouter

  ##
  # TODO translate french com
  # route_me et call lorsque
  #
  # et la methode de création des points cut
  # elle est appellée au début de chargement de chaque spec
  # et elle n'est pas appeller si le path
  # existe déjà dans le book
  wire_spec: (spec) ->
    for klass, advises of spec
      for method, actions of advises
        for instant, fun of actions
          unless AdviseBook.routes[klass]?[method]?[instant]?
            @route_me {klass, method, instant}
            AdviseBook.add_route klass, method, instant

  route_me: (advise) ->
    YouAreDaChef
      .clazz(window[advise.klass])
        .method(advise.method)[advise.instant] =>
          @call_advise advise

  call_advise: (advise) ->
    AdviseBook
      .specs[AdviseRouterProxy
        .current_spec][ advise
               .klass]?[advise
              .method]?[advise
             .instant]?()
            # NOTE this presentation is writing art :)
            # I name it dentent chain call
