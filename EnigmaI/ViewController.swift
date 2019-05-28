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


class ViewController: UIViewController {

    
    //IBOutlet Variables
    @IBOutlet weak var PlugboardInput: UITextField!
    
    @IBOutlet weak var InputText: UITextField!
    
    @IBOutlet weak var OutputText: UITextField!
    
    @IBOutlet weak var Scrambler1Place: UIButton!
    
    @IBOutlet weak var Scrambler2Place: UIButton!
    
    @IBOutlet weak var Scrambler3Place: UIButton!
    
    @IBOutlet weak var NavigationBarHome: UINavigationItem!
    
    @IBOutlet weak var Scrambler1: UIButton!
    
    @IBOutlet weak var Scrambler2: UIButton!
    
    @IBOutlet weak var Scrambler3: UIButton!
    
    @IBOutlet weak var Ring1: UIButton!
    
    @IBOutlet weak var Ring2: UIButton!
    
    @IBOutlet weak var Ring3: UIButton!
    
    
    //Change Statusbar Style
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Change Statusbar style
        self.setNeedsStatusBarAppearanceUpdate()
        
        //Set up of Plugboard Input Field
        PlugboardInput.autocapitalizationType = UITextAutocapitalizationType(rawValue: 3)!
        
        PlugboardInput.keyboardAppearance = UIKeyboardAppearance(rawValue: 1)!
        
        PlugboardInput.returnKeyType = UIReturnKeyType(rawValue: 9)!
        
        PlugboardInput.placeholder = "Plugboard"
        
        PlugboardInput.autocorrectionType = UITextAutocorrectionType(rawValue: 1)!
        
        //Set up of Input Text Field
        
        InputText.autocapitalizationType = UITextAutocapitalizationType(rawValue: 3)!
        
        InputText.keyboardAppearance = UIKeyboardAppearance(rawValue: 1)!
        
        InputText.returnKeyType = UIReturnKeyType(rawValue: 1)!
        
        InputText.placeholder = "Input"
        
        OutputText.delegate = self
        
        OutputText.inputView = UIView()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // Retrieve the data from the global variables that get the data from the picker view
        let SL:[String] = [String(global.select[0] as! String), String(global.select[1] as! String), String(global.select[2] as! String)]
        let SP:[Character] = [Character(global.select[3] as! String), Character(global.select[4] as! String), Character(global.select[5] as! String)]
        let RP:[String] = [String(global.select[6] as! String), String(global.select[7] as! String), String(global.select[8] as! String)]
                
        // Set the appropriate image for each of the different scrambler buttons
        Scrambler1Place.setImage(UIImage(named: "Scrambler\(SL[0])_EnigmaApp"), for: UIControl.State(rawValue: 0))
        Scrambler2Place.setImage(UIImage(named: "Scrambler\(SL[1])_EnigmaApp"), for: UIControl.State(rawValue: 0))
        Scrambler3Place.setImage(UIImage(named: "Scrambler\(SL[2])_EnigmaApp"), for: UIControl.State(rawValue: 0))
        
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
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
        PlugboardInput.text! = AddTrailingSpace(of: PlugboardInput.text!.replacingOccurrences(of: " ", with: ""))
        
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
        
        OutputText.text = Enigma(input, PlugboardInput.text!, SL ,SP, RP)
        
        InputText.resignFirstResponder()
        
    }
    
    
    //Check whether the Characters are only letters

    @IBAction func checkForNonConform() {
        
        let input = InputText.text!
        var temp:String = ""
        
        for i in input {
            
            if ASCII[i] != nil || i == " " {
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
        OutputText.text = ""
        
        viewWillAppear(false)
        
        
    }
    

    @IBAction func didTapHeloButton(_ sender: Any) {
    
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let resultViewController = storyboard.instantiateViewController(withIdentifier: "InfoView") as! InfoView
        
        self.present(resultViewController, animated:true, completion:nil)
        
        
    }
    
    @IBAction func cancelChildVC(segue:UIStoryboardSegue) {
        viewWillAppear(false)
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return textField != self.OutputText
        
    }
    
}
