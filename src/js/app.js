// functions go here!
function getYear(value)
{
	const d = new Date();
	return d.getFullYear();
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
} );