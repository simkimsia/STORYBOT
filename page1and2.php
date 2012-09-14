<html>
<head>
<title>STORYZER - Login</title>
<link href="CSS/styleSheet.css" rel="stylesheet" type="text/css">

<!--		<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
		-->
		
		<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
		<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
		<script type="text/javascript">
		if (typeof jQuery == 'undefined')
		{
		    document.write(unescape("%3Cscript src='js/jquery-ui.1.8.0.min.js' type='text/javascript'%3E%3C/script%3E"));
			document.write(unescape("%3Cscript src='js/jquery.1.8.1.min.js' type='text/javascript'%3E%3C/script%3E"));
		}
		</script>		

</head>

<body>

<div id="wrapper">
	<!-- Header Start -->
	<div id="header" style="dispay: inline">
		<img src="images/face.png" />
		<div class="headerBackground">
			<span class="title">untitled new work...</span>
			<div id="buttonPanel">
				<img src="images/but_pages.png" />
				<img src="images/but_save.png" />
				<img src="images/but_preview.png" />
				<a id="publishButton" href="#"><img src="images/but_publish.png" /></a>
			</div>
		</div>
	</div>
	<!-- Header End -->
	 
	<div id="content-wrapper">
		
		<div id="loginContent"> 
			<div class="info">
				<span class="titleText">Pages - 999,999,999</span><span class="orangeTitle" style="float: right">FLIP LEFT TO RIGHT</span><br />
				<div id="horizonalRow"></div> 
				<div id="dragImageHere"></div>
			</div>
		</div>
		
		<div id="page2content">
			<!-- Left Panel Start -->
			<div id="sidebar-left">
				<div class="info">
					<input id="files-upload" type="file" multiple style="display:none;" name="files" />
					<span class="titleText">INFO</span><span id="star">*</span><a href="#"><div class="helpIcon"></div></a><br />
					<div id="spacer"></div>
					<input type="text" name="description" /><br />
					<div id="spacer"></div>
					<textarea rows="5" name="description"></textarea><br />
					<div id="spacer"></div>
					<input type="radio" style="width:auto;" /><span class="orangeTitle">Discussion Enabled</span><br />
				</div>	
				<div id="horizonalRow"></div> 
				
				<div id="covers">
					<span class="titleText">Covers</span><span id="star">*</span><a href="#"><div class="helpIcon"></div></a><br />
					<div id="spacer"></div>
					<div class="box" style="float: left"></div> <div class="box" style="margin-left: 140px"></div>
				</div>
				<div id="horizonalRow"></div>
				
				<div id="sneaks">
					<span class="titleText">Sneaks</span><span id="star"> </span><a href="#"><div class="helpIcon"></div></a><br />
					<div id="spacer"></div>
					<div id="sneaksCollection">
						<div style="margin-left:0px"></div>
						<div></div>
						<div></div>
						<div></div>
					</div>
					<div style="clear: both"></div>							
				</div>
				<div id="horizonalRow"></div>
			
				<div id="genre">
					<span class="titleText">Genre</span><span id="star">*</span><a href="#"><div class="helpIcon"></div></a><br />
					<div id="spacer"></div>				
					<span>Adventure - Martial Arts - Supernatural</span> <span class="orangeTitle" style="float:right">Edit</span>
				</div>
				<div id="horizonalRow"></div>
			
				<div id="type-price">
					<span class="titleText">Type - Price</span><span id="star">*</span><a href="#"><div class="helpIcon"></div></a><br />
					<div id="spacer"></div>
					<input type="text" /><br />
					<div id="spacer"></div>
					<span id="star">*</span><span>Required Fields</span>
				</div>
				<div id="horizonalRow"></div>

				<div id="author">
					<img src="images/thumb.png" style="display:inline; float: left" />
					<span id="authorName">Name of Author</span><br />
					<span id="copyright">2012 - ALL RIGHTS RESERVED</span><br />				
				</div>
				<div id="horizonalRow"></div>			
			</div>
			<!-- Left Panel End -->

		<!-- Body Content Start -->
			<div id="content">
				<div id="pagesCollectionRightPanel" class="info">
					<span class="titleText">Pages - 999,999,999</span><span class="orangeTitle" style="float: right">FLIP LEFT TO RIGHT</span><br />
					<div id="horizonalRow"></div>
										<!--
					<div class="pagesCollection" id="row1">

						<div class="pagesGroup">
							<div class="pagesDiv">
							
							</div>
							<div class="pagesText">File Name</div>					
						</div>
						<div>
							<div class="pagesDiv"></div>
							<div class="pagesText">File Name</div>					
						</div>
						<div>
							<div class="pagesDiv"></div>
							<div class="pagesText">File Name</div>					
						</div>
						<div>
							<div class="pagesDiv"></div>
							<div class="pagesText">File Name</div>					
						</div>					
					</div>
					<div style="clear:both"></div>

					<div class="pagesCollection">
						<div class="pagesGroup">
							<div class="pagesDiv"></div>
							<div class="pagesText">File Name</div>					
						</div>
						<div>
							<div class="pagesDiv"></div>
							<div class="pagesText">File Name</div>					
						</div>
						<div>
							<div class="pagesDiv"></div>
							<div class="pagesText">File Name</div>					
						</div>
						<div>
							<div class="pagesDiv"></div>
							<div class="pagesText">File Name</div>					
						</div>	
			
					</div> 					-->	
				
				</div>	
	
			</div>
		<!-- Body Content End -->
		</div> <!-- page 2 content -->
	</div> 
	<!-- Footer Start -->
	 <div id="footer">  </div> 
	<!-- Footer End -->
