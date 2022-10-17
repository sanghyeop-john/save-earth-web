$(function(){
	$("#report_list a").click(function(){
		var no = $(this).attr('alt');
		$.ajax({
			url: '/report/hitUpdate',
			data: "no="+no,
			success: function(){
				
			}, error: function(){
				console.log(e.responseText);
			}
		});
	});
	
	
	$(window).on('load', function(){
		$('#category>li>a').removeClass();
		var category = getUrlParameter('category');
		
		if(category == 1){
			$('#category>li').eq(0).children().addClass('active');
		}else if(category == 2){
			$('#category>li').eq(1).children().addClass('active');
		}else if(category == 3){
			$('#category>li').eq(2).children().addClass('active');
		}else{
			$('#category>li').eq(3).children().addClass('active');
		}
		
	});
});

var getUrlParameter = function getUrlParameter(sParam) {
    var sPageURL = window.location.search.substring(1),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;

    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');

        if (sParameterName[0] === sParam) {
            return sParameterName[1] === undefined ? true : decodeURIComponent(sParameterName[1]);
        }
    }
    return false;
};