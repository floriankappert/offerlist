// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.purr
//= require best_in_place
//= require jquery.ui.all
//= require_tree .
//= require bootstrap-datepicker/core
//= require bootstrap-datepicker/locales/bootstrap-datepicker.de

  $(document).ready(function(){
    $(".pagination ul").addClass("pagination");
    $('.best_in_place').best_in_place();

    // Sets values for vat and gross in offer items form
    $(".js-offer-wrapper").on("focusout", "#offer_item_net" ,function(e) {
    	var p = $(this).closest("tr");

    	p.find("#offer_item_vat").val(p.find("#offer_item_net").val() * ( p.find("#offer_item_vatrate").val() / 100) );
		p.find("#offer_item_gross").val(p.find("#offer_item_net").val() * ( ( 1 + p.find("#offer_item_vatrate").val() ) / 100) );
	});

  })