//
//  SettingsViewController.swift
//  natgram
//
//  Created by Natan Gluszko on 07/07/2022.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func logOutTapped(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "goToStartScreen", sender: nil)
        } catch {
            print("error")
        }
    }
    
}
