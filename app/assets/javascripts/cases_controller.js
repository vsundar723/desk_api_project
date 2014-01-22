$(document).ready(function() {
  $('#create-label')[0].reset();
  $('#form-case').prop('disabled', true);
  $('#submit-and-apply').prop('disabled', true);
});


$(document).on('click', '#form-enabled', function() {
  if ($('#form-enabled').prop('checked')) {
    $('#form-case').prop('disabled', false);
    $('#submit-and-apply').prop('disabled', false);
  } else {
    $('#form-case').prop('disabled', true);
    $('#submit-and-apply').prop('disabled', true);
  }
});

function sendData($form, data, url) {
  $.ajax({
    url: url,
    type: $form.attr('method'),
    data: data,
    contentType: 'application/json',
    dataType: 'json',
    async: false,
    success: function(data) {
      if(data && ((data.status === '201 Created') || (data.status === '200 OK'))) {
        $('#alert').empty().append(
          '<div class="alert alert-success alert-dismissable">' +
            '<button type="button" class="close" data-dismiss="alert">' +
            '&times;</button>' + 'Successfully Saved.' +
            '<a href="' + window.location.origin + '" class="alert-link">Refresh</a> to see the changes.' +
          '</div>');
      } else {
        $('#alert').empty().append(
          '<div class="alert alert-danger alert-dismissable">' +
            '<button type="button" class="close" data-dismiss="alert">' +
            '&times;</button>' + 'Something went wrong' + '</div>');
      }
    },
  });
}

$(document).on('click', '#submit-and-apply', function(e){
  var $form = $('#create-label');
  var $data = {
    name: $('#formName').val(),
    description: $('#form-desc').val(),
    types: $('#form-types').val(),
    enabled: $('#form-enabled').prop('checked'),
    color: $('#form-color').val(),
    selected_case: $('#form-case').val()
  };
  e.preventDefault();
  sendData($form, $data, '/cases/createAndApply');
});

$(document).on('click', '#submit', function(e){
  var $form = $('#create-label');
  var $data = {
    name: $('#formName').val(),
    description: $('#form-desc').val(),
    types: $('#form-types').val(),
    enabled: $('#form-enabled').prop('checked'),
    color: $('#form-color').val()
  };
  e.preventDefault();
  sendData($form, $data, '/cases/create');
});