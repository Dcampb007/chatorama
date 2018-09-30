//
//  RegistrationViewController.swift
//  chatorama
//
//  Created by Andre Campbell on 9/29/18.
//  Copyright © 2018 Andre Campbell. All rights reserved.
//

import UIKit
import Parse

class RegistrationViewController: UIViewController  {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var confirmPasswordField: UITextField!
    let alertController = UIAlertController(title: "Invalid xxx", message: "Please enter a valid xxx", preferredStyle: .alert)

    @IBAction func didTapRegister(_ sender: Any) {
        let username = usernameField.text! as String
        let password = passwordField.text! as String
        let confirmPassword = confirmPasswordField.text! as String
        let email = emailField.text! as String
        if username != "" && email.contains("@") && password == confirmPassword{
            self.registerUser()
        }
        else {
            if email == "" || !email.contains("@") {
                alertController.title = "Invalid email"
                alertController.message = "Enter a valid email address"
                present(alertController, animated: true)
            }
            else if password != confirmPassword || username == "" {
                alertController.title = "Invalid username or password"
                alertController.message = "Enter a valid username or password"
                present(alertController, animated: true)
            }
        }
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // create an OK action
        let OKAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(OKAction)

    }

    @IBAction func exitRegistration(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

    func registerUser() {
        // initialize a user object
        let newUser = PFUser()
        
        // set user properties
        newUser.username = usernameField.text
        newUser.email = emailField.text
        newUser.password = passwordField.text
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
               self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        }
    }

}
