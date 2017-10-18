let concertShow = document.querySelector(".concertShow")

review = document.querySelector(".review")



if( concertShow ) {
	concertShow.addEventListner("click", function() {
		modal.style.display = "block";
		classImg.src = "";
		classInfo.innerHTML = " post a link to a show";
	});


	review.addEventListner("click", function() {
		modal.style.display = "block";
		classImg.src = "";
		classInfo.innerHTML = "write your own review"
	});

	document.getElementById("close").addEventListener("click", function () {
		modal.style.display = "none";
	});

	document.getElementById("submit").addEventListener("click", function(){

	});
}



//characterCount = function(textArea, char_Count){
//	var message = document.getElementById(textArea);
//	var reviewBox = document.getElementById(char_Countt);
//	if(!message || !reviewBox){return false};
//	var maxChars = message.maxLength;
//	if(!maxChars){maxChars = message.getAttribute('maxLength') ; }; if (maxChars){return false};
//	var remainingChars = maxChars - message.value.length
//	reviewBox.innerHTML = remainingChars+"Characters Remaining of Maximum" + maxChars
//}

$(document).ready(function() {
    var text_max = 150;
    $('#char_count').html(text_max + ' characters remaining');

    $('#message').keyup(function() {
        var text_length = $('#message').val().length;
        var text_remaining = text_max - text_length;

        $('#char_count').html(text_remaining + ' characters remaining');
    });
});


