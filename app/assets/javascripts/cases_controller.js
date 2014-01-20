$(document).on('click', '#submit-and-apply', function(e){
  var $form = $('#create-label');
  var $data = {
    name: $('#formName').val(),
    description: $('#form-desc').val(),
    types: $('#form-types').val(),
    enabled: $('#form-enabled').prop("checked"),
    color: $('#form-color').val(),
    selected_case: $('#form-case').val()
  }
  e.preventDefault();
  sendData($form, $data, '/cases/createAndApply');
});

$(document).on('click', '#submit', function(e){
  var $form = $('#create-label');
  var $data = {
    name: $('#formName').val(),
    description: $('#form-desc').val(),
    types: $('#form-types').val(),
    enabled: $('#form-enabled').prop("checked"),
    color: $('#form-color').val()
  }
  e.preventDefault();
  sendData($form, $data, '/cases/create');
});

function sendData($form, data, url) {
  $.ajax({
    url: url,
    type: $form.attr('method'),
    data: data,
    contentType: 'application/json',
    dataType: 'json',
    success: function(data){
      alert('successfully submitted')
    }
  });
}