//
//  CollectionViewController.swift
//  MusicQuiz
//
//  Created by Yaoxiong Wu on 12/16/21.
//  Copyright © 2021 Yaoxiong Wu. All rights reserved.
//

import UIKit

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var sectionLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    override func prepareForReuse() {
        sectionLabel?.text = ""
        itemLabel?.text = ""
    }
}

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    struct Constants {
        static let scalesCellIdentifier = "customCell"
        static let scalesSectionIdentifier = "sectionView"
    }
    
    var selectedItem: String?
    
    @IBOutlet weak var scalesCollection: UICollectionView!
    
    var scales = [["Major Scales", "C Major", "G Major", "D Major", "A Major", "E Major", "B Major", "F# Major", "F Major", "Bb Major", "Eb Major", "Ab Major", "Db Major"], ["Natural Minor Scales", "A minor", "E minor", "B minor", "F# minor", "C# minor", "G# minor", "D# minor", "D minor", "G minor", "C minor", "F minor", "Bb minor"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scalesCollection.delegate = self
        scalesCollection.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return scales.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return scales[section].count - 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionNumberToDisplay = indexPath.section
        let rowNumberToDisplay = indexPath.row
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.scalesCellIdentifier, for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        cell.itemLabel?.text = scales[sectionNumberToDisplay][rowNumberToDisplay + 1]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionNumberToDisplay = indexPath.section
        
        guard let sectionView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: Constants.scalesSectionIdentifier, for: indexPath) as? CollectionCell else {
            return UICollectionViewCell()
        }
        sectionView.sectionLabel?.text = scales[sectionNumberToDisplay][0]
        return sectionView
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sectionNumberToDisplay = indexPath.section
        let rowNumberToDisplay = indexPath.row
        
        selectedItem = scales[sectionNumberToDisplay][rowNumberToDisplay + 1]
        
        performSegue(withIdentifier: "goToDefinition2", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DefinitionViewController {
            destination.selectedItem = self.selectedItem
        }
    }
    

}
