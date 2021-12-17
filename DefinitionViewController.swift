//
//  DefinitionViewController.swift
//  MusicQuiz
//
//  Created by Yaoxiong Wu on 12/16/21.
//  Copyright © 2021 Yaoxiong Wu. All rights reserved.
//

import UIKit

class DefinitionViewController: UIViewController {
    
    struct ScalesDefinition {
        let scaleName: String
        let imageName: String
        let accent: String
    }
    
    var selectedItem: String?
    
    @IBOutlet weak var scaleLabel: UILabel!
    @IBOutlet weak var accentLabel: UILabel!
    
    var scalesBank: [ScalesDefinition] = [
        ScalesDefinition(scaleName:"C Major", imageName:"", accent:"0 sharps"),
        ScalesDefinition(scaleName:"G Major", imageName:"", accent:"1 sharps"),
        ScalesDefinition(scaleName:"D Major", imageName:"", accent:"2 sharps"),
        ScalesDefinition(scaleName:"A Major", imageName:"", accent:"3 sharps"),
        ScalesDefinition(scaleName:"E Major", imageName:"", accent:"4 sharps"),
        ScalesDefinition(scaleName:"B Major", imageName:"", accent:"5 sharps"),
        ScalesDefinition(scaleName:"F# Major", imageName:"", accent:"6 sharps"),
        ScalesDefinition(scaleName:"F Major", imageName:"", accent:"1 flat"),
        ScalesDefinition(scaleName:"Bb Major", imageName:"", accent:"2 flats"),
        ScalesDefinition(scaleName:"Eb Major", imageName:"", accent:"3 flats"),
        ScalesDefinition(scaleName:"Ab Major", imageName:"", accent:"4 flats"),
        ScalesDefinition(scaleName:"Db Major", imageName:"", accent:"5 flats"),
        ScalesDefinition(scaleName:"A minor", imageName:"", accent:"0 sharps"),
        ScalesDefinition(scaleName:"E minor", imageName:"", accent:"1 sharps"),
        ScalesDefinition(scaleName:"B minor", imageName:"", accent:"2 sharps"),
        ScalesDefinition(scaleName:"F# minor", imageName:"", accent:"3 sharps"),
        ScalesDefinition(scaleName:"C# minor", imageName:"", accent:"4 sharps"),
        ScalesDefinition(scaleName:"G# minor", imageName:"", accent:"5 sharps"),
        ScalesDefinition(scaleName:"D# minor", imageName:"", accent:"6 sharps"),
        ScalesDefinition(scaleName:"D minor", imageName:"", accent:"1 flat"),
        ScalesDefinition(scaleName:"G minor", imageName:"", accent:"2 flats"),
        ScalesDefinition(scaleName:"C minor", imageName:"", accent:"3 flats"),
        ScalesDefinition(scaleName:"F minor", imageName:"", accent:"4 flats"),
        ScalesDefinition(scaleName:"Bb minor", imageName:"", accent:"5 flats"),
    ]
    
    var currentQuestionIndex: Int? = -1
    
    func showDefinition() {
        for i in scalesBank {
            if (i.scaleName == selectedItem) {
                scaleLabel.text = i.scaleName
                accentLabel.text = i.accent
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showDefinition()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}
