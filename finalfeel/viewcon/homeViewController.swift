//
//  homeViewController.swift
//  finalfeel
//
//  Created by Mabear on 19/3/2563 BE.
//  Copyright © 2563 Mabear. All rights reserved.
//

import UIKit
import JTAppleCalendar

class homeViewController: UIViewController {

    let formatter = DateFormatter()
    @IBOutlet weak var mood: UIButton!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var blog: UIButton!
    @IBOutlet weak var setting: UIButton!
    @IBOutlet weak var phycho: UIButton!
    @IBOutlet weak var more: UIButton!
    
    var moodButtonCenter: CGPoint!
    var blogButtonCenter: CGPoint!
    var settingButtonCenter: CGPoint!
    var phychoButtonCenter: CGPoint!
    

    
    @IBOutlet weak var date: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getCurrentDateTime()
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
//
//    func toggleButton(button:UIButton, onImage:UIImage, offImage:UIImage){
//        if button.currentImage == offImage{
//            button.setImage(onImage, for: UIControl.State.normal)
//        } else{
//            button.setImage(offImage, for: UIControl.State.normal)
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//    func configureCell(view: JTAppleCell?, cellState: CellState) {
//          guard let myCustomCell = view as? customCell  else { return }
//          
//      }
   
}

    
//    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
//
//    }

//    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
//        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CustomCell", for: indexPath) as! customCell
//        cell.datelabel.text = cellState.text
//        return cell
//    }
//
//    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
//     formatter.dateFormat = "yyyy MM dd"
//        formatter.timeZone = Calendar.current.timeZone
//        formatter.locale = Calendar.current.locale
//
//
//        let startDate = formatter.date(from: "2020 01 01")!
//        let endDate = formatter.date(from: "2020 12 31")!
//
////        formatter.dateFormat = "yyyy-MM-dd"
////
////        let startDate = formatter.date(from:2020-01-01)
////        let endDate = formatter.date(from: 2020-12-31)!
//
//
//        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
//        return parameters
//    }
//
//
//}
