import Ember from 'ember';

export default Ember.Controller.extend({
    actions: {
      imageUploadComplete: function(data) {
        console.log(data);
      },

    }
});
