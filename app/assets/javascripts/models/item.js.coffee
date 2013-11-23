Findit.Item = DS.Model.extend
  name: DS.attr('string')
  make: DS.attr('string')
  model: DS.attr('string')
  shortType: DS.attr('string')
  typeOfItem: DS.attr('string')
  shortLocation: DS.attr('string')

  makeModel: (->
    "#{@get('make')} - #{@get('model')}"
  ).property('make', 'model')

  editLink: (->
    "/items/#{@get('id')}/edit"
  ).property('id')

  showLink: (->
    "/items/#{@get('id')}"
  ).property('id')