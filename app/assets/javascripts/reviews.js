
//= require jquery.ui.slider

$(function() {
    var fields = $( ".form-group" )

    $.each(fields,function(index){
      if(index > 0 && index < fields.size()-1) {
        var form_group = $(this)
        var div_id = "foo"+ index
        var $div = $("<div>", {id: div_id,class: "slider"});
          $div.slider({
            range: "min",
            value: 3,
            min: 1,
            max: 5,
            animate: "fast",
            slide: function( event, ui ) {
              $( "#"+div_id ).val( ui.value );
              form_group.children( ".form-control" ).first().val( ui.value );
            }
          });

          form_group.append($div);
            
    }
  });
});