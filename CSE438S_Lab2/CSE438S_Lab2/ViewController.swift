//
//  ViewController.swift
//  CSE438S_Lab2
//
//  Created by Tim on 6/19/20.
//  Copyright © 2020 TimDong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var imagePat: UIImageView!
    
    @IBOutlet weak var feedBut: UIButton!
    @IBOutlet weak var playBut: UIButton!
    @IBOutlet weak var shakeBut: UIButton!
    
    @IBOutlet weak var foodView: DisplayView!
    @IBOutlet weak var happinessView: DisplayView!
    @IBOutlet weak var foodNum: UILabel!
    @IBOutlet weak var happinessNum: UILabel!
    
    @IBOutlet weak var catBut: UIButton!
    @IBOutlet weak var fishBut: UIButton!
    @IBOutlet weak var bunnyBut: UIButton!
    @IBOutlet weak var birdBut: UIButton!
    @IBOutlet weak var dogBut: UIButton!
    
    var foodCat = 2, happinessCat = 20
    var foodFish = 2, happinessFish = 20
    var foodBunny = 2, happinessBunny = 20
    var foodBird = 2, happinessBird = 20
    var foodDog = 2, happinessDog = 20
    
    enum Pet{
        case cat
        case fish
        case bunny
        case bird
        case dog
    }
    
    var current:Pet = .cat
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        foodView.color = UIColor.red
        happinessView.color = UIColor.purple
        update()
        
        toCat(self)
    }
    
    func getValue() -> (Int,Int){
        var food = 0, happiness = 0
        
        switch current{
        case .cat:
            food = foodCat
            happiness = happinessCat
        case .fish:
            food = foodFish
            happiness = happinessFish
        case .bunny:
            food = foodBunny
            happiness = happinessBunny
        case .bird:
            food = foodBird
            happiness = happinessBird
        case .dog:
            food = foodDog
            happiness = happinessDog
        }
        
        return (food,happiness)
    }
    
    func setValue(_ food: Int, _ happiness: Int){
        switch current{
        case .cat:
            foodCat = food
            happinessCat = happiness
        case .fish:
            foodFish = food
            happinessFish = happiness
        case .bunny:
            foodBunny = food
            happinessBunny = happiness
        case .bird:
            foodBird = food
            happinessBird = happiness
        case .dog:
            foodDog = food
            happinessDog = happiness
        }
    }
    
    func update(){
        
        var food = 0, happiness = 0
        (food,happiness) = getValue()
        
        foodNum.text = String(food)
        happinessNum.text = String(happiness)
        foodView.animateValue(to: CGFloat(food)/10.0)
        happinessView.animateValue(to: CGFloat(happiness)/100.0)
    }

    @IBAction func feed(_ sender: Any) {
        var food = 0, happiness = 0
        (food,happiness) = getValue()
        
        food = food + 1
        if (food < 10) {
            happiness += 1
        }else{
            happiness -= 5
        }
        
        setValue(food, happiness)
        update()
    }
    
    @IBAction func play(_ sender: Any) {
        var food = 0, happiness = 0
        (food,happiness) = getValue()
        
        if food > 0{
            food -= 1
            happiness += 5
        }else{
            happiness -= 5
        }
        
        setValue(food, happiness)
        update()
    }
    
    @IBAction func shake(_ sender: Any) {
        var food = 0, happiness = 0
        (food,happiness) = getValue()
        
        if food > 10{
            food -= 2
            happiness -= 2
        }else{
            food -= 1
            happiness -= 5
        }
        
        setValue(food, happiness)
        update()
    }
    
    @IBAction func toCat(_ sender: Any) {
        current = .cat
        
        imageView.backgroundColor = UIColor.magenta
        imagePat.image = UIImage(named: "cat.png")
        
        update()
    }
    
    @IBAction func toFish(_ sender: Any) {
        current = .fish
        
        imageView.backgroundColor = UIColor.cyan
        imagePat.image = UIImage(named: "fish.png")
        
        update()
    }
    
    @IBAction func toBunny(_ sender: Any) {
        current = .bunny
        
        imageView.backgroundColor = UIColor.green
        imagePat.image = UIImage(named: "bunny.png")
        
        update()
    }
    
    @IBAction func toBird(_ sender: Any) {
        current = .bird
        
        imageView.backgroundColor = UIColor.yellow
        imagePat.image = UIImage(named: "bird.png")
        
        update()
    }
    
    @IBAction func toDog(_ sender: Any) {
        current = .dog
        
        imageView.backgroundColor = UIColor.red
        imagePat.image = UIImage(named: "dog.png")
        
        update()
    }
}

