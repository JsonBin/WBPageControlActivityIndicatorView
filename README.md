# WBPageControlActivityIndicatorView
Swift 编写的一款基于CAShapLayer的七彩颜色变化的指示器

使用方法
========
* 初始化
        // 初始化
        let aview=WBPageControlActivityIndicatorView()
        
        // 设置属性，(可不设置)
        aview.labelText="正在加载"  // 设置提示文字(默认为 拼命加载中..)
        aview.font=17  // 设置提示文字大小，默认为15
        aview.color=UIColor.brownColor()  // 设置背景颜色，默认为黑色，透明度为0.6
        
        // 显示
        aview.show()
        
*  使用结束调用

         // 加载完成之后调用，隐藏
         aview.hidde()

效果图
=======

 ![gif](https://github.com/JsonBin/WBPageControlActivityIndicatorView/raw/master/WBPageControlActivityIndicatorView/activity.gif "七彩加载图")
