//
//  ViewController.swift
//  BCSColorPicker
//
//  Created by Buğra Can Sefercik on 02/09/16.
//  Copyright © 2016 Bugra Sefercik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var changeMyBackgroundButton: UIButton!
    @IBAction func changeMyBackground(sender: UIButton) {
        
        let colorPickerVC = BCSColorPicker.picker
        
        //OPTIONAL SETTINGS START
        
        colorPickerVC.numberOfColorsInARow = 5
        colorPickerVC.colorPalette = FlatColors.allColors
        
        //OPTINAL SETTINGS END
        
        
        colorPickerVC.showColorPicker(self, animated: true){ color,index in
            
            if index != -1 {
                self.changeMyBackgroundButton?.backgroundColor = color
                print("Color: \(color!) - Index: \(index)")
            } else {
                print("Cancel button touched.")
            }
            
        }
    }

}
