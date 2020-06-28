//
//  Brush.swift
//  CSE438S_Lab3
//
//  Created by Tim Dong on 6/27/20.
//  Copyright © 2020 Tim Dong. All rights reserved.
//

import UIKit

struct Curve{
    var pathDot: UIBezierPath
    var pathLine: UIBezierPath
    var color: UIColor
    var width: CGFloat
    
    init(color: UIColor, width: CGFloat){
        self.color = color
        self.width = width
        self.pathLine = UIBezierPath()
        self.pathDot = UIBezierPath()
    }
}
