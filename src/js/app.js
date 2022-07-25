// functions go here!
function getYear(value)
{
	const d = new Date();
	return d.getFullYear();
}

function runAjax(type='POST',data='')
{
	var xhttp = new XMLHttpRequest();

	xhttp.onreadystatechange = function() {
		if (this.readyState == 4 && this.status == 200) {
			console.log(this);
		}
	};

	xhttp.open(type, "http://api.cowlingdigital.local/index.php", true);
	xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

	if (data.length > 0) {
		xhttp.send(data);
	} else {
		xhttp.send('hello=world');
	}
}
// ------------------- //

/**
 * Wait for the dom the load before excuting more scripts.
 * @param {*} callback 
 */
var domReady = (callback) => {
	// If DOM not ready then call back to itelf until it is
	if (document.readyState != "loading") callback();
	// DOM has loaded
	else document.addEventListener("DOMContentLoaded", callback);
}

domReady( () => {
	// add year to the copyright footer
	const year = document.getElementsByClassName('copyright__year').item(0);
	year.innerHTML = getYear();

	runAjax('POST');
} );