<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<!--
/*
 * blueimp Gallery Demo
 * https://github.com/blueimp/Gallery
 *
 * Copyright 2013, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */
-->
<html>
<head>
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<![endif]-->

<meta charset="utf-8">
<base href="/vweibo/">
<title>视频播放</title>
<meta name="description"
	content="blueimp Gallery is a touch-enabled, responsive and customizable image and video gallery, carousel and lightbox, optimized for both mobile and desktop web browsers. It features swipe, mouse and keyboard navigation, transition effects, slideshow functionality, fullscreen support and on-demand content loading and can be extended to display additional content types.">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="front/css/blueimp-gallery.css">
<link rel="stylesheet" href="front/css/blueimp-gallery-indicator.css">
<link rel="stylesheet" href="front/css/blueimp-gallery-video.css">
<link rel="stylesheet" href="front/css/demo.css">
<script src="front/js/blueimp-helper.js"></script>
<script src="front/js/blueimp-gallery.js"></script>
<script src="front/js/blueimp-gallery-fullscreen.js"></script>
<script src="front/js/blueimp-gallery-indicator.js"></script>
<script src="front/js/blueimp-gallery-video.js"></script>
<script src="front/js/blueimp-gallery-vimeo.js"></script>
<script src="front/js/blueimp-gallery-youtube.js"></script>
<script src="front/js/vendor/jquery.js"></script>
<script src="front/js/jquery.blueimp-gallery.js"></script>
<script src="front/js/demo.js"></script>
</head>
<body>

	<div id="blueimp-image-carousel"
		class="blueimp-gallery blueimp-gallery-carousel">
		<div class="slides"></div>
		<h3 class="title"></h3>
		<a class="prev">‹</a> 
		<a class="next">›</a> 
		<a class="play-pause"></a>
	</div>
	<br>
	<div id="blueimp-video-carousel"
		class="blueimp-gallery blueimp-gallery-controls blueimp-gallery-carousel">
		<div class="slides"></div>
		<h3 class="title"></h3>
		<a class="prev">‹</a> 
		<a class="next">›</a> 
		<a class="play-pause"></a>
	</div>
	<br>
	<div id="links" class="links"></div>
	<div id="blueimp-gallery" class="blueimp-gallery">
		<div class="slides"></div>
		<h3 class="title"></h3>
		<a class="prev">‹</a> 
		<a class="next">›</a> 
		<a class="close">×</a> <a
			class="play-pause"></a>
		<ol class="indicator"></ol>
	</div>

</body>
</html>
