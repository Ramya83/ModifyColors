//
//  ViewController.swift
//  ModifyColors - An application in which a view color box will change color as per the values entered by user.
//  The same is performed by corresponding sliders. And some features of invalid inputs in the textbox are checked.
//
//  Created by ramya radhakrishnan on 10/3/15.
//  Copyright © 2015 ramya radhakrishnan. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {
    
    //Declaration of IBOutlet Variables

    @IBOutlet var redLabel: UILabel!
    
    @IBOutlet var greenLabel: UILabel!
    
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redText: UITextField!
    
    @IBOutlet var greenText: UITextField!
    
    @IBOutlet var blueText: UITextField!
    
    @IBOutlet var redSlider: UISlider!
    
    @IBOutlet var greenSlider: UISlider!
    
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var showColor: UIView!
    
    /* Initial values(for the first time when it opens) for textboxes */
    
    var red = 0;
    var green = 0;
    var blue = 0;
    
    /* Initial value for sliders correspondingly */
    
    var redSValue = 0;
    var greenSValue = 0;
    var blueSValue = 0 ;

    /* Loadind the application with this view */

    override func viewDidLoad() {
        super.viewDidLoad()
        
        redText.delegate = self
        greenText.delegate = self
        blueText.delegate = self

        let userDefault = NSUserDefaults.standardUserDefaults()
        
        /* Retrieving stored data from defaults using NSUserDefault class */
        
        if let redd = userDefault.objectForKey("redKey") as? String {
            self.redText.text = String (redd)
          
        } else {
            
            self.redText.text = String (red)
        }
        
        if let greenn = userDefault.objectForKey("greenKey")  as? String {
            self.greenText.text = String(greenn)
           
        } else {
            
            self.greenText.text = String (green)
        }
        
        if let bluee = userDefault.objectForKey("blueKey") as? String {
            self.blueText.text = String(bluee)
        }else {
            self.blueText.text = String (blue)
        }
        
        
        red = Int(redText.text!)!
        green = Int(greenText.text!)!
        blue = Int(blueText.text!)!
        let redValue = CGFloat(red)
        let greenValue = CGFloat(green)
        let blueValue = CGFloat(blue)
        
        redSlider.value = Float(redText.text!)!
        greenSlider.value = Float(greenText.text!)!
        blueSlider.value = Float(blueText.text!)!
        

        
        showColor.backgroundColor = UIColor(red:redValue/255 ,green:greenValue/255, blue:blueValue/255, alpha:1.0);
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "applicationDidEnterBackground:",
            name: UIApplicationDidEnterBackgroundNotification, object: nil)
        
    }
    
    /* If the application goes background,the current values are saved and retreived later when it comes back or loaded again with the same values */
    
    func applicationDidEnterBackground(notification: NSNotification) {
        
        let userDefault = NSUserDefaults.standardUserDefaults()
        
        userDefault.setObject(self.redText.text,forKey: "redKey")
        userDefault.setObject(self.greenText.text,forKey: "greenKey")
        userDefault.setObject(self.blueText.text,forKey: "blueKey")
        
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /* Function on textbox Red.It limits the user to enter values,if out of range ,a pop up warning user to enter valid range value in the text box */
    
   
    @IBAction func textBoxRed(sender: UITextField) {
        var textField:UITextField = redText;
        
        func handleTextR(alert:UIAlertAction!){
            
            if ((redText.text < "0") || ((redText.text)!.characters.count > 3)){
                redText.text = "0"
            } else if ((redText.text > "100") || ((redText.text)!.characters.count > 3)){
                redText.text = "100"
            } else {
               self.redText.text = redText.text
            }

            red = Int(redText.text!)!
            green = Int(greenText.text!)!
            blue = Int(blueText.text!)!
            let redValue = CGFloat(red)
            let greenValue = CGFloat(green)
            let blueValue = CGFloat(blue)
            
            showColor.backgroundColor = UIColor(red:redValue/255 ,green:greenValue/255, blue:blueValue/255, alpha:1.0);
            
        }
            var initialValueR = ""
            if (textField.text != nil)
            {
                initialValueR = textField.text!
            }
       
        
            let range = Int(initialValueR)
            if  ((range < 0) || (range > 100)) {
                
                let myAlert = UIAlertController(title:"Alert",message:"Input out of range.please enter the valid Input.",preferredStyle:UIAlertControllerStyle.Alert);
                let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.Default, handler : handleTextR)
                
                myAlert.addAction(okAction)
                self.presentViewController(myAlert, animated: true,completion:nil);
            }
            
            redSlider.value = Float(redText.text!)!
            greenSlider.value = Float(greenText.text!)!
            blueSlider.value = Float(blueText.text!)!

        
   }
    
    /* Function on textbox Green.It limits the user to enter values,if out of range ,a pop up warning user to enter valid range value in the text box */
    
    @IBAction func textBoxGreen(sender: UITextField) {
        var textField:UITextField = sender;
        
        func handleTextG(alert:UIAlertAction!){
            
            if ((greenText.text < "0") || ((greenText.text)!.characters.count > 3)){
            greenText.text = "0"
            } else if ((greenText.text > "100") || ((redText.text)!.characters.count > 3)){
            greenText.text = "100"
            } else {
            self.greenText.text = greenText.text
            }
            
            red = Int(redText.text!)!
            green = Int(greenText.text!)!
            blue = Int(blueText.text!)!
            let redValue = CGFloat(red)
            let greenValue = CGFloat(green)
            let blueValue = CGFloat(blue)
            
            showColor.backgroundColor = UIColor(red:redValue/255 ,green:greenValue/255, blue:blueValue/255, alpha:1.0);
        }
        
        var initialValueG = ""
        if (textField.text != nil)
        {
            initialValueG = textField.text!
        }
        
        let range = Int(initialValueG)
        if ((range < 0) || (range > 100) ) {
            
            let myAlert = UIAlertController(title:"Alert",message:"Input out of range.please enter the valid Input.",preferredStyle:UIAlertControllerStyle.Alert);
            let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.Default, handler : handleTextG)
            
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated: true,completion:nil);
        }
        
        redSlider.value = Float(redText.text!)!
        greenSlider.value = Float(greenText.text!)!
        blueSlider.value = Float(blueText.text!)!
        
    }
    
    /* Function on textbox Blue.It limits the user to enter values,if out of range ,a pop up warning user to enter valid range value in the text box */
    
    @IBAction func textBoxBlue(sender: UITextField) {
        var textField:UITextField = sender;
        
        func handleTextB(alert:UIAlertAction!){
            
            if ((blueText.text < "0")  || ((blueText.text)!.characters.count > 3)){
            blueText.text = "0"
            } else if ((blueText.text > "100") || ((blueText.text)!.characters.count > 3)){
            blueText.text = "100"
            } else {
            self.blueText.text = blueText.text
            }
            
            red = Int(redText.text!)!
            green = Int(greenText.text!)!
            blue = Int(blueText.text!)!
            let re = CGFloat(red)
            let gr = CGFloat(green)
            let bl = CGFloat(blue)
            
            showColor.backgroundColor = UIColor(red:re/255 ,green:gr/255, blue:bl/255, alpha:1.0);
        }
        
        var initialValueB = ""
        if (textField.text != nil)
        {
            initialValueB = textField.text!
        }
        
        let range = Int(initialValueB)
        if ((range < 0) || (range > 100) ) {
            
            let myAlert = UIAlertController(title:"Alert",message:"Input out of range.please enter the valid Input.",preferredStyle:UIAlertControllerStyle.Alert);
            let okAction = UIAlertAction(title:"ok", style: UIAlertActionStyle.Default, handler : handleTextB)
            
            myAlert.addAction(okAction)
            self.presentViewController(myAlert, animated: true,completion:nil);
        }
        
        redSlider.value = Float(redText.text!)!
        greenSlider.value = Float(greenText.text!)!
        blueSlider.value = Float(blueText.text!)!
        
    }


    /* This fucntion is a button pressed action.When colorView button is pressed in simulator,the color in the view box changes according the user values in the corresponding color (red,green,blue) text boxes.Also here the user value is validated,If it goes out of range(other than 0 -100) a pop up message is generated asking user to enter the valid range values int he corresponding text boxes */
    
    @IBAction func changeColor(sender: UIButton) {
        redText.resignFirstResponder()
        greenText.resignFirstResponder()
        blueText.resignFirstResponder()
        
        red = Int(redText.text!)!
        green = Int(greenText.text!)!
        blue = Int(blueText.text!)!
        
         if (((red >= 0 ) && (red <= 100)) && ((green >= 0 ) && (green <= 100)) && ((blue >= 0 ) && (blue <= 100))) {
        
        let redValue = CGFloat(red)
        let greenValue = CGFloat(green)
        let blueValue = CGFloat(blue)
    
        showColor.backgroundColor = UIColor(red:redValue/255 ,green:greenValue/255, blue:blueValue/255, alpha:1.0);
        
        }
        
    }
    
    /* Red Slider action button performs the change of color in showColor view box according to the slider value (User slides to change values) */
    @IBAction func redSlider(sender: UISlider) {
        displayColors()
    }
    
    /* Green Slider action button performs the change of color in showColor view box according to the slider value.
    (User slides to change values) */
    
    @IBAction func greenSlider(sender: UISlider) {
        displayColors()
    }
    
    /* Blue Slider action button performs the change of color in showColor view box according to the slider value.
    
    (User slides to change values) */
    @IBAction func blueSlider(sender: UISlider) {
         displayColors()
    }
    
    /* Tells the delegate that editing stopped for the specified text field.This method is called after the text field resigns its first responder status. */
    
    @IBAction func textFieldDidEndEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    

    
    /* The text field calls this method whenever the user taps the return in keyboard.*/
    
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        redText.resignFirstResponder()
        greenText.resignFirstResponder()
        blueText.resignFirstResponder()
        return true;
    }
    
    /* This method is to hide the keyboard when the user taps the background */
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }

    /* The following fucntion doesn't allow the user to enter a number outside the range of 0 to 100 in the corresponding text color text boxes. */
    
  /*  func textField(textField: UITextField,
    shouldChangeCharactersInRange range: NSRange,
    replacementString string: String) -> Bool {
    if ((textField == redText))
    {
    var startString = ""
    if (textField.text != nil)
    {
        startString += textField.text!
        }
    startString += string
    let range = Int(startString)
    if ((range < 0) || (range > 100))
    {
        return false
    }else
    {
        return true;
        }
    }
        return false
    
    } */
    
    /* The following helper method is part of sliders function to update the view box with thw appropriate move of sliders */
    
    func displayColors(){
        
        //create a color from the sliders.
        
        let red = CGFloat(redSlider.value)
        let blue = CGFloat(blueSlider.value)
        let green = CGFloat(greenSlider.value)
    
       redText.text = String(format: "%i",Int(red))
        greenText.text = String(format: "%i",Int(green))
        blueText.text = String(format: "%i",Int(blue))
        
       let redd = Int(redText.text!)!
        let greenn = Int(greenText.text!)!
        let bluee = Int(blueText.text!)!
        
        let redValue = CGFloat(redd)
        let greenValue = CGFloat(greenn)
        let blueValue = CGFloat(bluee)
        
        showColor.backgroundColor = UIColor(red:redValue/255 ,green:greenValue/255, blue:blueValue/255, alpha:1.0);
        
    }

}



