class window.AdviseRouterProxy

  @load_spec: (spec) ->
    console.log "AdviseRouterProxy load #{spec}"
    advise_router = new AdviseRouter
    advise_router.wire_spec AdviseBook.specs[spec]

  @current_spec: null
