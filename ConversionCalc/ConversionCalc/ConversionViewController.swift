//
//  ConversionViewController.swift
//  ConversionCalc
//
//  Created by James Kirkland on 10/31/19.
//  Copyright © 2019 James Kirkland. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UIActionSheetDelegate {
    
    var currentConversion = Convert(label: "farenheight to celsius", input_unit: "°F", output_unit: "°C")
    var numberOnScreen: Double = 0.0
    var converting = false
    var conversionOption: Int = 1
    
    //connects output display
    @IBOutlet weak var outputdisplay: UITextField!    
    //connects input display
    @IBOutlet weak var inputdisplay: UITextField!
    
    //converts kilometers to miles returns double
func kToM(_ kilometer:Double) -> Double{
    
        return (kilometer / 1.60934)
    
    }
        
        
    
    // converts miles to kilometers returns double
func mToK(_ mile: Double) -> Double{
        return (mile * 1.60934)
    }
    
    // converts farenheight to celsius, returns double
func cToF(_ celsius: Double) -> Double{
       return (celsius * 9/5 + 32)
    }
    
    //converts celsius to farenheight
func fToC(_ farenheight: Double) -> Double{
        return (farenheight - 32) * 5/9
    }
    
func update() {
        if let text = inputdisplay.text{
            let inputNum = Double(text)
            var outputNum : Double
            
            switch conversionOption{
            case 1: outputNum = (fToC(inputNum ?? 0));
                case 2: outputNum = (cToF(inputNum ?? 0)) ;
                case 3: outputNum = (mToK(inputNum ?? 0)) ;
            case 4: outputNum = (kToM((inputNum ?? 0))) ;
                
            default : return
            }
            
            outputdisplay.text = String(outputNum) + " " + currentConversion.output_unit
            inputdisplay.placeholder = currentConversion.input_unit
        }
    }
    
    
    
   
    @IBAction func convert(_ sender: AnyObject) {
        let alert = UIAlertController(title:"Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Farenheight to Celsius", style: .default, handler: { (alertAction) -> Void in
            self.currentConversion.output_unit = "°C"
            self.currentConversion.input_unit = "°F"
            self.currentConversion.label = "farenheight to celsius"
            self.update()
           
            
            
            
        }))
        alert.addAction(UIAlertAction(title: "Celsius to Farenheight", style: .default, handler: { (alertAction) -> Void in
            self.currentConversion.output_unit = "°F"
            self.currentConversion.input_unit = "°C"
            self.inputdisplay.placeholder = "°C"
            self.outputdisplay.placeholder = "°F"
            self.conversionOption = 2
            self.update()
            
            
        }))
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: .default, handler: { (alertAction) -> Void in
            self.currentConversion.output_unit = "km"
            self.currentConversion.input_unit = "mi"
            self.inputdisplay.placeholder = "mi"
            self.outputdisplay.placeholder = "km"
            self.conversionOption = 3
            self.update()
            
        }))
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: .default, handler: { (alertAction) -> Void in
            self.currentConversion.output_unit = "mi"
            self.currentConversion.input_unit = "km"
            self.inputdisplay.placeholder = "km"
            self.outputdisplay.placeholder = "mi"
            self.conversionOption = 4
            self.update()
            
        }))
        self.present(alert, animated: true, completion: nil)
       
        
    }
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        inputdisplay.text?.append(sender.currentTitle!)
        self.update()
        
        
        
        
    }
    
    
    @IBAction func buttons(_ sender: UIButton) {
        
        switch sender.tag{
            //clear button clears both displays
        case 12: outputdisplay.text = "" ; inputdisplay.text = ""
            //conversion button set to  option 1
        
        
        
        
            
        default: outputdisplay.text = "Error"
        }
    }
    
    let conversions: [Convert] = [Convert(label:"Celsius to Farenheight", input_unit: "°C", output_unit: "°F"), Convert(label:"Farenheight to Celsius", input_unit: "°F", output_unit: "°C"), Convert(label:"miles to kilometers", input_unit: "mi", output_unit: "km"), Convert(label:"kilometers to miles", input_unit: "km", output_unit: "mi")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        self.outputdisplay.placeholder = conversions[1].output_unit
        self.inputdisplay.placeholder = conversions[1].input_unit
        numberOnScreen = 0
        self.conversionOption = 1
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
