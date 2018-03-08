//
//  ViewController.swift
//  ArthurFloresApp
//
//  Created by Arturo Flores on 07/03/18.
//  Copyright © 2018 ArthurFlores. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
  
    enum TimerState:Int {
        case galery = 0
        case map
        case infoLab
        case appList
    }
    

 
    
    
    //MARK: Outlets
    @IBOutlet weak var profileButton: UIButton!
    @IBOutlet weak var menuPickerView: UIPickerView!
    
    @IBOutlet weak var openSelectionButton: UIButton!
    
    // MARK: Data
    var pickerMenuItems:[String] = [String]()
    typealias SomeNewEnum = TimerState
    var selection:Int = 0
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Arturo Flores"
        self.navigationController?.navigationItem.title = "Arturo Flores"
        self.openSelectionButton.layer.cornerRadius = 5
        self.pickerMenuItems = ["Galería", "Mapa", "Información laboral", "Lista de Apps"]
        self.menuPickerView.delegate = self
        self.menuPickerView.dataSource = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    //MARK: PickerView Delegates
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerMenuItems.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerMenuItems[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case SomeNewEnum.galery.rawValue:
            self.selection = SomeNewEnum.galery.rawValue
        case SomeNewEnum.map.rawValue:
            self.selection = SomeNewEnum.map.rawValue
        case SomeNewEnum.infoLab.rawValue:
            self.selection = SomeNewEnum.infoLab.rawValue
        case SomeNewEnum.appList.rawValue:
            self.selection = SomeNewEnum.appList.rawValue
            
        default:
            print("nada")
        }
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let titleData = pickerMenuItems[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "_", size: 0)!,NSAttributedStringKey.foregroundColor:UIColor(red: 0, green: 128/255.0, blue: 255/255.0, alpha: 1.0)])
        
        return myTitle
    }
    
    
    @IBAction func openProfile(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileViewController
        
        navigationController?.pushViewController(vc,
                                                 animated: true)
    }
    
    
    @IBAction func openSelection(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        var identifier:String = ""
        var viewControllerType:UIViewController?

                switch self.selection {
                case SomeNewEnum.galery.rawValue:
                    identifier = "GalleryVC"
                    viewControllerType = GalleryViewController
                    break
                case SomeNewEnum.map.rawValue:
                    identifier = "MapVC"
                    viewControllerType = MapViewController
                    break
                case SomeNewEnum.infoLab.rawValue:
                    identifier = "AchievementVC"
                    viewControllerType = AchievementViewController
                    break
                case SomeNewEnum.appList.rawValue:
                    identifier = "AppListVC"
                    viewControllerType = AppListViewController
                    break
                default:
                    identifier = "AchievementVC"
                    viewControllerType = AchievementViewController
        
                }
        let vc = storyboard.instantiateViewController(withIdentifier: identifier) as! GalleryViewController//Se toma como opción default
        navigationController?.pushViewController(vc,
                                                 animated: true)
        
    }
    
    
}

