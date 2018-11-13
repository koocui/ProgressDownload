//
//  XCProgressView.swift
//  ProgressDownload
//
//  Created by 小崔 on 2018/11/13.
//  Copyright © 2018年 小崔. All rights reserved.
//

import UIKit
func degreesToRadians(x:CGFloat) -> CGFloat{
    return CGFloat(double_t.pi) * (x) / 180.0
}
let ProgressDownload = 10


class XCProgressView: UIView {

    var signProgress:CGFloat = 0
    var _trackLayer:CAShapeLayer?
    var _progressLayer:CAShapeLayer?
    var lable:UILabel?
    var progress:CGFloat = 0
    var timer:Timer?
    
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        //创建一个track shape layer
        _trackLayer = CAShapeLayer()
        _trackLayer?.frame = self.bounds
        _trackLayer?.fillColor = UIColor.clear.cgColor
        _trackLayer?.strokeColor = UIColor.darkGray.cgColor
        self.layer.addSublayer(_trackLayer!)
        
        // 指定path的渲染颜色
        _trackLayer?.opacity = 1 //背景透明度
        _trackLayer?.lineCap = kCALineCapRound //指定线的边缘是园的
        _trackLayer?.lineWidth = CGFloat(ProgressDownload) //线的宽度
        
        /*
         center：圆心的坐标
         radius：半径
         startAngle：起始的弧度
         endAngle：圆弧结束的弧度
         clockwise：true为顺时针，false为逆时针
         方法里面主要是理解startAngle与endAngle
         */
        let path = UIBezierPath.init(arcCenter: CGPoint(x:self.frame.size.width/2,y:(self.frame.height/2)), radius: self.frame.width/2, startAngle: degreesToRadians(x: -90), endAngle: degreesToRadians(x: 270), clockwise: true)
        _trackLayer?.path = path.cgPath// 把path传递給layer，然后layer会处理相应的渲染，整个逻辑和CoreGraph是一致的。
        _progressLayer = CAShapeLayer()
        _progressLayer?.frame = self.bounds
        _progressLayer?.fillColor = UIColor.clear.cgColor
        _progressLayer?.strokeColor = UIColor.red.cgColor
        _progressLayer?.lineCap = kCALineCapRound
        _progressLayer?.lineWidth = CGFloat(ProgressDownload)
        _progressLayer?.path = path.cgPath
        _progressLayer?.opacity = 1
        _progressLayer?.strokeEnd = 0
        self.layer.addSublayer(_progressLayer!)
    }
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.setUpSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpSubViews(){
        let label = UILabel(frame: CGRect(x: 0, y: (self.frame.height-20)/2, width: self.frame.width, height: 20))
        label.textColor = UIColor.black
        label.textAlignment = .center
        self.lable = label
        self.addSubview(label)
    }

    func CircularProgressViewStart(){
        if self.timer == nil {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                self.timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true, block: { (ab) in
                    self.ChangeCircleValue(timer:self.timer!)
                })
                RunLoop.main.add(self.timer!, forMode: .commonModes)
            })
        }
    
    }
    func ChangeCircleValue(timer:Timer) -> (){
        if self.progress >= self.signProgress {
            self.timer?.invalidate()
            self.timer = nil
            return
        }
        self.progress += 0.01
        self.lable?.text = "\(CGFloat(self.progress * 100))%"
        _progressLayer?.strokeEnd = self.progress
        
    }
    
}













