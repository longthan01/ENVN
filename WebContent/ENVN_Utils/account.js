/**
 * 
 */
function logout() {
$.ajax({
	url : context + "/account/logout",
	type : "GET",
	/*
	 * headers: { Accept : "application/json; charset=utf-8", },
	 */
	dataType : 'json',
	contentType : "application/json; charset=utf-8",
	beforeSend : function() {

	},
	success : function(result) {
	if (result.code == 1) {
	  setTimeout(function(){
	      location.reload();
	    },1200);
	} else {
		console.log(result);
	}
	},
	error : function(req, status, err) {
	console.log('Something went wrong', status, err);
	}
});
}