//
//  ViewController.swift
//  CATransfrom
//
//  Created by LinTianBao on 16/5/31.
//  Copyright © 2016年 LinTianBao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //格子行数和列数
    var dimension:Int = 4
    //格子间隔
    var padding:CGFloat = 20
    //格子大小
    var width:CGFloat = (UIScreen.main.bounds.size.width - 100)/4
    //保存格子
    var myViews = Array<UIView>()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.createView()
        self.playAnimation()
        
//        
//        let myView = UIView(frame:CGRectMake(100,200,200,200))
//        myView.backgroundColor = UIColor.redColor()
//        self.view.addSubview(myView)
//        
//        UIView.animateWithDuration(1, animations: {() -> Void in
//        
//            //let angel:CGFloat = 360
//            //创建一个3D动画
//            var transfrom = CATransform3DIdentity
//            transfrom.m34 = -1.0/500.0
//            //transfrom = CATransform3DRotate(transfrom, angel, 1, 0, 0)
//            //设置平移量
//            transfrom = CATransform3DTranslate(transfrom, 100, 100, 0)
//            myView.layer.transform = transfrom
        
        //})
        
        
        
        
        
    
    }
    
    //创建格子
    func createView(){
        
        var x:CGFloat = 20
        var y:CGFloat = 50
    
        for _ in 0..<dimension{
        
            for _ in 0..<dimension{
            
                let myView = UIView(frame:CGRect(x: x,y: y,width: width,height: width))
                myView.backgroundColor = UIColor.darkGray
                self.view.addSubview(myView)
                
                myViews.append(myView)
                
                x += padding + width
            }
            x = 20
            y += padding + width
        }
    }
    
    //添加动画
    func playAnimation(){
    
        for myView in myViews{
        
            //将视图缩小为原来的1/10
            myView.layer.setAffineTransform(CGAffineTransform(scaleX: 0.1, y: 0.1))
            //myView.alpha = 0
            
            UIView.animate(withDuration: 1, delay: 0.01, options: UIViewAnimationOptions(), animations: {() -> Void in
                
                    //将视图旋转90度
                    myView.layer.setAffineTransform(CGAffineTransform(rotationAngle: 90))
                
                }, completion: {(finish:Bool) -> Void in
                    
                    UIView.animate(withDuration: 1, animations: {() -> Void in
                        //动画结束后，数据块复原
                        myView.layer.setAffineTransform(CGAffineTransform.identity)
                        //myView.alpha = 1.0
                    })
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

