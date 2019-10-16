//
//  ViewController.swift
//  Simulator
//
//  Created by Samantha HILLEBRAND on 2019/10/16.
//  Copyright © 2019 Samantha Hillebrand. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var animator: UIDynamicAnimator!
    var gravity = UIGravityBehavior()
    var collision = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
        self.view.addGestureRecognizer(tapGR)
        
        animator = UIDynamicAnimator(referenceView: self.view)
        collision.translatesReferenceBoundsIntoBoundary = true
        gravity.gravityDirection = CGVector(dx: 0.0, dy: 1.0)
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
    }
    
    @objc func didTap(tapGR: UITapGestureRecognizer) {
        print("Tap test")
        let tapPoint = tapGR.location(in: self.view)
        
        let shapeView = ShapeView(origin: tapPoint, gravity: gravity, collision: collision)
        
        
        self.view.addSubview(shapeView)
        gravity.addItem(shapeView)
        collision.addItem(shapeView)
    }
    
    
}

