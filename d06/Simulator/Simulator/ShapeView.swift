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
    var path: UIBezierPath!
    
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    
    
    init(origin: CGPoint, gravity: UIGravityBehavior, collision: UICollisionBehavior){
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.center = origin
        self.backgroundColor = UIColor.clear
        self.fillColor = randomColor()
        self.path = randomPath()
        self.gravity = gravity
        self.collision = collision

        
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
        gravity.addItem(self)
        collision.addItem(self)
        
    }
    
    // We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
//        let insetRect = rect.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        
//        let path = UIBezierPath(roundedRect: insetRect, cornerRadius: 10)
        
        
        self.fillColor.setFill()
        self.path.fill()
        
        self.path.lineWidth = self.lineWidth
        UIColor.black.setStroke()
        self.path.stroke()
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
    
    func randomPath() -> UIBezierPath {
        let insetRect = self.bounds.insetBy(dx: lineWidth, dy: lineWidth)
        let shapeType = arc4random() % 3
        
        if shapeType == 0 {
            return UIBezierPath(roundedRect: insetRect, cornerRadius: 10.0)
        }
        if shapeType == 1 {
            return UIBezierPath(ovalIn: insetRect)
        }
        return trianglePathInRect(rect: insetRect)
    }
    
    func trianglePathInRect(rect:CGRect) -> UIBezierPath {
        let path = UIBezierPath()

        path.move(to: CGPoint(x: rect.width / 2.0, y: rect.origin.y))
        path.addLine(to: CGPoint(x: rect.width,y: rect.height))
        path.addLine(to: CGPoint(x: rect.origin.x,y: rect.height))
        path.close()

        return path
    }
    
}
