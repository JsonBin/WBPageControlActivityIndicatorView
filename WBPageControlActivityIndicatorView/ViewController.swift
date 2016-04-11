//
//  ViewController.swift
//  WBPageControlActivityIndicatorView
//
//  Created by Zwb on 16/4/11.
//  Copyright © 2016年 zwb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title="WBPageControlActivityIndicatorView"
        
        // 初始化
        let aview=WBPageControlActivityIndicatorView()
        
        // 设置属性，(可不设置)
        aview.labelText="正在加载"  // 设置提示文字(默认为 拼命加载中..)
        aview.font=17  // 设置提示文字大小，默认为15
        aview.color=UIColor.brownColor()  // 设置背景颜色，默认为黑色，透明度为0.6
        
        // 显示
        aview.show()
        
        
        // 隐藏
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue()) {
            UIView.animateWithDuration(0.5, animations: {
                // 加载完成之后调用，隐藏
//                aview.hidde()
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

