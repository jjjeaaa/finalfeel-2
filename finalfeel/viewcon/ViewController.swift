//
//  ViewController.swift
//  finalfeel
//
//  Created by Mabear on 19/3/2563 BE.
//  Copyright © 2563 Mabear. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import GoogleSignIn


class ViewController: UIViewController,LoginButtonDelegate{
    private var authListener: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
              super.viewDidLoad()
             GIDSignIn.sharedInstance()?.presentingViewController = self
      }
    
      override func didReceiveMemoryWarning() {
             super.didReceiveMemoryWarning()
             // Dispose of any resources that can be recreated.
         }
    

    
//    override func viewWillDisappear(_ animated: Bool) {
//         super.viewWillDisappear(animated)
//         
//        Auth.auth().removeStateDidChangeListener(authListener!)
//     }
//         
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            if let error = error {
            print(error.localizedDescription)
        return
        }
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                print("Facebook authentication with Firebase error: ", error)
                return
            }
            
        print("Login success!")
        }

    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("Logged out")
    }
    
     
    
    @IBAction func googleLogin(_ sender: Any) {
          GIDSignIn.sharedInstance().signIn()
    }
    
    
    @IBAction func facebookLogin(_ sender: UIButton) {
        let FBLoginManager = LoginManager()
        FBLoginManager.logIn(permissions: ["public_profile", "email"], from: self) { (result, error) in
         if let error = error {
           print("Failed to login: \(error.localizedDescription)")
           return
         }
            guard let accessToken = AccessToken.current else {
           print("Failed to get access token")
           return
         }
         let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
         // Perform login by calling Firebase APIs
         Auth.auth().signInAndRetrieveData(with: credential) { (user, error) in
           if let error = error {
             print("Login error: \(error.localizedDescription)")
             let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
             let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
             alertController.addAction(okayAction)
             self.present(alertController, animated: true, completion: nil)
             return
           }
     let vc = UIViewController.getViewControllerWith(viewControllerIdentifier: ViewIdentifiers.email.rawValue)
            self.navigationController?.pushViewController(vc, animated: true)
         }
       }
        }


//    func transitionToHome() {
//
//           let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? homeViewController
//
//           view.window?.rootViewController = homeViewController
//           view.window?.makeKeyAndVisible()
//
//       }

    @IBOutlet weak var signup: UIButton!
    @IBOutlet weak var signin: UIButton!
    let applogo = UIImageView(image: UIImage(named: "applogo")!)
//    let splashView = UIView()
    
 

}
