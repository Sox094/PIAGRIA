// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//=require jquery-ui
//= require bootstrap-sprockets
//= require jquery_ujs
//=require toastr
//= require cocoon
//= require jquery_nested_form
//= require turbolinks
//= require_tree .

toastr.options = {
    "positionClass":"toast-bottom-right"
}

document.addEventListener("turbolinks:load", function() {
  $(document).ready(function(){
    $('#remove_question').click(function(){
    $('#bloc-questions input').prevAll("input[type=hidden]").first().val("1");
    $('#remove_question').closest("#bloc-questions").hide();
    
  });

  });
});



function remove_fields(link) {
  $(link).previous("input[type=hidden]").value = "1";
  $(link).up(".fields").hide();
}


function add_fields(link, association, content) { 
    var new_id = new Date().getTime(); 
    var regexp = new RegExp("new_" + association, "g"); 
    $(link).parent().before(content.replace(regexp, new_id));
    console.log("Ajout");
  
}


