class window.ResultsView extends Backbone.View

  el: 'div#results'

  template: _.template '<h2><%= endGameMsg %></h2>'

  initialize: ->
    @model.get('dealerHand').on 'endGame', => console.log @model.get 'endGameMsg'
    @render()

  render: ->
    @$el.html @template @model.attributes