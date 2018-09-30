//
//  ViewController.swift
//  chatorama
//
//  Created by Andre Campbell on 9/29/18.
//  Copyright © 2018 Andre Campbell. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var usernameLabel: UITextField!
    let alertController = UIAlertController(title: "Invalid username/password", message: "Please enter a valid username/password", preferredStyle: .alert)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Add OK button to alert
        let OKAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(OKAction)
    }
    @IBAction func didTapLogin(_ sender: Any) {
        loginUser()
    }
    
    func loginUser() {
        
        let username = usernameLabel.text ?? ""
        let password = passwordLabel.text ?? ""
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                print("User log in failed: \(error.localizedDescription)")
                self.alertController.message = error.localizedDescription
                self.present(self.alertController, animated: true)
               
                
            } else {
                print("User logged in successfully")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }
}

