---
layout: post
title: "如何使用Jekyll及Github搭建自己的个人博客"
description: ""
postphoto: "blog"
category: lessons
tags: [Tutorial, Jekyll, Github, Blog]
group: posts
---
{% include JB/setup %}

这是一个搭建个人博客的教程。虽然提供个人博客的网站多如牛毛，但是作为技术党，拥有一个自己完全掌控的个人博客，完全告别不喜欢的广告，既能方便的的发布文章，又能随心所欲的装扮自己的网站，何乐而不为。这就是为什么使用Jekyll和Github的原因。
##为什么写这篇文章
有心的朋友一定会像我开始之初，查找大量网上的资料。但是网上的资料水平良莠不齐，而且日期不统一，有些当初适用的方法已经过时。本人经过各种尝试，走了不少弯路，因此希望通过这篇文章，整合所有方法的原发布地址，以及各种教程，以提供更全面的搭建博客的方案。
##想要开设新网站，我们需要：
服务器：网站的内容都要放到服务器上，这样你的网站别人随时都能看到。当然也可以用自己的电脑搭建服务器，但是这个方法对一般用户并不适用，在此不做赘述。服务器需要一些有实力的公司为你提供空间，根据速度和稳定性不同服务器提供商会收费，不过这里我们的服务器就是github pages，github提供的免费网站服务，当然同时我们还能享受git版本发布平台提供的各种便利。

域名：就是网站的网址。这个网址需要从域名申请网站处获得。收费的比较有名的是Godaddy，免费的“.tp”。这类网站可以在google很容易搜索到，申请域名的教程网络上也有很多，过程并不复杂，想要拥有属于自己的漂亮的网址，没有耐心可不行。这里以Godaddy为例。

编程：做网站少不了编写代码，但是只是个人博客，对代码的要求并不高，而且我们可以修改网上的开源模版，如：Jekyll Bootstrap。需要的基本语言是HTML和CSS，当然我们也可以用javascript为网站添加更多功能。

Jekyll: 这是一个开源的博客发布平台，通过这个平台，我们不仅可以快捷的发布自己的博客，而且通过使用liquid模版语言方便的编写模版代码。具体在介绍步骤的时候会一一说明。
##步骤
###1.Github pages
这是我们的所要用到的服务器，它是完全免费的，可以放心使用。看向这个地址（<https://pages.github.com>）。请务必优先参考这里的步骤。在github上注册一个新的repository，注意务必将这个repository命名为username.github.io,"username"为你注册github的用户名。注册好之后服务器就完成啦。其实这个repository的名称就可以直接拿来当域名使用，但是显然我们需要更个性化的域名。之后我们只需要上传文件到这个服务器，我们使用git发布我们的页面。对git熟悉的人自然不用多说，不熟悉的建议就用github的windows桌面应用（<https://windows.github.com>）。建议还是熟悉一下git再回来看这个教程。关于git（<http://zh.wikipedia.org/wiki/Git>）。教程在这里（<http://git-scm.com/doc>）。
###2.域名申请
这里使用Godaddy网站作为例子，其他域名申请网站都大同小异。这里需要明确，用户与域名的租赁关系并不依赖域名网站，因此你完全可以把域名挂靠在其他网站管理。好了，直接进入Godaddy的主页（<https://www.godaddy.com>），如图：

![godaddy_png]({{ BASE.PATH }}/images/jekyll/jekyll_1.png)

不用管上图以外的其他部分，那些是godaddy的“广告”。这里我们只需要域名。像在电商买东西一样，先注册一个账号，然后直接在搜索栏输入想要的域名，所有可用的域名会被列出。选中想要的域名加入购物车，然后选择租赁时长，付款，总之跟着网站的提示一步一步来就好。拿到域名之后，最重要的一步就是把域名和我们的Github连接起来。
###3.域名连接
首先戳这个（<https://help.github.com/articles/setting-up-a-custom-domain-with-github-pages>）。这里有一个选择，如果你想要你的域名为主域名的格式（example.com），看这里（<https://help.github.com/articles/tips-for-configuring-an-a-record-with-your-dns-provider>）。如果想要使用次级域名（www.example.com），看这里（<https://help.github.com/articles/tips-for-configuring-a-cname-record-with-your-dns-provider>）。简单来说，不管我们上传什么文件到服务器，我们必须在根目录放置一个CNAME文本文件，里面只要注明我们想用的域名即可。下图是我的CNAME，怎么样，够简单吧。

![godaddy]({{ BASE.PATH }}/images/jekyll/jekyll_2.png)

