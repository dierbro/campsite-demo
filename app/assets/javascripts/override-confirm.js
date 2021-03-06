$(function(){
  $.rails.allowAction = function(link){
    if( !link.is('[data-confirm]') )
      return true;
    BootstrapDialog.show({
      type: BootstrapDialog.TYPE_DANGER,
      title: 'Confirm',
      message: link.attr('data-confirm'),
      buttons: [{
        label: 'Accept',
        cssClass: 'btn-primary',
        action: function(dialogRef){
          link.removeAttr('data-confirm');
          link.trigger('click.rails');
          dialogRef.close();
        }
      }, {
        label: 'Cancel',
        action: function(dialogRef){
          dialogRef.close();
        }
      }]
    });
    return false; 
  };
});
