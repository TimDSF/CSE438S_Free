//
//  ViewController.swift
//  CSE438S_Studio1
//
//  Created by Tim on 6/6/20.
//  Copyright © 2020 TimDong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func update(_ sender: Any) {
        image.alpha=CGFloat(slider.value)
    }
    
}

