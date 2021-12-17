//
//  SettingsViewController.swift
//  MusicQuiz
//
//  Created by Yaoxiong Wu on 12/16/21.
//  Copyright © 2021 Yaoxiong Wu. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var questionsPerQuiz: UILabel!
    @IBOutlet weak var numberOfQuestions: UILabel!
    
    @IBOutlet weak var outerView: UIView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBAction func settingPressed(_ sender: UIButton) {
        outerView.isHidden = false
    }
    
    @IBAction func valueChanged(_ sender: UIStepper) {
        amount.text = "\(Int(stepper.value))"
    }
    
    @IBAction func donePressed(_ sender: UIButton) {
        numberOfQuestions.text = amount.text
        outerView.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
