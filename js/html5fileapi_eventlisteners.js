filesUpload.addEventListener("change", function () {
	traverseFiles(this.files);
}, false);

dropArea.addEventListener("dragleave", function (evt) {
	var target = evt.target;

	if (target && target === dropArea) {
		this.className = "";
	}
	evt.preventDefault();
	evt.stopPropagation();
}, false);

dropArea.addEventListener("dragenter", function (evt) {
	this.className = "over";
	evt.preventDefault();
	evt.stopPropagation();
}, false);

dropArea.addEventListener("dragover", function (evt) {
	evt.preventDefault();
	evt.stopPropagation();
}, false);

dropArea.addEventListener("drop", function (evt) {
	traverseFiles(evt.dataTransfer.files);
	this.className = "";
	evt.preventDefault();
	evt.stopPropagation();
}, false);