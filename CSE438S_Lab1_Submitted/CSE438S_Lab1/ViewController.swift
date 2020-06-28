//
//  ViewController.swift
//  CSE438S_Lab1
//
//  Created by Tim on 6/6/20.
//  Copyright © 2020 TimDong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oriPrice: UITextField!
    @IBOutlet weak var disPercent: UITextField!
    @IBOutlet weak var taxRate: UITextField!
    @IBOutlet weak var finalPrice: UILabel!
    
    @IBOutlet weak var B1: UIButton!
    @IBOutlet weak var B2: UIButton!
    @IBOutlet weak var B3: UIButton!
    @IBOutlet weak var B4: UIButton!
    @IBOutlet weak var B5: UIButton!
    @IBOutlet weak var B6: UIButton!
    
    @IBOutlet weak var C1: UIButton!
    @IBOutlet weak var C2: UIButton!
    @IBOutlet weak var C3: UIButton!
    @IBOutlet weak var C4: UIButton!
    @IBOutlet weak var C5: UIButton!
    @IBOutlet weak var C6: UIButton!
    
    @IBOutlet weak var D1: UIButton!
    @IBOutlet weak var D2: UIButton!
    @IBOutlet weak var D3: UIButton!
    @IBOutlet weak var D4: UIButton!
    @IBOutlet weak var D5: UIButton!
    @IBOutlet weak var D6: UIButton!
    
    @IBOutlet weak var English: UIButton!
    @IBOutlet weak var Chinese: UIButton!
    
    @IBOutlet weak var iShop: UILabel!
    @IBOutlet weak var OP: UILabel!
    @IBOutlet weak var DP: UILabel!
    @IBOutlet weak var TR: UILabel!
    @IBOutlet weak var FP: UILabel!
    @IBOutlet weak var Language: UILabel!
    
    @IBAction func EnglishPressed(_ sender: Any) {
        English.setTitle("English", for: .normal)
        Chinese.setTitle("Chinese", for: .normal)
        iShop.text = "iShop"
        OP.text = "Original Price"
        DP.text = "Discount Percentage"
        TR.text = "Tax Rate"
        FP.text = "Final Price"
        Language.text = "Language"
    }
    
    @IBAction func ChinesePressed(_ sender: Any) {
        English.setTitle("英语", for: .normal)
        Chinese.setTitle("中文", for: .normal)
        iShop.text = "爱购物"
        OP.text = "原价："
        DP.text = "折扣："
        TR.text = "税率："
        FP.text = "实际价格："
        Language.text = "语言："
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func B1(_ sender: Any) {
        oriPrice.text="10"
        updatePrice()
    }
    @IBAction func B2(_ sender: Any) {
        oriPrice.text="20"
        updatePrice()
    }
    @IBAction func B3(_ sender: Any) {
        oriPrice.text="50"
        updatePrice()
    }
    @IBAction func B4(_ sender: Any) {
        oriPrice.text="100"
        updatePrice()
    }
    @IBAction func B5(_ sender: Any) {
        oriPrice.text="500"
        updatePrice()
    }
    @IBAction func B6(_ sender: Any) {
        oriPrice.text="1000"
        updatePrice()
    }
    @IBAction func C1(_ sender: Any) {
        disPercent.text="1"
        updatePrice()
    }
    @IBAction func C2(_ sender: Any) {
        disPercent.text="2"
        updatePrice()
    }
    @IBAction func C3(_ sender: Any) {
        disPercent.text="5"
        updatePrice()
    }
    @IBAction func C4(_ sender: Any) {
        disPercent.text="10"
        updatePrice()
    }
    @IBAction func C5(_ sender: Any) {
        disPercent.text="20"
        updatePrice()
    }
    @IBAction func C6(_ sender: Any) {
        disPercent.text="30"
        updatePrice()
    }
    @IBAction func D1(_ sender: Any) {
        taxRate.text="0"
        updatePrice()
    }
    @IBAction func D2(_ sender: Any) {
        taxRate.text="5"
        updatePrice()
    }
    @IBAction func D3(_ sender: Any) {
        taxRate.text="10"
        updatePrice()
    }
    @IBAction func D4(_ sender: Any) {
        taxRate.text="15"
        updatePrice()
    }
    @IBAction func D5(_ sender: Any) {
        taxRate.text="20"
        updatePrice()
    }
    @IBAction func D6(_ sender: Any) {
        taxRate.text="25"
        updatePrice()
    }
    @IBAction func oriPriceUpdate(_ sender: Any) {
        let oriP = Double(oriPrice.text!) ?? 0.0
        if  oriP < 0 {
            oriPrice.text="0"
        }else if oriP > 100000{
            oriPrice.text="100000"
        }
        updatePrice()
    }
    
    @IBAction func disPercentUpdate(_ sender: Any) {
        let disP = Double(disPercent.text!) ?? 0.0
        if  disP < 0 {
            disPercent.text="0"
        }else if disP > 100{
            disPercent.text="100"
        }
        updatePrice()
    }
    
    @IBAction func taxRateUpdate(_ sender: Any) {
        let taxR = Double(taxRate.text!) ?? 0.0
        if  taxR < 0 {
            taxRate.text="0"
        }else if taxR > 1000{
            taxRate.text="1000"
        }
        updatePrice()
    }
    
    func updatePrice(){
        let oriP = Double(oriPrice.text!) ?? 0.0
        let disP = Double(disPercent.text!) ?? 0.0
        let taxR = Double(taxRate.text!) ?? 0.0
        let finalP = oriP * (1.0 - disP / 100) * (1.0 + taxR / 100)
        finalPrice.text = "$\(String(format: "%.2f", finalP))"
    }

}

