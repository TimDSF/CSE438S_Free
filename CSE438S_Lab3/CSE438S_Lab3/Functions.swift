//
//  Functions.swift
//  CSE438S_Lab3
//
//  Created by Tim Dong on 6/26/20.
//  Copyright © 2020 Tim Dong. All rights reserved.
//

import UIKit

class Functions {
    static func distance(_ a: CGPoint, _ b: CGPoint) -> CGFloat {
        return sqrt(pow(a.x - b.x,2) + pow(a.y - b.y,2))
    }
}