之后我们需要设定域名的解析，也就是DNS了。这个步骤我们需要在Godaddy的网站完成。再次打开[Godaddy](http://www.godaddy.com)，右上登录。然后在如下位置选择`launch`：

![godaddy]({{ BASE.PATH }}/images/jekyll/jekyll_3.png)

然后猛戳自己的域名：

![godaddy]({{ BASE.PATH }}/images/jekyll/jekyll_4.png)

在之后的页面中选择`DNS Zone File`选项卡，然后在`A(Host)`下修改指向：

![godaddy]({{ BASE.PATH }}/images/jekyll/jekyll_5.png)

具体的IP可以就用这个，当然，以github提供的为主，最新的IP请在上方主域名设置方法的链接寻找。这里我要使用www的次级域名，所以不要忘了在CName (Alias)下修改www的指向：

![godaddy]({{ BASE.PATH }}/images/jekyll/jekyll_6.png)

最后不要忘记保存。大功告成！当然一般也不会立即生效，等几个小时再试试吧。连接成功后即使服务器上什么也没有也会有明显的区别，不会连接到Godaddy的广告了（这网站广告真多（╯‵□′）╯︵┴─┴ ）。

到此为止我们已经在互联网拥有自己的天地了，然而，为了舒服的写博客，编网站，我们还需要Jekyll的帮忙。

###4.Jekyll
关于Jekyll，网络上的教程几乎是最全的。先看这里：（<https://help.github.com/articles/using-jekyll-with-pages>）。由于Github pages内置了jekyll解析，所以我们可以直接发布编写好的的模版代码，免去了发布上传的麻烦，同时jekyll还方便我们在本地提前预览网站的效果。Jekyll官网拥有最全的安装和使用文档（<http://jekyllrb.com/docs/home/>），老老实实的看完吧。

关于本地安装jekyll，我想多说两句。由于它是基于linux开发的，所以要在windows下使用会非常麻烦。如果想强行在windows下使用，请看这里：<http://www.madhur.co.in/blog/2013/07/20/buildportablejekyll.html>。感谢这位作者提供了所有jekyll所需的软件包。如果为了在win的CMD下使用，我们还需要设置环境变量：

	SET PATH=%PATH%;C:\ruby\bin;C:\devkit\bin;C:\git\bin;C:\Python\App;C:\devkit\mingw\bin
	
把这里的c盘改成软件包解压后所在的目录即可。

当然，在linux下或者mac下使用终端还是最方便的办法，但是考虑到linux系统日常使用会带来诸多不便，因此有条件的技术党还是用mac吧，在撰写博客的时候有更多简洁清爽的软件可供选择。

关于liquid，其实就是jekyll所使用的模版语言。它可以与html无缝对接，对于自动生成文章分类索引等非常有帮助。jekyll对于liquid的简单介绍看这里：<http://jekyllrb.com/docs/templates/>。liquid的详细教程在这里：<http://docs.shopify.com/themes/liquid-documentation/basics>。当然多读读别人的代码还是最方便的方法，这里提供可供免费下载的jekyll主题：<http://jekyllthemes.org>。赶紧下载下来上传到自己的github上面看看效果吧！虽然Jekyll给我们提供了很方便的编写网站和发布的方式，但是一点点建立自己的网站还是太费心费力，我们可以直接在这些主题上进行修改，更快的制作出自己的网站。

###5.Jekyll Bootstrap
觉得还是太麻烦？用这个吧！网站：<http://jekyllbootstrap.com/usage/jekyll-quick-start.html>。这里有详细的使用方法。这也是最快的能让你能够看到网站效果，甚至直接开始使用博客的方法。自带的主题在这里：<http://themes.jekyllbootstrap.com>。可以随时切换，虽然网站有提供主题的Api，但是网络上现成的基于这个平台的主题寥寥无几。使用Jekyll Bootstrap可以使发布文章，建立网页一蹴而就。它实质上是基于rake脚本的一个程序，让你通过一句代码就能对jekyll的多个地方同时操作。当然它也是可以自定义的！我们一样可以从底层修改网页（废话），同时我们也可以对rake脚本进行修改，加入我们想要的功能。网站根目录下有一个`Rakefile`，使用文本编辑器打开，代码也是非常简单明了，非常便于修改。

##总结
什么？这就完了？是的，如果真的认真浏览了以上的链接，我想现在你一定已经有了自己的想法了。建立个人网站本身并没有捷径，当然如果觉得麻烦，可以选择[Wix](http://www.wix.com)这一类个人网站业务提供商。但是如果真的感兴趣，并认真去研究，我想你一定会发现一个不同的世界。我在这里主要是抛砖引玉，省去搜索资料的时间，提供的链接也尽量保持最新的原版资料，为大家检索使用。最后，对读到这里的人表示由衷感谢！