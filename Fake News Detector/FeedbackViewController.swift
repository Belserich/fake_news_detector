//
//  FeedbackViewController.swift
//  Fake News Detector
//
//  Created by Adedayo Omosanya on 18/05/2019.
//  Copyright © 2019 Adedayo Omosanya. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {

    @IBOutlet weak var tag1: UIButton!
    @IBOutlet weak var tag2: UIButton!
    @IBOutlet weak var tag3: UIButton!
    @IBOutlet weak var tag4: UIButton!
    @IBOutlet weak var tag5: UIButton!
    @IBOutlet weak var tag6: UIButton!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Feedback"
        self.navigationItem.prompt = "Why do you disagree with this rating? Long press tags for more info"
        let tags = [tag1,tag2,tag3,tag4,tag5,tag6]
        for t in tags {
            t?.layer.cornerRadius = 5
            let longPress = UILongPressGestureRecognizer(target: self, action: #selector(self.longPressed))
            t?.addGestureRecognizer(longPress)
        }
        
        doneButton.layer.cornerRadius = 60/2

    }
    
    func longPressed(){
       let a = UIAlertController(title: "Repetitive", message: "The article contains the same text numerous times", preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(a, animated: true, completion: nil)
        
    }
    @IBAction func done(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
