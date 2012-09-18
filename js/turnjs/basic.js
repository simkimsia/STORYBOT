/*
 * Basic sample
 */

function addPage(file, pageNumber, book) {

	var id, pages = book.turn('pages');

	var reader = new FileReader();
    reader.onload = (function (theImg) {
        return function (evt) {
            var newImg = $("<img />");
            newImg.attr("src", evt.target.result);
            newImg.attr("width", "100%");
            newImg.attr("height", "100%");

            var divPage = $('<div>');

            newImg.appendTo(divPage);

            book.turn("addPage", divPage, pageNumber);
            console.log('adding pages');
            console.log(pageNumber);
        };
    }(file));

    reader.readAsDataURL(file);
}


function removeAllPages(book) {

	var pages = book.turn('pages');

    for (var page = 1; page <= book.turn('pages'); page++) {

    	console.log(flipbook.turn('pages'));

    	if (flipbook.turn('pages') > 0) {
       		flipbook.turn('removePage', 1);	
		} else {
			break;
		}
 
    }

}

// http://code.google.com/p/chromium/issues/detail?id=128488
function isChrome() {

	return navigator.userAgent.indexOf('Chrome')!=-1;

}