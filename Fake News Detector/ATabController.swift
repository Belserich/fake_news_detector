//
//  ATabController.swift
//  Fake News Detector
//
//  Created by Adedayo Omosanya on 19/05/2019.
//  Copyright © 2019 Adedayo Omosanya. All rights reserved.
//

import UIKit

class ATabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: NSNotification.Name.UIApplicationWillEnterForeground, object: nil)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let vc = self.viewControllers?[0] as! UINavigationController
        let a = vc.viewControllers[0] as! ViewController
        print("appearing")
    }
    
    @objc func willEnterForeground() {
        // do stuff
        print("entering")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