</div><br /><br />


	<script>
	
	var pageCounter = 0;
	var parentOfRows ;
	
	var filesToBeUploaded = new Array();
	
		$(document).ready(function() {
			$("#page2content").hide();
			$("#loginContent").show();	
			parentOfRows = document.getElementById("pagesCollectionRightPanel");
			$("#publishButton").on("click", function() {
				alert("hihi");
				uploadFiles();
			});
			
		});
		
		
		(function () {
			
			 // var filesUpload = document.getElementById("files-upload"),
			var	dropArea = document.getElementById("loginContent"),
				page2Content = document.getElementById("page2content"),
				row1 = document.getElementById("row1");


			function presentFile (file) {
				var pageBlockDiv = document.createElement("div"),
					pageImageDiv = document.createElement("div"),
					pageFileNameDiv = document.createElement("div"),
					img,
					reader,
					xhr,
					fileInfo;
				
				pageBlockDiv.id = getPageId(pageCounter + 1);
				$(pageImageDiv).addClass("pagesDiv");
				$(pageFileNameDiv).addClass("pagesText");
				pageFileNameDiv.innerHTML = "File Name " + (pageCounter + 1);

				/*
					If the file is an image and the web browser supports FileReader,
					present a preview in the file list
				*/
				
				/**
				 * check file is an image
				 */
				var validFile = isFileValid(file);
				
				
				if (validFile) {
					
					// add file to array filesToBeUploaded
					filesToBeUploaded[pageBlockDiv.id] = file;
					
					console.log(pageCounter);
					if ((pageCounter % 4) == 0) {
						pageBlockDiv.className = "pagesGroup";
					}
					
					var currentRowId = getCurrentRowId();
					var currentRowElement = getCurrentRowElement(currentRowId);
					
					pageBlockDiv.appendChild(pageImageDiv);
					pageBlockDiv.appendChild(pageFileNameDiv);
					
					img = document.createElement("img");
					img.className = "arrangeable";
					
					/*
					var imgdiv = document.createElement("div");
					imgdiv.draggable = true;
				
					
					imgdiv.className = "brick";
					imgdiv.classList.add("photo");
					imgdiv.classList.add("pagesDiv");
					
					
					imgdiv.addEventListener('mousedown', function grab(ev) {
						this.classList.add("grabbed");
				    });

					imgdiv.addEventListener('mouseup', function letgo(ev) {
						this.classList.remove("grabbed");
				    });
					
					
					var overlaydiv = document.createElement("div");
					overlaydiv.className = "overlay";
					
					var closelink = document.createElement("a");
					closelink.innerHTML = "close<span></span>";
					closelink.className = "btn-close";									
					closelink.href = "#";
					
					closelink.addEventListener('click', function(e) {
						$(this).closest('div.brick').remove();
				    });
					
					var innerdiv = document.createElement("div");
					innerdiv.className = "inner";
					
					var datediv = document.createElement("div");
					
					datediv.className = "date";
					datediv.innerHTML = "Sept 5th";
					
					var notesdiv = document.createElement("div");
					notesdiv.className = "notes";
					notesdiv.innerHTML = "45 notes";
					
					innerdiv.appendChild(datediv);
					innerdiv.appendChild(notesdiv);
					overlaydiv.appendChild(closelink);
					overlaydiv.appendChild(innerdiv);
					
					imgdiv.appendChild(overlaydiv);
					
					imgdiv.id = "img" + fileCounter;
					fileCounter = fileCounter + 1;
					
					imgdiv.addEventListener('dragstart', handleDragStart, false);

					imgdiv.addEventListener('dragover', handleDragOver, false);

					imgdiv.addEventListener('drop', handleDrop, false);

					imgdiv.appendChild(img);
					li.appendChild(imgdiv);
					/* add the image to supposed display area */
					
					pageImageDiv.appendChild(img);
					
					reader = new FileReader();
					reader.onload = (function (theImg) {
						return function (evt) {
							theImg.src = evt.target.result;
							theImg.height = 214;
							theImg.width = 141;
							//theImg.height = 212.708;
							//theImg.width = 150.361;

						};
						
					}(img));
					
					reader.readAsDataURL(file);
					
					$(currentRowElement).append(pageBlockDiv);
					console.log("at this point");
					console.log(currentRowElement);
					
					pageCounter++;
				}

				
				
				/*
				// Present file info and append it to the list of files
				fileInfo = "<div><strong>Name:</strong> " + file.name + "</div>";
				fileInfo += "<div><strong>Size:</strong> " + parseInt(file.size / 1024, 10) + " kb</div>";
				fileInfo += "<div><strong>Type:</strong> " + file.type + "</div>";
				div.innerHTML = fileInfo;

				fileList.appendChild(li);
				*/

			}

			

			function isFileValid(file) {
				// this tests to ensure the file type is image/xxxx
				return (typeof FileReader !== "undefined" && (/image/i).test(file.type));
			}

			function traverseFiles (files) {
				if (typeof files !== "undefined") {
					for (var i=0, l=files.length; i<l; i++) {
						presentFile(files[i]);
					}
				}
				else {
					// show no support error message here
					alert("No support for the File API in this web browser");
				}	
			}

/*
			filesUpload.addEventListener("change", function () {
				traverseFiles(this.files);
			}, false);
			*/
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
				$(dropArea).hide();
				// we will parse all the dropped files into page2Content area
				traverseFiles(evt.dataTransfer.files);
				$(page2Content).show();
								
				this.className = "";
				evt.preventDefault();
				evt.stopPropagation();
				
			}, false);	
			
			
			
												
		})();
		
		// this will upload all the files in the array 
		function uploadFiles() {

			for(key in filesToBeUploaded)
			{
				
			
			   var file = filesToBeUploaded[key];
				// Uploading - for Firefox, Google Chrome and Safari
				xhr = new XMLHttpRequest();
				/*
				// Update progress bar
				xhr.upload.addEventListener("progress", function (evt) {
					if (evt.lengthComputable) {
						progressBar.style.width = (evt.loaded / evt.total) * 100 + "%";
					}
					else {
						// No data to calculate on
					}
				}, false);

				// File uploaded
				xhr.addEventListener("load", function () {
					progressBarContainer.className += " uploaded";
					progressBar.innerHTML = "Uploaded!";
				}, false);
				*/
				
				fileUpload = xhr.upload,
				fileUpload.onload = function() {
					console.log("Sent!");
				}
				xhr.open("post", "upload.php", true);

				// Set appropriate headers
		        xhr.setRequestHeader("Content-Type", "multipart/form-data");				
				xhr.setRequestHeader("Cache-Control", "no-cache");
		        xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest");
		        xhr.setRequestHeader("X-File-Name", file.name);
		        xhr.setRequestHeader("X-File-Size", file.size);
				xhr.setRequestHeader("X-File-Type", file.type);


//				xhr.send(reader.readAsBinaryString(file));
		        /*
				xhr.setRequestHeader("Content-Type", "multipart/form-data");
				xhr.setRequestHeader("X-File-Name", file.fileName);
				xhr.setRequestHeader("X-File-Size", file.fileSize);
				xhr.setRequestHeader("X-File-Type", file.type);

				// Send the file (doh)*/
				xhr.send(file);
				
			}
			alert('all uploaded!');
		}
		
		
		/**
		 * find id of current row based on page counter
		 */
		function getCurrentRowId() {
			var quotient = Math.floor(pageCounter / 4); // since each row max 4 
			return "row" + (quotient + 1);
		}
		
		function getPageId(page) {
			if (page < 10) {
				return "page_000" + page;
			} 
			
			if (page < 100) {
				return "page_00" + page;
			}
			
			if (page < 1000) {
				return "page_0" + page;
			}
			
			return "page_" + page;
		}
		
		function getCurrentRowElement(rowid) {

			if ($("#" + rowid).length == 0) {
				var newRow = document.createElement("div");
				newRow.id = rowid;
				newRow.className = "pagesCollection";
				$(parentOfRows).append('<div style="clear:both"></div>');
				parentOfRows.appendChild(newRow);
			} 
			var isit = document.getElementById(rowid);
			return isit;
		}
	</script>

</body>
</html>