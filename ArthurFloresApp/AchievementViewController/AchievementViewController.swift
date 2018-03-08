//
//  AchievementViewController.swift
//  ArthurFloresApp
//
//  Created by Arturo Flores on 08/03/18.
//  Copyright © 2018 ArthurFlores. All rights reserved.
//

import UIKit
import UserNotifications
class AchievementViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    

    @IBOutlet var goalsDoneTableView: UITableView!
    var typeAchievement:String = ""
    var descriptionAchievement:String = ""
    var achievementsArray:Array<Any>?
    override func viewDidLoad() {
        super.viewDidLoad()
        achievementsArray = (ManageAchiveObject.init().getAllAchievements() as! Array)
        print(achievementsArray!)
        goalsDoneTableView.delegate = self
        goalsDoneTableView.dataSource = self
        goalsDoneTableView.register(UINib(nibName: "AchievementTableViewCell", bundle: nil), forCellReuseIdentifier: "achiveId")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Agregar logro", style: .plain, target: self, action: #selector(addAchievement))


    }

    @objc func addAchievement()  {
        var typeAchievementTextField: UITextField?
        var descriptionAchievementTextField: UITextField?
        
        let alertToGetValues = UIAlertController(title: "Introduce el tipo de logro y a continuación la descripción de este", message: "El tipo de logro puede ser: trabajo, logro, éxito, etc.", preferredStyle: .alert)
        
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            
            
            if typeAchievementTextField!.text != nil {
                if typeAchievementTextField?.text != "" && descriptionAchievementTextField?.text != ""{
                    self.typeAchievement = (typeAchievementTextField?.text)!
                    self.descriptionAchievement = (descriptionAchievementTextField?.text)!
                    

                    ManageAchiveObject.init().addNewAchievement(achievement: self.typeAchievement, achievementDescription: self.descriptionAchievement)
                    
                }
                let content = UNMutableNotificationContent()
                let requestIdentifier = "rajanNotification"
                
                content.badge = 1
                content.title = "This is a rich notification"
                content.subtitle = "Hello there, I am Rajan Maheshwari"
                content.body = "Hello body"
                content.categoryIdentifier = "actionCategory"
                content.sound = UNNotificationSound.default()
                
                
                let trigger = UNTimeIntervalNotificationTrigger.init(timeInterval: 3.0, repeats: false)
                
                let request = UNNotificationRequest(identifier: requestIdentifier, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request) { (error:Error?) in
                    
                    if error != nil {
                        print(error?.localizedDescription)
                    }
                    print("Notification Register Success")
                }
            }
        })
        
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            
        }
        
        
        alertToGetValues.addAction(ok)
        alertToGetValues.addAction(cancel)
        
        
        alertToGetValues.addTextField { (textField) -> Void in
            
            typeAchievementTextField = textField
            typeAchievementTextField?.placeholder = "Introduce el tipo de logro"
        }
        
        alertToGetValues.addTextField { (textField) -> Void in
            
            descriptionAchievementTextField = textField
            descriptionAchievementTextField?.placeholder = "Introduce la descripción"
        }
        
        
        
        self.present(alertToGetValues, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return achievementsArray!.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = goalsDoneTableView.dequeueReusableCell(withIdentifier: "achiveId", for: indexPath) as! AchievementTableViewCell
        
        let dic:NSDictionary = achievementsArray![indexPath.row] as! NSDictionary
        
        
        cell.typeLabel.text = dic.value(forKey: "achievementPropertie") as! String
        cell.descriptionLabel.text = dic.value(forKey:"descriptionPropertie") as! String
        
        
        return cell
    }

}

extension ViewController: UNUserNotificationCenterDelegate {
    
    //for displaying notification when app is in foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //If you don't want to show notification when app is open, do something here else and make a return here.
        //Even you you don't implement this delegate method, you will not see the notification on the specified controller. So, you have to implement this delegate and make sure the below line execute. i.e. completionHandler.
        
        completionHandler([.alert, .badge, .sound])
    }
    
    // For handling tap and user actions
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        switch response.actionIdentifier {
        case "action1":
            print("Action First Tapped")
        case "action2":
            print("Action Second Tapped")
        default:
            break
        }
        completionHandler()
}

}
