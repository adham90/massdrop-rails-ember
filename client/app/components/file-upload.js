import Ember from 'ember';
import EmberUploader from 'ember-uploader';

export default EmberUploader.FileField.extend({
  onComplete: 'onComplete',

  filesDidChange: function(files) {

    let uploadUrl = 'http://localhost:3000/sign';

    let imgType  = this.get('imageable_type'),
        imgId    = this.get('imageable_id');

    let uploader = EmberUploader.S3Uploader.create({
      url: uploadUrl,
    });

    if (!Ember.isEmpty(files)) {
      uploader.upload(files[0]);
    }

    uploader.on('didUpload', (e) => {
      this.sendAction('onComplete', {e, imgId, imgType});
    });

  }
});
