function set_processing() {
  $('body').append('<div class="processing"></div>')
}

function remove_processing() {
  $('.processing').remove();
}

function ajax_request(submit_to, params, after_success, after_error, method){
  set_processing()

  $.ajax({
    url : submit_to,
    type : method || "POST",
    data : params
  }).done(function( data ) {
    if (data.redirect)
      $(location).attr('href', data.redirect);
    else {
      remove_processing()
      BootstrapDialog.alert(data.message.toString());
    }
  });
}

// GET IMAGE BASE 64 FORMAT TO IMAGE

function readURL(input) {
  file = input.files[0]
  var size = file.size/1024/1024;
  if (input.files && file && size <= 2) {
    var reader = new FileReader();

    reader.onload = (function(data) {
      return function(e) {
        var uploader = $(input).closest('.uploader-wrap')
        $(uploader).find('img.preview').attr('src', e.target.result)
        $(uploader).find('span.file-name').text(data.name)
      };
    })(file);
    reader.readAsDataURL(file);
  }
}

$(document).ready(function($) {
  // HANDLE SUBMITION BY AJAX

  $('form.ajax').bind("ajax:before", function(){
    for (instance in CKEDITOR.instances){
      CKEDITOR.instances[instance].updateElement();
    }
  });

  $("form.ajax").on("ajax:complete", function(event, data, status, xhr){
    var response = JSON.parse(data.responseText)
    if (response.redirect)
      $(location).attr('href', response.redirect);
    else {
      remove_processing()
      BootstrapDialog.alert(response.message);
    }
  });

  $('.submit-now').click(function(){
    set_processing()
    $(this).closest('form').trigger('submit.rails');
  })
}); // End of $(document).ready()
