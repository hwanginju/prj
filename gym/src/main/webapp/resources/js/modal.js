/**
 * 
 */
 
 function modalshow() {
	console.log("show");
	document.querySelector(".background").className = "background show";
}

function modalclose() { 
	console.log("close");
	document.querySelector(".background").className = "background";
}