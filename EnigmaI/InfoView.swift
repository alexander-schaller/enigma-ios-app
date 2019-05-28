//
//  InfoView.swift
//  EnigmaI
//
//  Created by Alexander Schaller on 06/08/18.
//  Copyright © 2018 Alex Schaller. All rights reserved.
//

import UIKit

class InfoView: UIViewController {
    
    @IBOutlet weak var infolabel1page1: UILabel!
    @IBOutlet weak var infolabel2page1: UILabel!
    @IBOutlet weak var infolabel3page1: UILabel!
    @IBOutlet weak var infolabel4page1: UILabel!
    @IBOutlet weak var infolabel5page1: UILabel!
    @IBOutlet weak var textfieldimage: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infolabel1page1.text = "With these you select the order of the Scramblers from left to right. You can also select which Scramblers are used in each position."
        
        infolabel2page1.text = "This stack of buttons lets you pick the settings of the individual Scramblers. First you select the visible letter (the one you can see through the little window), and in the second stack you select the ring position"
        
        infolabel3page1.text = "In the Plugboard you select different word pairs that you want to switch out with eachother therefore if you select the pair AP all As become Ps and vice versa. Then all you have to do is type out the word pairs in sequence."
        infolabel4page1.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse interdum lobortis eros, at placerat mauris lacinia sit amet. Proin scelerisque nec orci in lacinia. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec sodales ipsum eu pulvinar consequat. Nunc consequat enim vitae arcu blandit posuere. Nullam dignissim elementum volutpat. Aenean ex lorem, iaculis eu pulvinar ac, facilisis non augue. Donec malesuada est vel efficitur lobortis."
        
        infolabel5page1.text = "Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Quisque vulputate sagittis lacinia. Donec eu diam ut mauris rutrum vehicula at eu urna. Vivamus augue leo, sodales a pretium sed, ultricies a nulla. Fusce luctus laoreet ex. Ut scelerisque interdum tortor. Mauris elementum ac nunc vel rutrum. Duis ac felis eu magna posuere imperdiet nec iaculis eros."
        
        textfieldimage.placeholder = "Plugboard"
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func didPressCancelButton(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}


