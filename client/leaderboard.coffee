Template.leaderboard.helpers
  players: ->
    Players.find({}, { sort: { score: -1, name: 1 } })
    
  selectedName: ->
    player = Players.findOne(Session.get("selectedPlayer"))
    player.name

Template.leaderboard.events
  'click .inc': ->
    selected_player_id = Session.get("selectedPlayer")
    
    Players.update(selected_player_id, {$inc: {score: 5}})
    
  'click .dec': ->
    selected_player_id = Session.get("selectedPlayer")
    
    Players.update(selected_player_id, {$inc: {score: -5}})
  

Template.player.helpers
  selected: ->
    "selected" if Session.equals("selectedPlayer", this._id)

Template.player.events
  'click': ->
    Session.set("selectedPlayer", this._id)