---
layout: post
title: "Music stream test"
description: ""
postphoto: "ff9"
category: test
tags: [test]
group: posts
---
{% include JB/setup %}
<div>
<audio controls autoplay loop>
    // MP3 file (Chrome/Safari/IE9)
    <source src="{{ BASE.PATH }}/music/12 Where Love Doesn't Reach.mp3" type="audio/mpeg" />
    // Ogg Vorbis (Firefox)
    <source src="{{ BASE.PATH }}/music/12 Where Love Doesn't Reach.ogg" type="audio/ogg" />
</audio>
</div>