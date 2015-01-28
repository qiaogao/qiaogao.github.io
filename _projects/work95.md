---
layout: project
date: 2014-01-21T00:00:06
title: "Optimization of a motion estimate algorithm for video coding"
description: ""
postphoto: "default"
category: System 
tags: [Linear system, Matlab]
group: works
---
{% include JB/setup %}

##Abstraction##

This design mainly describes an optimization procedure of a video coding algorithm depending on linear system theory. After deeply analyzing this system, I apply a digital linear optimization to make this system more stable and with less noise effects.   

##Algorithm Introduction##

Video coding is a technology that is useful in video compression, which will highly improve the efficiency of video transmission and storage. As described in [1], an important method for video coding called motion compensation plays a key role in improving coding efficiency. The main idea of video compression to achieve compression is to remove spatial and temporal redundancies existing in video sequences [1]. In order to achieve this, firstly we have to detect the motion vector (MV) between the reference frame and current frame. Then, the motion estimation will be generate during the frame scan...

For full PDF: [![pdf]({{ BASE.PATH }}/images/file_pdf.png)]({{ BASE.PATH }}/assets/Qiao Gao--A motion estimate algorithm for video coding.pdf) 

