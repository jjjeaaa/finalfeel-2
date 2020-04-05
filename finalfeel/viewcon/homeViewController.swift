//
//  homeViewController.swift
//  finalfeel
//
//  Created by Mabear on 19/3/2563 BE.
//  Copyright © 2563 Mabear. All rights reserved.
//

import UIKit
import Firebase
import FSCalendar

class homeViewController: UIViewController {

    let formatter = DateFormatter()
    @IBOutlet weak var mood: UIButton!
    @IBOutlet weak var blog: UIButton!
    @IBOutlet weak var setting: UIButton!
    @IBOutlet weak var phycho: UIButton!
    @IBOutlet weak var more: UIButton!
    
    private weak var calendar: FSCalendar!
    
    var moodButtonCenter: CGPoint!
    var blogButtonCenter: CGPoint!
    var settingButtonCenter: CGPoint!
    var phychoButtonCenter: CGPoint!
    

    @IBAction func signoutButton(_ sender: Any) {
        do {
                   try Auth.auth().signOut()
                   self.dismiss(animated: true, completion: nil)
                 } catch (let error) {
                   print("Authen sign out failed: \(error)")
                 }
    }
    
    @IBOutlet weak var date: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getCurrentDateTime()
        mycalendar()
               
             moodButtonCenter = mood.center
             blogButtonCenter = blog.center
             settingButtonCenter = setting.center
             phychoButtonCenter = phycho.center
             
             mood.center = more.center
             blog.center = more.center
             phycho.center = more.center
             setting.center = more.center
        
       
     
        // Do any additional setup after loading the view.
    }
    
    func mycalendar() {
      let calendar = FSCalendar(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
      calendar.dataSource = self
      calendar.delegate = self
      calendar.register(FSCalendarCell.self, forCellReuseIdentifier: "Cell")
      calendar.translatesAutoresizingMaskIntoConstraints = false
      

      view.addSubview(calendar)
        
      calendar.backgroundColor = UIColor.init(red: 236/255, green: 192/255, blue: 180/255, alpha: 1)
        calendar.appearance.titleFont = UIFont(name: "Chalkduster", size: 17.0)
        calendar.appearance.weekdayFont = UIFont(name: "Chalkduster", size: 17.0)
        calendar.appearance.headerTitleFont = UIFont(name: "Chalkduster", size: 20.0)
      calendar.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
      calendar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
      calendar.heightAnchor.constraint(equalToConstant: 300).isActive = true
      calendar.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
      
      self.calendar = calendar
    }
    func getCurrentDateTime(){
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let str = formatter.string(from: Date())
        date.text  = str
    }
    @IBAction func nearClicked(_ sender: UIButton) {
        if sender.currentImage == UIImage(named : "near_off"){
            sender.setImage(UIImage(named : "near_on"), for: UIControl.State.normal)
        }else{
              sender.setImage(UIImage(named : "near_off"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func moreClicked(_ sender: UIButton) {
        if more.currentImage == UIImage(named: "more_on"){
            UIView.animate(withDuration: 0.3, animations: {
                self.mood.alpha = 1
                self.blog.alpha = 1
                self.phycho.alpha = 1
                self.setting.alpha = 1
                
             self.mood.center = self.moodButtonCenter
                self.blog.center = self.blogButtonCenter
                    self.phycho.center = self.phychoButtonCenter
                    self.setting.center = self.settingButtonCenter
                
            })
        }else{
            UIView.animate(withDuration: 0.3, animations: {
                self.mood.alpha = 0
                self.blog.alpha = 0
                self.phycho.alpha = 0
                self.setting.alpha = 0
                
                self.mood.center = self.more.center
                self.blog.center = self.more.center
                 self.phycho.center = self.more.center
                 self.setting.center = self.more.center
            })
        }
        if sender.currentImage == UIImage(named : "more_off"){
            sender.setImage(UIImage(named : "more_on"), for: UIControl.State.normal)
        }else{
              sender.setImage(UIImage(named : "more_off"), for: UIControl.State.normal)
        }
    }
   
    
    @IBAction func phychoClicked(_ sender: UIButton) {
        if sender.currentImage == UIImage(named : "Psy_off"){
                   sender.setImage(UIImage(named : "Psy_on"), for: UIControl.State.normal)
               }else{
                     sender.setImage(UIImage(named : "Psy_off"), for: UIControl.State.normal)
               }
    }
    
    @IBAction func moodClicked(_ sender: UIButton) {
        if sender.currentImage == UIImage(named : "mood_off"){
            sender.setImage(UIImage(named : "mood_on"), for: UIControl.State.normal)
        }else{
              sender.setImage(UIImage(named : "mood_off"), for: UIControl.State.normal)
        }
    }
    
    @IBAction func blogClicked(_ sender: UIButton) {
        if sender.currentImage == UIImage(named : "blog_off"){
            sender.setImage(UIImage(named : "blog_on"), for: UIControl.State.normal)
        }else{
              sender.setImage(UIImage(named : "blog_off"), for: UIControl.State.normal)
        }
    }
    @IBAction func settingClicked(_ sender: UIButton) {
        if sender.currentImage == UIImage(named : "setting_off"){
            sender.setImage(UIImage(named : "setting_on"), for: UIControl.State.normal)
        }else{
              sender.setImage(UIImage(named : "setting_off"), for: UIControl.State.normal)
        }
    }

}
extension homeViewController: FSCalendarDelegate, FSCalendarDataSource{
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at position: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "Cell", for: date, at: position)
        return cell
    }
}
