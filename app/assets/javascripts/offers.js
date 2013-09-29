  $(document).ready(function(){
    $('[data_behaviour~=datepicker]').datepicker(
    	{
		    format: 'dd.mm.yyyy'
		}
    );
    $(".pagination ul").addClass("pagination");
  })