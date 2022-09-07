//
//  ViewController.swift
//  calcluator2
//
//  Created by nour on 8/30/22.
//  Copyright © 2022 nour. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var MathLabel: UILabel!
    @IBOutlet weak var ResultLabel: UILabel!
    
    var workingM:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
        // Do any additional setup after loading the view.
    }
    
    func clearAll(){
        MathLabel.text = ""
        ResultLabel.text = ""
        workingM = ""
    }
    
    
    func addToMathlabel (value:String){
        workingM = workingM + value
        MathLabel.text = workingM
    }
    
    @IBAction func EquallButton(_ sender: Any) {
        if (validInput()){
            let checkpercent = workingM.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkpercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            ResultLabel.text = resultString
        }else{
            let alert = UIAlertController(title: "invalid input", message: "what are u doing!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Sorry!", style: .default))
            self.present(alert , animated: true ,completion: nil)
            
        }
    }
    func formatResult(result: Double)-> String{
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", result)
        }else{
            return String(format: "%.2f", result)
        }
    }
    
    func validInput()-> Bool{
        var count = 0
        var funcharindex = [Int]()
        for char in workingM
        {
            if special(char: char){
                funcharindex.append(count)
                
            }
            count += 1
        }
        
        var previus:Int = -1
        
        for index in funcharindex{
            if (index == 0){
                return false
            }
            if (index == workingM.count - 1){
                return false
            }
            
            if (previus != -1) {
                
                if ( index - previus == 1){
                    return false
                }
            }
            previus = index
        }
        
        
        return true
    }
    
    func special(char:Character)->Bool {
        if(char == "*" ){
            return true
        }
        if(char == "/" ){
            return true
        }
        if(char == "+" ){
            return true
        }
        return false
    }
    
    @IBAction func AcButton(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func DelButton(_ sender: Any) {
        if (!workingM.isEmpty){
            workingM.removeLast()
            MathLabel.text = workingM
        }
        
    }
    @IBAction func Persent(_ sender: Any) {
        addToMathlabel(value: "%")
        
    }
    
    @IBAction func DvideButton(_ sender: Any) {
        addToMathlabel(value: "/")
        
    }
    
    @IBAction func Sevenbutton(_ sender: Any) {
        addToMathlabel(value: "7")
        
    }
    
    @IBAction func EightButton(_ sender: Any) {
        addToMathlabel(value: "8")
        
    }
    @IBAction func NineButton(_ sender: Any) {
        addToMathlabel(value: "9")
        
    }
    
    @IBAction func FourButton(_ sender: Any) {
        addToMathlabel(value: "4")
        
    }
    @IBAction func FiveButton(_ sender: Any) {
        addToMathlabel(value: "5")
        
    }
    
    @IBAction func SixButton(_ sender: Any) {
        addToMathlabel(value: "6")
        
    }
    @IBAction func OneButton(_ sender: Any) {
        addToMathlabel(value: "1")
        
    }
    
    @IBAction func TwoButton(_ sender: Any) {
        addToMathlabel(value: "2")
        
    }
    
    @IBAction func ThreeButton(_ sender: Any) {
        addToMathlabel(value: "3")
        
    }
    
    @IBAction func ZeroButton(_ sender: Any) {
        addToMathlabel(value: "0")
        
    }
    
    @IBAction func DotButton(_ sender: Any) {
        addToMathlabel(value: ".")
        
    }
    
    @IBAction func PlusButton(_ sender: Any) {
        addToMathlabel(value: "+")
        
    }
    
    @IBAction func MinButton(_ sender: Any) {
        addToMathlabel(value: "-")
        
    }
    
    @IBAction func MultButton(_ sender: Any) {
        addToMathlabel(value: "*")
        
    }
    
    
}

