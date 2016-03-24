import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  mrsp: DS.attr('number'),
  description: DS.attr('string'),
  image: DS.attr('raw')
});
