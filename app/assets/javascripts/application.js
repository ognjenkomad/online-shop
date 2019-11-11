// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require ./debounce/jquery.ba-throttle-debounce.js
//= require popper
//= require bootstrap
//= require_tree .

$(document).ready(function () {
  initRemoveFields()
  initAddAddresses()
  initHideFlashMessages()
  initSearchArticles()
  initFilterArticles()
})

function initFilterArticles() {
  $('.refresh-page').on('click', function() {
    const params = getRequestParams()
    getArticles(params)
  })
}

function getRequestParams () {
  const minValueInput = $('#min_value')
  const maxValueInput = $('#max_value')
  const searchInput = $('#search')
  const clearButton = $('#clear-sarch')
  const params = {}

  if (searchInput.val().length > 2) {
    clearButton.prop('disabled', false)
    params['filter[search]'] = searchInput.val()
  } else {
    clearButton.prop('disabled', true)
    delete params['filter[search']
  }

  if (minValueInput.val()) {
    params['filter[min_value]'] = parseInt(minValueInput.val())
  } else {
    delete params['filter[min_value]']
  }

  if (maxValueInput.val()) {
    params['filter[max_value]'] = parseInt(maxValueInput.val())
  } else {
    delete params['filter[max_value]']
  }
  return params
}

function initSearchArticles () {
  $searchInput = $('#search')
  $("#clear-sarch").on('click', function () {
    $searchInput.val('')
    params = getRequestParams()
    getArticles(params)
  })

  $searchInput.on('input', $.debounce(500, false, function () {
    const params = getRequestParams()
    getArticles(params)
  }, 800))
}

function getArticles(params) {
  url = '/articles'
  $.ajax({
    url: url,
    type: 'GET',
    data: params
  }).then(refreshPageCallback)
}

function refreshPageCallback (res) {
  var dummyHTML = document.createElement('html');
  dummyHTML.innerHTML = res
  var newPageBody = dummyHTML.querySelector('#articles-container')

  $('#articles-container').remove()
  $('.container').append(newPageBody)
}
function initHideFlashMessages () {
  setTimeout(function(){
    $('.alert').fadeOut();
    }, 1500);
}

function initRemoveFields() {
  $('.remove-link').on('click', removeFields)
}

function initAddAddresses() {
  $('.add-address-link').on('click', addAddresses)
}

function removeFields() {
  var addressFieldsCount = $('.fields').length
  if(addressFieldsCount > 1) {
    $(this).prev('input[type=hidden]').val(1)
    $(this).parent('.fields').hide()
  } else {
    alert('You must have at least one address!')
  }
}

function addAddresses() {
  var content = $(this).attr('data-fields')
  var newId = new Date().getTime();
  var regexp = new RegExp("new_" + 'addresses', "g")

  $(this).parent().children('.fields-container').append(content.replace(regexp, newId));
  initRemoveFields()
}
