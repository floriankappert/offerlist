  $(document).ready(function(){
    $('[data_behaviour~=datepicker]').datepicker(
    	{
		    format: 'dd.mm.yyyy',
		    startDate: '0d'
		}
    );
    if($("#offer_company").length > 0) {
    $( "#offer_company" ).autocomplete({
       source: $("#offer_company").data('autocomplete-source'),
       focus: function( event, ui ) {
          $( "#offer_company" ).val( ui.item.company );
          return false;
        },
        select: function( event, ui ) {
          $( "#offer_company" ).val( ui.item.company );
   
          return false;
        }
    }).data( "ui-autocomplete" )._renderItem = function( ul, item ) {
      return $( "<li>" )
        .append( "<a>" + item.company + "<br>" + item.company + "(" + item.total + ")</a>" )
        .appendTo( ul );
    };;
   }

    $('.offer_items').sortable({
        placeholder: "ui-state-highlight",
        forcePlaceholderSize: true,
        handle: '.handle',
        update: function() {
          return $.post($(this).data('update-url'), $(this).sortable('serialize'));
        }
    });

    $('.offer_items').disableSelection();

  })