//
//  SignInViewController.swift
//  Snapshot
//
//  Created by user on 7/11/17.
//  Copyright © 2017 Appster. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            print("We tried to sign in")
            if error != nil {
                print("We have an error:\(error)")
                
                Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
                    print("We tried to create a user")
                    
                    if error != nil {
                        print("We have an error:\(error)")
                    } else {
                        print("Created user succesfully")
                        self.performSegue(withIdentifier: "signinsegue", sender: nil)
                    }
                    
                })
                
            } else {
                print("Signed in succesfully!")
                self.performSegue(withIdentifier: "signinsegue", sender: nil)
            }
        }
        
    }
    
}


