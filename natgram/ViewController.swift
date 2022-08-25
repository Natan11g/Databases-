//
//  ViewController.swift
//  natgram
//
//  Created by Natan Gluszko on 07/07/2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    // buttons

    @IBAction func signUpTapped(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdata, error) in
                
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Try again later")
                } else {
                    self.performSegue(withIdentifier: "goToFeed", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "Please Fill in all fields")
        }
        
    }
    
    
    @IBAction func signInTapped(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
        
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (authdata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error", messageInput: error?.localizedDescription ?? "Try again later")
                } else {
                    self.performSegue(withIdentifier: "goToFeed", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "Please Fill in all fields")
        }
        
            }
    
    
    // functions
    
    func makeAlert(titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
}

