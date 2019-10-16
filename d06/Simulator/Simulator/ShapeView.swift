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
    
    var animator: UIDynamicAnimator!
    var gravity: UIGravityBehavior!
    var collision: UICollisionBehavior!
    var behaviour: UIDynamicItemBehavior!
    var originalBounds: CGRect!;
    
    
    
    init(origin: CGPoint, animator: UIDynamicAnimator, gravity: UIGravityBehavior, collision: UICollisionBehavior, behaviour: UIDynamicItemBehavior){
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: size, height: size))
        self.center = origin
        self.backgroundColor = UIColor.clear
        self.fillColor = randomColor()
        self.path = randomPath()
        self.animator = animator
        self.gravity = gravity
        self.collision = collision
        self.behaviour = behaviour
        
        self.originalBounds = CGRect(x: 0.0, y: 0.0, width: size, height: size)
        
        
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
      
        switch panGR.state {
        case .began:
            self.gravity?.removeItem(panGR.view!);
        case .changed:
            panGR.view?.center = panGR.location(in: self.superview);
            self.animator?.updateItem(usingCurrentState: panGR.view!);
        case .ended:
            self.gravity?.addItem(panGR.view!);
        default:
            break ;
        }
        
    }
    
    // We need to implement init(coder) to avoid compilation errors
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.fillColor.setFill()
        self.path.fill()
        
        self.path.lineWidth = self.lineWidth
        UIColor.black.setStroke()
        self.path.stroke()
    }
    
    
    @objc func didPinch(pinchGR: UIPinchGestureRecognizer) {
         let view = pinchGR.view as! ShapeView;
        
        switch pinchGR.state {
        case .began:
            self.gravity?.removeItem(view);
        case .changed:
            self.collision.removeItem(view);
            self.behaviour.removeItem(view);
            view.bounds.size.width = view.originalBounds.width * pinchGR.scale;
            view.bounds.size.height = view.originalBounds.height * pinchGR.scale;
            self.collision.addItem(view);
            self.behaviour.addItem(view);
            self.animator?.updateItem(usingCurrentState: view);
        case .ended:
            view.originalBounds = view.bounds;
            self.gravity?.addItem(view);
        default:
            break ;
        }
    }
    
    //Rotation is given in radians.
    @objc func didRotate(rotationGR: UIRotationGestureRecognizer) {
     //https://stackoverflow.com/questions/46919158/moving-an-object-uiview-in-swift-with-gravity-collision-elasticity-already-set
       
        switch rotationGR.state {
        case .began:
            self.gravity.removeItem(rotationGR.view!);
        case .changed:
            self.collision.removeItem(rotationGR.view!);
            self.behaviour.removeItem(rotationGR.view!);
            rotationGR.view!.transform = rotationGR.view!.transform.rotated(by: rotationGR.rotation);
            rotationGR.rotation = 0;
            self.collision.addItem(rotationGR.view!);
            self.behaviour.addItem(rotationGR.view!);
            self.animator?.updateItem(usingCurrentState: rotationGR.view!);
        case .ended:
            self.gravity?.addItem(rotationGR.view!);
        default:
            break ;
        }
        
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
