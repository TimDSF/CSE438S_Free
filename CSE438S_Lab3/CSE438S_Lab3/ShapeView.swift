//
//  ShapeView.swift
//  CSE438S_Lab3
//
//  Created by Tim Dong on 6/26/20.
//  Copyright © 2020 Tim Dong. All rights reserved.
//

import UIKit

class ShapeView: UIView {
    var currentShape:Shape?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var shapes: [Shape] = []{
        didSet{
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawShape(_ shape: Shape){
        switch shape.type{
        case .Circle:
            let path = UIBezierPath()
            
            shape.color.setFill()
            path.addArc(withCenter: shape.center, radius: shape.radius, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
            path.fill()

            UIColor.black.setStroke()
            path.lineWidth = shape.width
            path.stroke()
        case .Square:
            let rect = CGRect(x: shape.center.x-shape.radius, y: shape.center.y-shape.radius, width: 2 * shape.radius, height: 2 * shape.radius)
            let path = UIBezierPath(rect: rect)
            
            shape.color.setFill()
            path.lineWidth = shape.width
            path.fill()
            path.stroke()
        }
    }
    
    override func draw(_ rect: CGRect){
        for shape in shapes{
            drawShape(shape)
        }
        
        if (currentShape != nil){
            drawShape(currentShape!)
        }
    }
    
}
