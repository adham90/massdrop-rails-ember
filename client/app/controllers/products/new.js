
import Ember from 'ember';

export default Ember.Controller.extend({
    actions: {
      imageUploadComplete: function(data) {

        var image_url = decodeURIComponent($(data['e']).find('Location')[0].textContent),
              store   = this.store,
              imgI    = data['imgId'],
              imgType = data['imgType'];

        console.log(store);
        store.findRecord('picture', 1).then(function(item) {
          // item.set('imageable_id', 1);
          // item.set('imageable_type', imgType);
          // item.save();
          console.log('done');
        });
      },
    }
});
