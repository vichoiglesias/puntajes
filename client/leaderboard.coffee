Template.leaderboard.helpers
  players: ->
    Players.find({},{sort: {score: -1, name: 1}})
  
  selected: ->
    "selected" if Session.get("jugador_seleccionado") == @_id
    
  selectedName: ->
    _id = Session.get("jugador_seleccionado")
    
    Players.findOne(_id).name
    
Template.leaderboard.events
  "submit form": (event, instance) ->
    event.preventDefault()
    nombre = instance.find("[name='nombre']").value
    
    unless nombre?.length >= 6
      alert "El nombre debe tener 6 caracteres"
      return
      
    Players.insert({
      name: nombre
      score: 0
    })
    
    instance.find("form").reset()
  
  "click .player": ->
    Session.set("jugador_seleccionado", @_id)
    
  "click .inc": ->
    _id = Session.get("jugador_seleccionado")
    
    score_actual = Players.findOne(_id).score
    
    Players.update(_id, {$set: {score: score_actual+5}})
  
  "click .delete": ->
    _id = Session.get("jugador_seleccionado")
    
    Players.remove(_id)
    
    