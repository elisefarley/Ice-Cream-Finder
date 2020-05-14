//
//  NotesViewController.swift
//  Ice Cream Finder
//
//  Created by Elise Farley on 5/12/20.
//  Copyright © 2020 Elise Farley. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {

    let defaults = UserDefaults.standard
    @IBOutlet weak var notes: UITextView!
    @IBOutlet weak var nameLabel: UILabel!
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        if let savedData = defaults.object(forKey: "\(nameLabel.text!)") as? Data {
             if let decoded = try? JSONDecoder().decode(IceCreamLocation.self, from: savedData) {
                notes.text = decoded.notes
             }
        }
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.saveData()
    }
    
    func saveData() {
        let stuffToSave = IceCreamLocation(name: "\(nameLabel.text!)", notes: "\(notes.text!)")
        if let encoded = try? JSONEncoder().encode(stuffToSave) {
            defaults.set(encoded, forKey: "\(nameLabel.text!)")
        }
    }
}
