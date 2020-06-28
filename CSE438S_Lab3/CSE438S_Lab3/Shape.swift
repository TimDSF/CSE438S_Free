//
//  Circle.swift
//  CSE438S_Lab3
//
//  Created by Tim Dong on 6/26/20.
//  Copyright © 2020 Tim Dong. All rights reserved.
//

import UIKit

struct Shape {
    var center: CGPoint
    var radius: CGFloat
    var color: UIColor
    var width: CGFloat
    var type: ShapeType
    
    enum ShapeType{
        case Circle
        case Square
    }
}
