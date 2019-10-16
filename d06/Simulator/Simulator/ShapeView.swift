//
//  ShapeView.swift
//  Simulator
//
//  Created by Samantha HILLEBRAND on 2019/10/16.
//  Copyright © 2019 Samantha Hillebrand. All rights reserved.
//

import UIKit

class ShapeView: UIView {
    //https://www.weheartswift.com/bezier-paths-gesture-recognizers/
    let size: CGFloat = 100.0
    let lineWidth: CGFloat = 3
    var fillColor: UIColor!
    
    init(origin: CGPoint){
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.center = origin
        self.backgroundColor = UIColor.clear
        self.fillColor = randomColor()
        
        initGestureRecognizers()
    }
    
    func initGestureRecognizers() {
        let panGR = UIPanGestureRecognizer(target: self, action: #selector(ShapeView.didPan))
        addGestureRecognizer(panGR)
        
        let pinchGR = UIPinchGestureRecognizer(target: self, action: #selector(ShapeView.didPinch))
        addGestureRecognizer(pinchGR)
        
        let rotationGR = UIRotationGestureRecognizer(target: self, action: #selector(ShapeView.didRotate))
        addGestureRecognizer(rotationGR)
    }
    
    @objc func didPan(panGR: UIPanGestureRecognizer) {
        
        self.superview!.bringSubviewToFront(self)
        
        var translation = panGR.translation(in: self)
        
        translation = translation.applying(self.transform)
        
        self.center.x += translation.x
        self.center.y += translation.y
        
        panGR.setTranslation(CGPoint.zero, in: self)
    }
    
    // We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let insetRect = rect.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        
        let path = UIBezierPath(roundedRect: insetRect, cornerRadius: 10)
        
        
        self.fillColor.setFill()
        path.fill()
        
        path.lineWidth = self.lineWidth
        UIColor.black.setStroke()
        path.stroke()
    }
    
    
    @objc func didPinch(pinchGR: UIPinchGestureRecognizer) {
        self.superview!.bringSubviewToFront(self)
        let scale = pinchGR.scale
        self.transform = self.transform.scaledBy(x: scale, y: scale)
        pinchGR.scale = 1.0
    }
    
    //Rotation is given in radians.
    @objc func didRotate(rotationGR: UIRotationGestureRecognizer) {
        self.superview!.bringSubviewToFront(self)
        let rotation = rotationGR.rotation
        self.transform = self.transform.rotated(by: rotation)
        rotationGR.rotation = 0.0
    }
    
    func randomColor() -> UIColor {
        let hue:CGFloat = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
        return UIColor(hue: hue, saturation: 0.8, brightness: 1.0, alpha: 0.8)
        
    }
}
