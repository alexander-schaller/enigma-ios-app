//
//  PickerView.swift
//  EnigmaI
//
//  Created by Alex on 06.01.18.
//  Copyright © 2018 Alexander John Schaller. All rights reserved.
//

import Foundation
import UIKit

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var picker: UIPickerView!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let attributedString = NSAttributedString(string: self.pickerData[row], attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        return attributedString
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        global.select[global.didTapWhat] = pickerData[row] as AnyObject
        
    }
    
    var pickerData: [String] = [String]()
    
    
    // MARK - :
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.picker.delegate = self
        self.picker.dataSource = self
        
        if global.didTapWhat == 0 || global.didTapWhat == 1 || global.didTapWhat == 2 {
            pickerData = ["I", "II", "III", "IV", "V"]
        }
        else if global.didTapWhat == 3 || global.didTapWhat == 4 || global.didTapWhat == 5 {
            
            let alphabet: String = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            
            var alphabetArray: [String] = []
            
            for i in Array(alphabet) {
                alphabetArray.append(String(i))
            }
            
            pickerData = alphabetArray
        }
        else {
            var numbers: [String] = []
            
            for i in 1...26 {
                numbers.append("\(i)")
            }
            
            pickerData = numbers
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return pickerData.count
        }
        
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return pickerData[row]
        }
        
    }
    
    @IBAction func didPressDone(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
