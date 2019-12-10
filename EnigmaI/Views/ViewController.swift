//
//  ViewController.swift
//  EnigmaI
//
//  Created by Alexander John Schaller on 15/10/17.
//  Copyright © 2017 Alexander John Schaller. All rights reserved.
//

import UIKit
import Foundation


struct global {
    
    static var didTapWhat: Int = 0
    static var select: [Any] = ["I", "II", "III", "A", "B", "C", "1" , "1", "1"]
    
}

class ViewController: UIViewController, UITextViewDelegate {

    
    //IBOutlet Variables
    @IBOutlet weak var PlugboardInput: UITextField!
    @IBOutlet weak var InputText: UITextField!
    @IBOutlet weak var OutputText: UITextField!
    @IBOutlet weak var OutputTextView: UITextView!
    
    @IBOutlet weak var Scrambler1Place: UIButton!
    @IBOutlet weak var Scrambler2Place: UIButton!
    @IBOutlet weak var Scrambler3Place: UIButton!
    
    @IBOutlet weak var NavigationBarHome: UINavigationItem!
    @IBOutlet weak var refreshButton: UIBarButtonItem!
    @IBOutlet weak var helpButton: UIBarButtonItem!

    @IBOutlet weak var Scrambler1: UIButton!
    @IBOutlet weak var Scrambler2: UIButton!
    @IBOutlet weak var Scrambler3: UIButton!
    
    @IBOutlet weak var Ring1: UIButton!
    @IBOutlet weak var Ring2: UIButton!
    @IBOutlet weak var Ring3: UIButton!
    
    @IBOutlet weak var scramblersStackView: UIStackView!
    @IBOutlet weak var setScramblersStackView: UIStackView!
    @IBOutlet weak var ringStackView: UIStackView!
    @IBOutlet weak var plugboardStackView: UIStackView!
    @IBOutlet weak var inputOutputStackView: UIStackView!
    
