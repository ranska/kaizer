#
# Here an example of possible DSL 
#
class SpecName
  #
  # hash:
  #   spec:
  #     clazz:
  #       method:
  #         advise:
  specs:
    name: 'from_green_to_red'
    litarate_name: 'from green to red'
    init:
      points_cut: [
        where: 'Boot create before'
        what: ->
          console.log '##########_ before Boot #####'
      ,
        where: 'Boot create after'
        what: ->
          console.log '##########_ after Boot #####'
      ,
      ]
    before:
      points_cut: [
        where: 'Dave set_direction before'
        what: ->
          @spec_has_change_direction = 0
      ]
    during:
      points_cut: [
        where: 'Dave set_direction before'
        what: ->
          @spec_has_change_direction = 0
      ]
    end_condition:
      what: true

