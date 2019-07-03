Template.leaderboard.helpers
  players: ->
    Players.find({},{sort: {score: -1, name: 1}})
  
  selected: ->
    "selected" if Session.get("jugador_seleccionado") == @_id
    
  selectedName: ->
    _id = Session.get("jugador_seleccionado")
    
    Players.findOne(_id).name
    
Template.leaderboard.events
  "click .new_scientist": ->
    Players.insert({
      name: prompt("Ingrese el nombre del científico")
      score: 0
    })
  
  "click .player": ->
    Session.set("jugador_seleccionado", @_id)
    
  "click .inc": ->
    _id = Session.get("jugador_seleccionado")
    
    score_actual = Players.findOne(_id).score
    
    Players.update(_id, {$set: {score: score_actual+5}})
    