    //Custom Colors
    var darkGrayBackgroundColor = UIColor(red: 37/255, green: 37/255, blue: 37/255, alpha: 1)
    var lightGrayBackgroundColor = UIColor(red: 57/255, green: 57/255, blue: 57/255, alpha: 1)
    var labelColor = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if #available(iOS 13.0, *) {
            darkGrayBackgroundColor = UIColor.secondarySystemFill
            lightGrayBackgroundColor = UIColor.secondarySystemBackground
        }
        
        
        
        //Set up of Plugboard Input Field
        PlugboardInput.autocapitalizationType = UITextAutocapitalizationType(rawValue: 3)!
        PlugboardInput.keyboardAppearance = UIKeyboardAppearance(rawValue: 0)!
        PlugboardInput.returnKeyType = UIReturnKeyType(rawValue: 9)!
        PlugboardInput.autocorrectionType = UITextAutocorrectionType(rawValue: 1)!
        PlugboardInput.addRoundedCornersAndBackground(backgroundColor: lightGrayBackgroundColor, cornerRadius: 10.0)
        
        //Set up of Input Text Field
        InputText.autocapitalizationType = UITextAutocapitalizationType(rawValue: 3)!
        InputText.keyboardAppearance = UIKeyboardAppearance(rawValue: 0)!
        InputText.returnKeyType = UIReturnKeyType(rawValue: 1)!
        InputText.placeholder = "Input"
        InputText.attributedPlaceholder = NSAttributedString(string: "  Input", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        InputText.addRoundedCornersAndBackground(backgroundColor: lightGrayBackgroundColor, cornerRadius: 10.0)
        
        //Set up Output Text Field
        // TODO: Replace textfield with text view and make it look like it should with shrinking text size, etc.
        OutputTextView.isEditable = false
        OutputTextView.textContainerInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        
        //Set properties for the navigation bar buttons
        refreshButton!.setBackgroundImage(UIImage(named: "Refresh Button"), for: .normal, barMetrics: .default)
        refreshButton!.setBackgroundImage(UIImage(named: "Refresh Button Pressed"), for: .selected, barMetrics: .default)
        
        // Giving all the stackviews a background color with rounded corners through the extension
        scramblersStackView.addBackground(color: darkGrayBackgroundColor, cornerRadius: 25.0)
        setScramblersStackView.addBackground(color: darkGrayBackgroundColor, cornerRadius: 25.0)
        ringStackView.addBackground(color: darkGrayBackgroundColor, cornerRadius: 25.0)
        plugboardStackView.addBackground(color: darkGrayBackgroundColor, cornerRadius: 15)
        inputOutputStackView.addBackground(color: darkGrayBackgroundColor, cornerRadius: 25.0)
        
        // Changing the background color and corner radius on all the buttons in the stacks
        Scrambler1.formatToSpec(backgroundColor: lightGrayBackgroundColor, cornerRadius: 7)
        Scrambler2.formatToSpec(backgroundColor: lightGrayBackgroundColor, cornerRadius: 7)
        Scrambler3.formatToSpec(backgroundColor: lightGrayBackgroundColor, cornerRadius: 7)
        
        Ring1.formatToSpec(backgroundColor: lightGrayBackgroundColor, cornerRadius: 7)
        Ring2.formatToSpec(backgroundColor: lightGrayBackgroundColor, cornerRadius: 7)
        Ring3.formatToSpec(backgroundColor: lightGrayBackgroundColor, cornerRadius: 7)
        

        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if #available(iOS 13.0, *) {
            labelColor = UIColor.label
        }
        
        // Retrieve the data from the global variables that get the data from the picker view
        let SL:[String] = [String(global.select[0] as! String), String(global.select[1] as! String), String(global.select[2] as! String)]
        let SP:[Character] = [Character(global.select[3] as! String), Character(global.select[4] as! String), Character(global.select[5] as! String)]
        let RP:[String] = [String(global.select[6] as! String), String(global.select[7] as! String), String(global.select[8] as! String)]
                
        // Set the appropriate image for each of the different scrambler buttons
        Scrambler1Place.setImage(UIImage(named: "Scrambler\(SL[0])_EnigmaApp"), for: UIControl.State(rawValue: 0))
        Scrambler2Place.setImage(UIImage(named: "Scrambler\(SL[1])_EnigmaApp"), for: UIControl.State(rawValue: 0))
        Scrambler3Place.setImage(UIImage(named: "Scrambler\(SL[2])_EnigmaApp"), for: UIControl.State(rawValue: 0))
        
        let attributes = [NSAttributedString.Key.foregroundColor: labelColor, NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17.0)]
        
        // Set the value for the scrambler button title based on the data from the picker
        Scrambler1.setAttributedTitle(NSAttributedString(string: "\(SP[0])", attributes: attributes), for: UIControl.State(rawValue: 0))
        Scrambler2.setAttributedTitle(NSAttributedString(string: "\(SP[1])", attributes: attributes), for: UIControl.State(rawValue: 0))
        Scrambler3.setAttributedTitle(NSAttributedString(string: "\(SP[2])", attributes: attributes), for: UIControl.State(rawValue: 0))
        
        // Same thing as the previous block just for the ring button
        Ring1.setAttributedTitle(NSAttributedString(string: "\(String(RP[0]))", attributes: attributes), for: UIControl.State(rawValue: 0))
        Ring2.setAttributedTitle(NSAttributedString(string: "\(String(RP[1]))", attributes: attributes), for: UIControl.State(rawValue: 0))
        Ring3.setAttributedTitle(NSAttributedString(string: "\(String(RP[2]))", attributes: attributes), for: UIControl.State(rawValue: 0))
        
        
    }

    //Swipe Down dismisses Keyboard
    @IBAction func swipe(_ sender: UISwipeGestureRecognizer) {
        InputText.resignFirstResponder()
        PlugboardInput.resignFirstResponder()
        
    }
    
    
    //Add a Space after two characters have been entered
    @IBAction func addTrailingSpace() {
        PlugboardInput.text! = EnigmaI.addTrailingSpace(of: PlugboardInput.text!.replacingOccurrences(of: " ", with: ""))
        
        let text:String? = PlugboardInput.text!.replacingOccurrences(of: " ", with: "")
        
        let len:Int? = text!.count - 1
        
        if text!.count > 1 {
            
            let temp:String? = String(text![..<text!.index(before: text!.endIndex)])
            
            if temp!.contains(text![len!]){
            
                let alertController = UIAlertController(title: "Warning", message:
                    "For the Plugboard you can only use letters once", preferredStyle: UIAlertController.Style.alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
                
                self.present(alertController, animated: true, completion: {
                    self.PlugboardInput.text! = String((self.PlugboardInput.text?.dropLast())!)
                })
            }
        }
        
        if text!.count > 26 {
            
            let alertController = UIAlertController(title: "Warning", message:
                "You can enter a maximum of 13 letter pairs", preferredStyle: UIAlertController.Style.alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default,handler: nil))
            
            self.present(alertController, animated: true, completion: {
                self.PlugboardInput.text! = String((self.PlugboardInput.text?.dropLast())!)
            })
            
        }
    }
    
    //When return key is pressed run Enigma func
    @IBAction func returnKeyPressed() {
        let input = InputText.text!.replacingOccurrences(of: " ", with: "").uppercased()
        
        let SL:[String] = [String(global.select[0] as! String), String(global.select[1] as! String), String(global.select[2] as! String)]
        let SP:[Character] = [Character(global.select[3] as! String), Character(global.select[4] as! String), Character(global.select[5] as! String)]
        let RP:[Int] = [(global.select[6] as! NSString).integerValue , (global.select[7] as! NSString).integerValue, (global.select[8] as! NSString).integerValue]
        
        OutputTextView.text = Enigma(input, PlugboardInput.text!, SL ,SP, RP)
        
        InputText.resignFirstResponder()
        
    }
    
    
    //Check whether the Characters are only letters
    @IBAction func checkForNonConform() {
        let input = InputText.text!
        var temp:String = ""
        
        for i in input {
            
            if i.isASCII || i == " " {
                temp.append(i)
            }
            
        }
        InputText.text! = temp
        
    }
    @IBAction func pressField(_ sender: Any) {
        InputText.becomeFirstResponder()
    }
    
    @IBAction func didPressDone(_ sender: Any) {
        PlugboardInput.resignFirstResponder()
    }
    
    @IBAction func didTapScrambler1(_ sender: Any) {
        global.didTapWhat = 0
    }
    @IBAction func didTapScrambler2(_ sender: Any) {
        global.didTapWhat = 1
    }
    
    @IBAction func didTapScrambler3(_ sender: Any) {
        global.didTapWhat = 2
    }
    
    @IBAction func didTapScramblerSet1(_ sender: Any) {
        global.didTapWhat = 3
    }
    
    @IBAction func didTapScramblerSet2(_ sender: Any) {
        global.didTapWhat = 4
    }
    
    @IBAction func didTapScramblerSet3(_ sender: Any) {
        global.didTapWhat = 5
    }
    
    @IBAction func didTapRing1(_ sender: Any) {
        global.didTapWhat = 6
    }
    
    @IBAction func didTapRing2(_ sender: Any) {
        global.didTapWhat = 7
    }
    
    @IBAction func didTapRing3(_ sender: Any) {
        global.didTapWhat = 8
    }
    
    @IBAction func resetView(_ sender: Any) {
        global.select = ["I", "II", "III", "A", "B", "C", "1" , "1", "1"]
        PlugboardInput.text = ""
        InputText.text = ""
        OutputTextView.text = ""
        
        viewWillAppear(false)
    }
    

    @IBAction func didTapHelpButton(_ sender: Any) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let resultViewController = storyboard.instantiateViewController(withIdentifier: "InfoView") as! InfoView
        
        self.present(resultViewController, animated:true, completion:nil)
    }
    
    @IBAction func cancelChildVC(segue:UIStoryboardSegue) {
        viewWillAppear(false)
        self.dismiss(animated: true, completion: nil)
    }
    
}
