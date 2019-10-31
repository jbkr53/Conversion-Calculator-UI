//
//  ConversionViewController.swift
//  ConversionCalc
//
//  Created by James Kirkland on 10/31/19.
//  Copyright © 2019 James Kirkland. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet weak var outputdisplay: UITextField!    

    @IBOutlet weak var inputdisplay: UITextField!
    
   
    @IBAction func convert(_ sender: Any) {
        let alert = UIAlertController(title:"Choose Converter", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        alert.addAction(UIAlertAction(title: "Farenheight to Celsius", style: .default, handler: { (alertAction) -> Void in
            self.outputdisplay.text = "°C"
            self.inputdisplay.text = "°F"
            
        }))
        alert.addAction(UIAlertAction(title: "Celsius to Farenheight", style: .default, handler: { (alertAction) -> Void in
            self.outputdisplay.text = "°F"
            self.inputdisplay.text = "°C"
        }))
        alert.addAction(UIAlertAction(title: "Miles to Kilometers", style: .default, handler: { (alertAction) -> Void in
            self.outputdisplay.text = "mi"
            self.inputdisplay.text = "km"
            
        }))
        alert.addAction(UIAlertAction(title: "Kilometers to Miles", style: .default, handler: { (alertAction) -> Void in
            self.outputdisplay.text = "km"
            self.inputdisplay.text = "°mi"
            
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var conversions: [Convert] = [Convert(label:"Celsius to Farenheight", input_unit: "°C", output_unit: "°F"), Convert(label:"Farenheight to Celsius", input_unit: "°F", output_unit: "°C"), Convert(label:"miles to kilometers", input_unit: "mi", output_unit: "km"), Convert(label:"kilometers to miles", input_unit: "km", output_unit: "mi")]
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
