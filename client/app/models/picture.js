import DS from 'ember-data';

export default DS.Model.extend({
  imageable_id: DS.attr('number'),
  imageable_type: DS.attr('string')
});
