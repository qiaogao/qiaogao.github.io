---
layout: post
title: "Video stream test"
description: ""
postphoto: "default"
category: test
tags: [test]
group: posts
---
{% include JB/setup %}
<div>
<video id="video1" onload="removeControls();" width="920" autoplay="true" loop="true">
  <source src="{{ BASE.PATH }}/video/dock.mp4" type="video/mp4">
  <source src="{{ BASE.PATH }}/video/dock.ogv" type="video/ogv">
  <source src="{{ BASE.PATH }}/video/dock.webm" type="video/webm">
  <object data="{{ BASE.PATH }}/video/dock.mp4" width="920">
    <embed src="{{ BASE.PATH }}/video/dock.swf" width="920">
  </object> 
</video>
<script>
video.setAttribute("controls","controls");

removeControls = function() {
  var video = document.getElementById('video1');
  video.removeAttribute("controls");
}
</script>
</div>
<video id="video1" onload="removeControls();" width="920" autoplay="true" loop="true">
  <source src="{{ BASE.PATH }}/video/tags.mp4" type="video/mp4">
  <source src="{{ BASE.PATH }}/video/tags.ogv" type="video/ogv">
  <source src="{{ BASE.PATH }}/video/tags.webm" type="video/webm">
  <object data="{{ BASE.PATH }}/video/tags.mp4" width="920">
    <embed src="{{ BASE.PATH }}/video/tags.swf" width="920">
  </object> 
</video>