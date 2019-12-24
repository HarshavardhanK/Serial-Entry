//
//  ViewController.swift
//  Foodlabs-task
//
//  Created by Harshavardhan K on 23/12/19.
//  Copyright © 2019 Harshavardhan K. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {
    
    var ref: DatabaseReference!

    var pressed: String!
    
    var store: [Int]!
    
    @IBOutlet var displayLabel: UILabel!
    
    @IBOutlet var oneButton: UIButton!
    @IBOutlet var twoButton: UIButton!
    @IBOutlet var threeButton: UIButton!
    @IBOutlet var fourButton: UIButton!
    @IBOutlet var fiveButton: UIButton!
    @IBOutlet var sixButton: UIButton!
    
    
    @IBAction func clearAction(_ sender: Any) {
        pressed.remove(at: pressed.index(before: pressed.endIndex))
        displayLabel.text = pressed
        
        store.remove(at: store.count - 1)
    }
    
    
    @IBAction func doneAction(_ sender: Any) {
        ref = Database.database().reference()
        self.ref.child("keypad").setValue(["value": store])
        
        print("submitted!")
    }
    
    @objc func appendToString(_ sender: UIButton) {
        let buttonTag = sender.tag
        
        let str = String(buttonTag)
        
        pressed.append(str)
        
        displayLabel.text = pressed
        
        store.append(buttonTag)
        
        print(str)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        store = [Int]()
        
        pressed = ""
        
        oneButton.addTarget(self, action: #selector(appendToString(_:)), for: .touchUpInside)
        
        twoButton.addTarget(self, action: #selector(appendToString(_:)), for: .touchUpInside)
        
        threeButton.addTarget(self, action: #selector(appendToString(_:)), for: .touchUpInside)
        
        fourButton.addTarget(self, action: #selector(appendToString(_:)), for: .touchUpInside)
        
        fiveButton.addTarget(self, action: #selector(appendToString(_:)), for: .touchUpInside)
        
        sixButton.addTarget(self, action: #selector(appendToString(_:)), for: .touchUpInside)
    }


}

