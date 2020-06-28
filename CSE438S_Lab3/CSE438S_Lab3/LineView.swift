//
//  LineView.swift
//  CSE438S_Lab3
//
//  Created by Tim Dong on 6/27/20.
//  Copyright © 2020 Tim Dong. All rights reserved.
//

import UIKit

class LineView: UIView {
    var currentLine:Line?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var lines: [Line] = []{
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
    
    func drawLine(_ line: Line){
        let path = UIBezierPath()
        
        line.color.setStroke()
        
        path.lineWidth = line.width
        path.move(to: line.start)
        path.addLine(to: line.end)
        path.stroke()
        
        
        line.color.setFill()
        path.addArc(withCenter: line.start, radius: line.width / 2, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
        path.addArc(withCenter: line.end, radius: line.width / 2, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
        path.fill()
    }
    
    override func draw(_ rect: CGRect){
        for line in lines{
            drawLine(line)
        }
        
        if (currentLine != nil){
            drawLine(currentLine!)
        }
    }
    
}

