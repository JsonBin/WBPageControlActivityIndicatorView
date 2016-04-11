//
//  WBPageControlActivityIndicatorView.swift
//  WBPageControlActivityIndicatorView
//
//  Created by Zwb on 16/4/11.
//  Copyright © 2016年 zwb. All rights reserved.
//

import UIKit

class WBPageControlActivityIndicatorView: UIView {

    internal var labelText:NSString?  // 设置加载文字
    internal var font:CGFloat?  // 设置加载文字大小
    internal var color:UIColor?  // 设置背景色
    
    private var wwindow:UIWindow?
    private let label=UILabel()
    private var timer:NSTimer?
    private var layerarray=NSMutableArray()
    private var colorarray=NSMutableArray()
    private var maskLayer:CALayer?
    
    internal func show()->Void{
        wwindow=UIApplication.sharedApplication().keyWindow
        created()
        startTimer()
        self.center=(wwindow?.center)!
        wwindow?.addSubview(self)
    }
    
    internal func hidde()->Void{
        stopLoop()
        self.removeFromSuperview()
    }
    
    private func created()->Void{
        self.backgroundColor = color==nil ? UIColor ( red: 0.0, green: 0.0, blue: 0.0, alpha: 0.6 ) : color
        self.layer.cornerRadius=5
        self.layer.masksToBounds=true
        self.frame=CGRectMake(0, 0, 0, 0)
        
        let str=NSString.init(string: labelText==nil ? "拼命加载中..." : labelText!)
        let rect=str.sizeWithSize(CGSizeMake(wiWidth()/3, 1000), andFont: (font==nil ? UIFont.systemFontOfSize(15) : UIFont.systemFontOfSize(font!)))
        if rect.width<60 {
            self.frame=CGRectMake(0, 0, wiWidth()/3, rect.height+30)
        }else{
            self.frame=CGRectMake(0, 0, rect.width+10, rect.height+30)
        }
        
        label.frame=CGRectMake(width()/2-rect.width/2, 5, rect.width, rect.height)
        label.numberOfLines=0
        label.lineBreakMode = .ByTruncatingTail
        label.textAlignment = .Center
        label.text = (labelText==nil ? "拼命加载中..." : (labelText as! String))
        label.font = font==nil ? UIFont.systemFontOfSize(15) : UIFont.systemFontOfSize(font!)
        label.textColor=UIColor.whiteColor()
        self.addSubview(label)
        
        colorarray=[UIColor.redColor(), UIColor.orangeColor(), UIColor.yellowColor(),UIColor.greenColor(), UIColor.purpleColor()]
        for i in 0..<5 {
            let x = width()/6*CGFloat(i+1)-width()/6/5
            let y = height()-20
            layerarray.addObject(createShapLayer(colorarray[i] as! UIColor, position: CGPointMake(x, y)))
        }
    }
    
    private func createShapLayer(color:UIColor, position:CGPoint)->CAShapeLayer{
        let layer = CAShapeLayer()
        let path  = UIBezierPath.init(roundedRect: CGRectMake(0, 0, 8, 8), cornerRadius: 4)
        layer.path = path.CGPath;
        layer.lineWidth = 0.1;
        layer.fillColor = color.CGColor
        layer.position = position
        self.layer.addSublayer(layer)
        return layer;
    }
    
    private func startTimer()->Void{
        timer=NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(WBPageControlActivityIndicatorView.timeLoop), userInfo: nil, repeats: true)
        NSRunLoop.currentRunLoop().addTimer(timer!, forMode: NSDefaultRunLoopMode)
    }
    
    @objc private func timeLoop()->Void{
        let lastcolor=colorarray.lastObject
        colorarray.removeLastObject()
        colorarray.insertObject(lastcolor!, atIndex: 0)
        for i in 0..<5 {
            let layer=layerarray[i] as! CAShapeLayer
            layer.fillColor=(colorarray[i] as! UIColor).CGColor
        }
    }
    
    private func stopLoop()->Void{
        timer?.invalidate()
        timer=nil
    }
    
    private func width()->CGFloat{
        return self.bounds.size.width
    }
    
    private func height()->CGFloat{
        return self.bounds.size.height
    }
    
    private func wiWidth()->CGFloat{
        return (wwindow?.frame.size.width)!
    }
}
