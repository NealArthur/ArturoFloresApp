//
//  ManageAchiveObject.swift
//  ArthurFloresApp
//
//  Created by Arturo Flores on 08/03/18.
//  Copyright © 2018 ArthurFlores. All rights reserved.
//

import UIKit
import CoreData
class ManageAchiveObject: NSObject {
    var achievementPropertie:String = ""
    var descriptionPropertie:String = ""
    
    func addNewAchievement(achievement: String, achievementDescription: String)  {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
       
        let entity = NSEntityDescription.entity(forEntityName: "Achievement", in: context)
        let newAchievement = NSManagedObject(entity: entity!, insertInto: context)
        newAchievement.setValue(achievement, forKey: "typeAchievement")
        newAchievement.setValue(achievementDescription, forKey: "descriptionAchievement")
        
        do {
            try context.save()
        } catch {
            print("Failed saving")
        }
        
    }
    
    func getAllAchievements() -> NSArray {
        let array:NSMutableArray? = []
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Achievement")
        request.predicate = NSPredicate(format: "typeAchievement != null")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                achievementPropertie = data.value(forKey: "typeAchievement") as! String
                descriptionPropertie = data.value(forKey: "descriptionAchievement") as! String
                let dictionary:Dictionary = ["achievementPropertie":achievementPropertie, "descriptionPropertie":descriptionPropertie]
                array?.add(dictionary)
                print(array as Any)
            }
            
        } catch {
            
            print("Failed")
        }
        return array?.copy() as! NSArray
    }
}
