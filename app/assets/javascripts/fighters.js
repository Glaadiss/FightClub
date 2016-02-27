$(function(){
	var length = 0;
	$('.check_boxes .optional').click(function(){
		 length = $(".check_boxes .optional:checked").length
		if(length > 8)
		this.checked = false;
		console.log(length);
	})



})
