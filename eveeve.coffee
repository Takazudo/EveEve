ns = window

class ns.EveEve

  on: (ev, callback) ->
    @_callbacks = {} unless @_callbacks?
    evs = ev.split(' ')
    for name in evs
      @_callbacks[name] or= []
      @_callbacks[name].push(callback)
    return this

  once: (ev, callback) ->
    @on ev, ->
      @off(ev, arguments.callee)
      callback.apply(@, arguments)
    return this

  trigger: (args...) ->
    ev = args.shift()
    list = @_callbacks?[ev]
    return unless list
    for callback in list
      if callback.apply(@, args) is false
        break
    return this

  off: (ev, callback) ->
    unless ev
      @_callbacks = {}
      return this
   
    evs = ev.split(' ')
    for name in evs

      list = @_callbacks?[name]
      
      if list
        if callback
          for cb, i in list when cb is callback
            list = list.slice()
            list.splice(i, 1)
            @_callbacks[name] = list
        else
          delete @_callbacks[name]

    return this
