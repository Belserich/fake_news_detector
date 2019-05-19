//
//  ViewController.swift
//  Fake News Detector
//
//  Created by Adedayo Omosanya on 18/05/2019.
//  Copyright © 2019 Adedayo Omosanya. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var linkTextField: UITextField!
    @IBOutlet weak var textTextField: UITextView!
    @IBOutlet weak var goButton: UIButton!
    let defaults = UserDefaults.init(suiteName: "group.awarenews-ext")
    var ref: DatabaseReference!
    var p: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Awarenews"
        textTextField.layer.borderWidth = 0.25
        textTextField.layer.borderColor = UIColor.lightGray.cgColor
        textTextField.layer.cornerRadius = 10
        goButton.layer.cornerRadius = 30
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let x = defaults?.string(forKey: "textString") {
            Database.database().reference().child("/text").setValue(x)
            self.textTextField.text = x
        }
        if let y = defaults?.string(forKey: "urlString") {
            self.linkTextField.text = y
        }
    }

    
    @IBAction func go(_ sender: Any) {
        if let x = defaults?.string(forKey: "textString") {
            Database.database().reference().child("/text").setValue(x)
            self.textTextField.text = x
        }
        //listen to firebase
        Database.database().reference().child("machineRatingPercentage").observe(.value, with: { (snapshot) in
            if snapshot.exists(), let percentage = snapshot.value as? NSNumber {
                if percentage != 0 {
                    print("PERCENTANGE")
                    self.p = percentage.doubleValue
                    self.performSegue(withIdentifier: "runModel", sender: self)
                }
            }
        })
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "runModel" {
            let v = segue.destination as! ResultsViewController
            v.percentage = p
        }
    }
}

