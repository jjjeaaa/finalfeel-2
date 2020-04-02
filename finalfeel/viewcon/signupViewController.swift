//
//  signupViewController.swift
//  finalfeel
//
//  Created by Mabear on 19/3/2563 BE.
//  Copyright © 2563 Mabear. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore



class signupViewController: UIViewController {
    let signinlogin = "signinlogin"
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var error: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
        
    func setUpElements() {
        
            error.alpha = 0
         Utilities.styleTextField(username)
         Utilities.styleTextField(email)
         Utilities.styleTextField(password)
        }
  
    // Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message
    func validateFields() -> String? {
        //check that all fields are filled in
        if username.text?.trimmingCharacters(in: . whitespacesAndNewlines) == "" ||
        password.text? .trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            email.text? .trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
             return "Please fill in all fields."
}
   
    
        // Check if the password is secure
            let cleanedPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            if Utilities.isPasswordValid(cleanedPassword) == false {
                // Password isn't secure enough
                return "Please make sure your password is at least 8 characters, contains a special character and a number."
            }
            
            return nil
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func backButton(_ sender: Any) {
self.navigationController?.popViewController(animated: true)
        }

    
    @IBAction func signuptap(_ sender: Any) {
    
    
    // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let Username = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let Password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let Email = email.text!.trimmingCharacters(in: .whitespacesAndNewlines)
          
            
            // Create the user
            Auth.auth().createUser(withEmail: Email, password: Password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    
//                     User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["username":Username,  "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
//                    self.transitionToHome()
                    self.performSegue(withIdentifier: self.signinlogin, sender:nil)
                    
                }
                
            }
            
             
            
        }
    }
    
    func showError(_ message:String) {
        error.text = message
        error.alpha = 1
    }
//    
//    func transitionToHome() {
//
//        let signinViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? signinViewController
//
//        view.window?.rootViewController = signinViewController
//        view.window?.makeKeyAndVisible()
//
//    }

 }

