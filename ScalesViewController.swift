//
//  ScalesViewController.swift
//  MusicQuiz
//
//  Created by Yaoxiong Wu on 12/16/21.
//  Copyright © 2021 Yaoxiong Wu. All rights reserved.
//

import UIKit

class ScalesCell: UITableViewCell {
    override func prepareForReuse() {
        textLabel?.text = ""
    }
}

class ScalesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct Constants {
        static let scalesCellIdentifier = "scalesCell"
    }
    
    var selectedItem: String?
    
    @IBOutlet weak var scalesTable: UITableView!
    
    var scales = [["Major Scales", "C Major", "G Major", "D Major", "A Major", "E Major", "B Major", "F# Major", "F Major", "Bb Major", "Eb Major", "Ab Major", "Db Major"], ["Natural Minor Scales", "A minor", "E minor", "B minor", "F# minor", "C# minor", "G# minor", "D# minor", "D minor", "G minor", "C minor", "F minor", "Bb minor"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scalesTable.delegate = self
        scalesTable.dataSource = self
        
        scalesTable.register(ScalesCell.self, forCellReuseIdentifier: Constants.scalesCellIdentifier)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scales[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionNumberToDisplay = indexPath.section
        let rowNumberToDisplay = indexPath.row
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.scalesCellIdentifier) as? ScalesCell else {
            return UITableViewCell()
        }
        cell.textLabel?.text = scales[sectionNumberToDisplay][rowNumberToDisplay + 1]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return scales.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return scales[section][0]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sectionNumberToDisplay = indexPath.section
        let rowNumberToDisplay = indexPath.row
        
        selectedItem = scales[sectionNumberToDisplay][rowNumberToDisplay + 1]
        
        performSegue(withIdentifier: "goToDefinition", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DefinitionViewController {
            destination.selectedItem = self.selectedItem
        }
    }
    
    
}

