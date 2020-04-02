//
//  signinViewController.swift
//  finalfeel
//
//  Created by Mabear on 19/3/2563 BE.
//  Copyright © 2563 Mabear. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class signinViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!

    @IBOutlet weak var error: UILabel!
    private var authListener: AuthStateDidChangeListenerHandle?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         setUpElements()
        Auth.auth().addStateDidChangeListener(){ auth, user in
//          if user != nil {
//            let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? homeViewController
//
//           self.view.window?.rootViewController = homeViewController
//          }
        }
        }
        
        func setUpElements() {
            
            // Hide the error label
            error.alpha = 0
            
            // Style the elements
            Utilities.styleTextField(username)
            Utilities.styleTextField(password)
//            Utilities.styleFilledButton(login)
        }
  
//    override func viewWillAppear(_ animated: Bool) {
//        authListener = Auth.auth().addStateDidChangeListener({ (auth, user) in
//            if let _ = user {
//                let appDelegate = UIApplication.shared.delegate as! AppDelegate
//                appDelegate.setRootViewControllerWith(viewIdentifier: ViewIdentifiers.profile.rawValue)
//            }
//        })
//    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//       Auth.auth().removeStateDidChangeListener(authListener!)
//    }

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
    
    @IBAction func forgetPassword(_ sender: Any) {
        let resetPasswordAlert = UIAlertController(title: "Reset Password", message: nil, preferredStyle: .alert)
        resetPasswordAlert.addTextField { (textField: UITextField) in
            textField.placeholder = "Enter your email"
            textField.clearButtonMode = .whileEditing
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { (action: UIAlertAction) in
            let textField = resetPasswordAlert.textFields![0]
            
            Auth.auth().sendPasswordReset(withEmail: textField.text!) { error in
                if let error = error {
                    AppDelegate.showAlertMsg(withViewController: self, message: error.localizedDescription)
                } else {
                    AppDelegate.showAlertMsg(withViewController: self, message: "Password reset email was sent")
                }
            }
        }
        
        resetPasswordAlert.addAction(cancelAction)
        resetPasswordAlert.addAction(confirmAction)
        self.present(resetPasswordAlert, animated: true, completion: nil)
    }
    @IBAction func logintap(_ sender: Any) {
   
    
    let Username = username.text!.trimmingCharacters(in: .whitespacesAndNewlines)
          let Password = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
          
          // Signing in the user
          Auth.auth().signIn (withEmail: Username , password: Password) { (result, error) in
              
              if error != nil {
                  // Couldn't sign in
                  self.error.text = error!.localizedDescription
                  self.error.alpha = 1
              }
              else {
                  
                  let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? homeViewController
                  
                  self.view.window?.rootViewController = homeViewController
                  self.view.window?.makeKeyAndVisible()
              }
          }
    }

  }

