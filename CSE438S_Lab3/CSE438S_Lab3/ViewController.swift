//
//  ViewController.swift
//  CSE438S_Lab3
//
//  Created by Tim Dong on 6/26/20.
//  Copyright © 2020 Tim Dong. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    var shapeCanvas: ShapeView!
    var lineCanvas: LineView!
    var curveCanvas: CurveView!
    
    @IBOutlet var canvasView: UIView!
    @IBOutlet weak var colorBoard: UIToolbar!
    
    var history: [Canvas] = []
    
    enum Canvas{
        case shape
        case line
        case curve
    }
    
    var tmp: String = "tmp"
    
    var weight: CGFloat = 20
    var color: UIColor = UIColor.darkGray
    
    @IBOutlet weak var brushBut: UIBarButtonItem!
    @IBOutlet weak var shapeBut: UIBarButtonItem!
    @IBOutlet weak var weightSlider: UISlider!
    
    @IBAction func blackSelected(_ sender: Any) {
        color = UIColor.black
    }
    @IBAction func redSelected(_ sender: Any) {
        color = UIColor.systemRed
    }
    @IBAction func orangeSelected(_ sender: Any) {
        color = UIColor.systemOrange
    }
    @IBAction func yellowSelected(_ sender: Any) {
        color = UIColor.systemYellow
    }
    @IBAction func greenSelected(_ sender: Any) {
        color = UIColor.systemGreen
    }
    @IBAction func blueSelected(_ sender: Any) {
        color = UIColor.systemBlue
    }
    @IBAction func indigoSelected(_ sender: Any) {
        color = UIColor.systemIndigo
    }
    @IBAction func purpleSelected(_ sender: Any) {
        color = UIColor.systemPurple
    }
    @IBAction func lightGreySelected(_ sender: Any) {
        color = UIColor.lightGray
    }
    @IBAction func darkGreySelected(_ sender: Any) {
        color = UIColor.darkGray
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapeBut.isEnabled = false
        
        shapeCanvas = ShapeView(frame: view.frame)
        view.addSubview(shapeCanvas)
        
        lineCanvas = LineView(frame: view.frame)
        view.addSubview(lineCanvas)
        
        curveCanvas = CurveView(frame: view.frame)
        view.addSubview(curveCanvas)
        

        weightSlider.addTarget(self, action: #selector(weightChangeEnded), for: [.touchUpInside, .touchUpOutside])

        self.view.bringSubviewToFront(colorBoard)
        self.view.sendSubviewToBack(shapeCanvas)
        self.view.sendSubviewToBack(lineCanvas)
        self.view.sendSubviewToBack(curveCanvas)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let brush = brushBut.title!
        let shape = shapeBut.title!
        

        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        
        switch brush{
        case "Shape":
            switch shape{
            case "Circle":
                shapeCanvas.currentShape = Shape(center: touchPoint, radius: 0, color: color, width: CGFloat(Int(weight/10)), type: .Circle)
            case "Square":
                shapeCanvas.currentShape = Shape(center: touchPoint, radius: 0, color: color, width: CGFloat(Int(weight/10)), type: .Square)
            default:
                break
            }
        case "Line":
            lineCanvas.currentLine = Line(start: touchPoint, end: touchPoint, width: weight, color: color)
        case "Brush":
            curveCanvas.currentCurve = Curve(color: color, width: weight)
            curveCanvas.currentCurve?.pathLine.move(to: touchPoint)
            
            curveCanvas.currentCurve?.pathDot.move(to: touchPoint)
            curveCanvas.currentCurve?.pathDot.addArc(withCenter: touchPoint, radius: weight / 2, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
            curveCanvas.setNeedsDisplay()
        default:
            break
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let brush = brushBut.title!
        let shape = shapeBut.title!

        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        
        switch brush{
        case "Shape":
            switch shape{
            case "Circle":
                let radius = Functions.distance(touchPoint, (shapeCanvas.currentShape?.center)!)
                shapeCanvas.currentShape?.radius = radius
            case "Square":
                let radius = max(abs(touchPoint.x - (shapeCanvas.currentShape != nil ? shapeCanvas.currentShape!.center.x : touchPoint.x)),abs(touchPoint.y - (shapeCanvas.currentShape != nil ? shapeCanvas.currentShape!.center.y : touchPoint.y))) as CGFloat
                shapeCanvas.currentShape?.radius = radius
            default:
                break
            }
        case "Line":
            lineCanvas.currentLine?.end = touchPoint
        case "Brush":
            curveCanvas.currentCurve?.pathLine.addLine(to: touchPoint)
            curveCanvas.currentCurve?.pathLine.move(to: touchPoint)
            
            curveCanvas.currentCurve?.pathDot.move(to: touchPoint)
            curveCanvas.currentCurve?.pathDot.addArc(withCenter: touchPoint, radius: weight / 2, startAngle: 0, endAngle: CGFloat(Float.pi * 2), clockwise: true)
            curveCanvas.setNeedsDisplay()
        default:
            break
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let brush = brushBut.title!
        let shape = shapeBut.title!
        
        switch brush{
        case "Shape":
            history.append(.shape)
            switch shape{
            case "Circle":
                if shapeCanvas.currentShape != nil{
                    shapeCanvas.shapes.append(shapeCanvas.currentShape!)
                    shapeCanvas.currentShape = nil
                }
            case "Square":
                if shapeCanvas.currentShape != nil{
                    shapeCanvas.shapes.append(shapeCanvas.currentShape!)
                    shapeCanvas.currentShape = nil
                }
            default:
                break
            }
        case "Line":
            history.append(.line)
            if lineCanvas.currentLine != nil{
                lineCanvas.lines.append(lineCanvas.currentLine!)
                lineCanvas.currentLine = nil
            }
        case "Brush":
            history.append(.curve)
            if curveCanvas.currentCurve != nil{
                curveCanvas.curves.append(curveCanvas.currentCurve!)
                curveCanvas.currentCurve = nil
            }
        default:
            break
        }
    }

    @IBAction func weightChanged(_ sender: Any) { // 1 - 20 - 100
        if tmp == "tmp"{
            tmp = shapeBut.title!
        }
        
        if weightSlider.value <= 0.5{
            weight = CGFloat(weightSlider.value) * 38 + 1
        }else{
            weight = CGFloat(weightSlider.value) * 160 - 60
        }
        
        shapeBut.title = String(Int(weight / (brushBut.title == "Shape" ? 10 : 1))) + " px"
    }
    
    @objc func weightChangeEnded(){
        shapeBut.title = tmp
        tmp = "tmp"
    }
    
    @IBAction func clear(_ sender: Any) {
        shapeCanvas.currentShape = nil
        shapeCanvas.shapes = []
        
        lineCanvas.currentLine = nil
        lineCanvas.lines = []
        
        curveCanvas.currentCurve = nil
        curveCanvas.curves = []
    }
    
    @IBAction func undo(_ sender: Any) {
        if history.count != 0{
            switch history[history.count - 1]{
            case .curve:
                curveCanvas.curves.removeLast()
            case .line:
                lineCanvas.lines.removeLast()
            case .shape:
                shapeCanvas.shapes.removeLast()
            }
            history.removeLast()
        }
    }
    
    @IBAction func brushSwitch(_ sender: Any) {
        let title = brushBut.title!
        switch title {
        case "Shape":
            brushBut.title = "Line"
            shapeBut.isEnabled = false
            weightSlider.isEnabled = true
        case "Line":
            brushBut.title = "Brush"
            shapeBut.isEnabled = false
            weightSlider.isEnabled = true
        case "Brush":
            brushBut.title = "Shape"
            shapeBut.isEnabled = true
            weightSlider.isEnabled = true
        default:
            break
        }
    }
    
    @IBAction func shapeSwitch(_ sender: Any) {
        let title = shapeBut.title!
        switch title {
        case "Circle":
            shapeBut.title = "Square"
        case "Square":
            shapeBut.title = "Circle"
        default:
            break
        }
    }
}
