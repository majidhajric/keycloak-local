
$(document).ready(function() {

  console.log('login.js - ready()');


  $('#login-backdrop').hide();

  $('#login-backdrop').on('click', () => {
    $('#login-backdrop').hide();
  });

  $('input.sensitive-information').on('click', (e) => {
    $(e.target).parent().addClass('z-index-4');
    $('#login-backdrop').show();
  });
  $('#username').focus();
});
