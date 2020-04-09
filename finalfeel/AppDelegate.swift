//
//  AppDelegate.swift
//  finalfeel
//
//  Created by Mabear on 19/3/2563 BE.
//  Copyright © 2563 Mabear. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import Foundation
import FBSDKCoreKit
import GoogleSignIn
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,GIDSignInDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        IQKeyboardManager.shared().isEnabled = true
        IQKeyboardManager.shared().shouldResignOnTouchOutside = true
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        let handled = ApplicationDelegate.shared.application(app, open: url, options: options)
         GIDSignIn.sharedInstance().handle(url)
         return handled
    }
    
        func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
               if let err = error {
                   print("Failed to log into Google: ", err)
                   return
               }
               
               print("Successfully logged into Google", user)
               
               guard let idToken = user.authentication.idToken else { return }
               guard let accessToken = user.authentication.accessToken else { return }
               let credentials = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
               
               Auth.auth().signIn(with: credentials, completion: { (user, error) in
                   if let err = error {
                       print("Failed to create a Firebase User with Google account: ", err)
                       return
                   }

//                   guard let uid = user?.uid else { return }
                   print("Successfully logged into Firebase with Google"
               )
           }
    

)}
 
    static func showAlertMsg(withViewController vc: UIViewController, message: String) {
          let alert = UIAlertController(title: "Message", message: message, preferredStyle: .alert)
          let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
          alert.addAction(okAction)
          vc.present(alert, animated: true, completion: nil)
      }
    
      func setRootViewControllerWith(viewIdentifier: String) {
          let vc = UIViewController.getViewControllerWith(viewControllerIdentifier: viewIdentifier)
          window?.rootViewController = vc
      }
}
