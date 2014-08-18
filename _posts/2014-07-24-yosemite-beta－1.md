---
layout: post
title: "Mac OS X Yosemite Beta与Mavericks双启动安装"
description: "我的Mac OS X Yosemite尝鲜日记（一）"
postphoto: "yosemite"
category: test
tags: [Mac OS X, Yosemite, test]
group: posts
---
{% include JB/setup %}
##前言
难得苹果的新系统开放测试，我想每个Mac用户都不想错过这个机会，谁不想第一时间体验一下焕然一新的新系统呢？于是我早早就在苹果官网登记了账户。今天一早翻翻邮箱，终于等来了苹果的邮件，Yosemite Beta终于开始推送了：

![yosemite_1]({{ BASE.PATH }}/images/yosemite/yosemite_1.png)

抑制不住激动的心情，但是转念一想这只是beta版本，在使用中不可避免会有各种各样的问题。在网上随便一搜，发现许多不明真相的群众已经中招了，想要退回老版本当然也是非常麻烦。所以，思前想后决定做成双启动，将beta 版安装在其他分区。

##安装
###1.安装要求
打开邮件提供的链接，安装的要求很简单，只要满足如下三点：

*	已安装OS X Mavericks 10.9 或更高版本系统
*	至少2GB内存
*	至少8GB的硬盘空闲空间

当然对于新电脑这些都不是问题。老电脑的话最好确认一下Mac的信息：

*点击左上角**苹果图标** > 点击**关于本机***
###2.备份重要数据
安装前重要的数据还是要备份一下，可以选择使用Time Machine最好不过。当然这里我要装在第二分区，所以我就不管这么多了。
###3.下载
邮箱提供的链接会给出下载链接以及参加Beta的Redemption Code。点击下载之后会弹出app store，之后所有的下载过程都是自动的，稍等片刻。下载好之后，在应用程序的界面会出现如下图标：

![yosemite_2]({{ BASE.PATH }}/images/yosemite/yosemite_2.png)
###4.准备安装分区
安装过程会在下载结束后自动开始，我不想覆盖掉自己的系统，所以就没立刻开始，先准备另一个分区。（本来应该开始前就准备，我忘了。。。）

1. 在应用程序界面，点开 *其他*，在选择 *磁盘工具*，就是这个图标： 
![yosemite_3]({{ BASE.PATH }}/images/yosemite/yosemite_3.png)
2. 打开之后先在左边选中自己的硬盘，然后在右边选择 *分区*，出现如下界面：
![yosemite_4]({{ BASE.PATH }}/images/yosemite/yosemite_4.png)
3. 点击界面左下的 *＋* 来添加新的分区吧，这里我分了40GB，至少8GB。***重要：如果使用Bootcamp安装了Windows分区，这个方法可能会对windoes分区的引导造成问题。***虽然我没有尝试，但是有网友反映windows无法引导，所以三思而行。当然，安装之后Mac的双启动不会有任何问题，苹果在这些细节的方面总是很贴心，不会像以前Windows那样出现各种问题，虽然最近几年windows采用EFI引导之后有很大改观（貌似跑偏了。。。）

###5.安装
终于可以开始安装系统了，点击应用程序里下载之后新出现的图标，安装过程会开始，跟随着只是一直下一步吧。***注意选择安装分区的时候新的分区默认是不显示的***。点击磁盘图标下面的*显示所有磁盘*，就能在磁盘之间选择：

![yosemite_5]({{ BASE.PATH }}/images/yosemite/yosemite_5.png)

选择安装，然后屏幕一黑，安装就开始了：

![yosemite_6]({{ BASE.PATH }}/images/yosemite/yosemite_6.jpg)

安装好之后进入新的系统，如初始系统一样选择地区，Apple ID等，但是对于新的系统，当然会有不一样的地方。由于最着新的系统升级，iCloud也会有巨大的变化，开放了文件系统，涉及到apple服务器端的服务升级，因此安装程序会提问是否将iCloud升级到新版，***由于新的iCloud依赖IOS8和Yosemite，所以升级会导致IOS7或者其他老系统的部分新内容无法被同步***。如下：

![yosemite_7]({{ BASE.PATH }}/images/yosemite/yosemite_7.jpg)

这里我斟酌了一下，还是升级吧，因为没有iphone，iCloud也不是我使用的主要的云服务。这里选择升级的话会在建立iCloud账户的部分等待很久，估计需要改变的地方很多，可见iCloud这次也是大换血。

之后就可以看到新系统清爽的界面了：

![yosemite_8]({{ BASE.PATH }}/images/yosemite/yosemite_8.jpg)

###6.第一印象
第一印象当然就是简洁。Yosemite可以说搭上了偏平化简洁风的末班车。之前虽然Mac在系统安全性，稳定性较windows 8都有一定的优势，但如果同时用两个系统的话，会明显感觉win8更清爽，画面中有效信息能使用的范围明显较大，而Mavericks比较起来就会显得比较繁杂，尽管有优秀的手势操作支持，打开很多窗口的话依然会感觉界面很混乱。这种情况在Yosemite中有了明显的改观。Dock的新图标设计保持了一贯的高水准，之前对于dock的担心也完全多余，即使安装一些老程序，依然不会显得突兀。

有了新系统，当然要在里面肆虐一番。我会从普通用户的角度来体验Yosemite，关于新系统的细节，以及beta版发现的问题，请关注后续文章，


