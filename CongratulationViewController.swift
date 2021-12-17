//
//  CongratulationViewController.swift
//  MusicQuiz
//
//  Created by Yaoxiong Wu on 12/8/21.
//  Copyright © 2021 Yaoxiong Wu. All rights reserved.
//

import UIKit

class CongratulationViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: Int = 0
    var total: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "Congratulation! \n \n Your Score... \n \n \(score) out of \(total)"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

