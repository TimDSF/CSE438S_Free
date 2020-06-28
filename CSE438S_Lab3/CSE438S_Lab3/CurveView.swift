//
//  BrushView.swift
//  CSE438S_Lab3
//
//  Created by Tim Dong on 6/27/20.
//  Copyright © 2020 Tim Dong. All rights reserved.
//

import UIKit

class CurveView: UIView {
    var currentCurve:Curve?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var curves: [Curve] = []{
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
    
    func drawCurve(_ curve: Curve){
        curve.color.setFill()
        curve.pathDot.lineWidth = 0
        curve.pathDot.fill()
        
        curve.color.setStroke()
        curve.pathLine.lineWidth = curve.width
        curve.pathLine.stroke()
    }
    
    override func draw(_ rect: CGRect){
        for curve in curves{
            drawCurve(curve)
        }
        
        if (currentCurve != nil){
            drawCurve(currentCurve!)
        }
    }
    
}

