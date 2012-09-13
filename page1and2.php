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
				<img src="images/but_publish.png" />
			</div>
		</div>
	</div>
	<!-- Header End -->
	 
	<div id="content-wrapper">
		
		<div id="loginContent"> 
			<div id="info">
				<span class="titleText">Pages - 999,999,999</span><span class="orangeTitle" style="float: right">FLIP LEFT TO RIGHT</span><br />
				<div id="horizonalRow"></div> 
				<div id="dragImageHere"></div>
			</div>
		</div>
		
		<div id="page2content">
		<!-- Left Panel Start -->
		<div id="sidebar-left">
			<div id="info">
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
			<div id="info">
				<span class="titleText">Pages - 999,999,999</span><span class="orangeTitle" style="float: right">FLIP LEFT TO RIGHT</span><br />
				<div id="horizonalRow"></div>
				<div id="pagesCollection">
					<div id="pagesGroup">
						<div id="pagesDiv"></div>
						<div id="pagesText">File Name</div>					
					</div>
					<div>
						<div id="pagesDiv"></div>
						<div id="pagesText">File Name</div>					
					</div>
					<div>
						<div id="pagesDiv"></div>
						<div id="pagesText">File Name</div>					
					</div>
					<div>
						<div id="pagesDiv"></div>
						<div id="pagesText">File Name</div>					
					</div>					
				</div>
				<div style="clear:both"></div>

				<div id="pagesCollection">
					<div id="pagesGroup" >
						<div id="pagesDiv"></div>
						<div id="pagesText">File Name</div>					
					</div>
					<div>
						<div id="pagesDiv"></div>
						<div id="pagesText">File Name</div>					
					</div>
					<div>
						<div id="pagesDiv"></div>
						<div id="pagesText">File Name</div>					
					</div>
					<div>
						<div id="pagesDiv"></div>
						<div id="pagesText">File Name</div>					
					</div>					
				</div>
				
			</div>	
	
		</div>
		<!-- Body Content End -->
	</div>
	</div> <!-- page 2 content -->
	<!-- Footer Start -->
	 <div id="footer">  </div> 
	<!-- Footer End -->
</div><br /><br />


	<script>
		$(document).ready(function() {
			$("#page2content").hide();
			$("#loginContent").show();			
		});
		
		
		(function () {
			
			 // var filesUpload = document.getElementById("files-upload"),
			var	dropArea = document.getElementById("loginContent"),
				page2Content = document.getElementById("page2content");
			//	fileList = document.getElementById("file-list");
/*
			function uploadFile (file) {
				var li = document.createElement("li"),
					div = document.createElement("div"),
					img,
					reader,
					xhr,
					fileInfo;

				li.appendChild(div);
				

				/*
					If the file is an image and the web browser supports FileReader,
					present a preview in the file list
				*/
				/*
				if (typeof FileReader !== "undefined" && (/image/i).test(file.type)) {
					img = document.createElement("img");
					img.className = "arrangeable";
					
					var imgdiv = document.createElement("div");
					imgdiv.draggable = true;
				
					
					imgdiv.className = "brick";
					imgdiv.className = imgdiv.className + " photo";
					
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
					//dropArea.appendChild(img);
					/*
					reader = new FileReader();
					reader.onload = (function (theImg) {
						return function (evt) {
							theImg.src = evt.target.result;
							theImg.height = 212.708;
							theImg.width = 150.361;

						};
					}(img));
					
					reader.readAsDataURL(file);
				}

				// Uploading - for Firefox, Google Chrome and Safari
				
				xhr = new XMLHttpRequest();

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

				xhr.open("post", "upload/upload.php", true);

				// Set appropriate headers
				xhr.setRequestHeader("Content-Type", "multipart/form-data");
				xhr.setRequestHeader("X-File-Name", file.fileName);
				xhr.setRequestHeader("X-File-Size", file.fileSize);
				xhr.setRequestHeader("X-File-Type", file.type);

				// Send the file (doh)
				xhr.send(file);
				
				
				// Present file info and append it to the list of files
				fileInfo = "<div><strong>Name:</strong> " + file.name + "</div>";
				fileInfo += "<div><strong>Size:</strong> " + parseInt(file.size / 1024, 10) + " kb</div>";
				fileInfo += "<div><strong>Type:</strong> " + file.type + "</div>";
				div.innerHTML = fileInfo;

				fileList.appendChild(li);
			}

			function traverseFiles (files) {
				if (typeof files !== "undefined") {
					for (var i=0, l=files.length; i<l; i++) {
						uploadFile(files[i]);
					}
				}
				else {
					fileList.innerHTML = "No support for the File API in this web browser";
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
				//traverseFiles(evt.dataTransfer.files);
				//$(page2Content).show();
								
				this.className = "";
				evt.preventDefault();
				evt.stopPropagation();
				
			}, false);	
			
			
			
												
		})();
		
		
	</script>

</body>
</html>