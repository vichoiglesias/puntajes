Meteor.startup ->
  if (Players.find().count() is 0)
    names = ["Ada Lovelace", "Grace Hopper", "Marie Curie", "Carl Friedrich Gauss", "Nikola Tesla", "Claude Shannon"]
    names.forEach (name) ->
      Players.insert({
        name: name
        score: Math.floor(Random.fraction() * 10) * 5
      })
        