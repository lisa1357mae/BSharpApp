$(document).ready(function() {
	console.log("ready");
    var text_max = 150;
    $('#char_count').html(text_max + ' characters remaining');

    $('#review').keyup(function() {
    	console.log("key up!")
        var text_length = $('#review').val().length;
        var text_remaining = text_max - text_length;
        $('#char_count').html(text_remaining + ' characters remaining');
    });
});



//
// let concertShow = document.querySelector(“.concertShow”)
//
// review = document.querySelector(“.review”)
//
// concertShow.addEventListner(“click”, function() {
// modal.style.display = “block”;
// classImg.src = “”;
// classInfo.innerHTML = “ post a link to a show”;
// })

// 	review.addEventListner("click", function() {
// 		modal.style.display = "block";
// 		classImg.src = "";
// 		classInfo.innerHTML = "write your own review"
// 	});


// 	document.getElementById("close").addEventListener("click", function () {
// 		modal.style.display = "none";
// 	});

// 	document.getElementById("submit").addEventListener("click", function(){

// 	});
// }


