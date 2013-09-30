  $(document).ready(function(){
    $('[data_behaviour~=datepicker]').datepicker(
    	{
		    format: 'dd.mm.yyyy',
		    startDate: '0d'
		}
    );

  })