//
//  AppListViewController.swift
//  ArthurFloresApp
//
//  Created by Arturo Flores on 08/03/18.
//  Copyright © 2018 ArthurFlores. All rights reserved.
//

import UIKit

class AppListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  

    @IBOutlet var appListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        appListTableView.delegate = self
        appListTableView.dataSource = self
        appListTableView.register(UINib(nibName: "appListTableViewCell", bundle: nil), forCellReuseIdentifier: "AppCell")
    }

  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = appListTableView.dequeueReusableCell(withIdentifier: "AppCell", for: indexPath) as! appListTableViewCell
    
        cell.nameApp.text = "Xtender"
        cell.descriptionApp.text  = "mi primera aplicación"
        cell.retosLabel.text = "usar beacons"
        cell.linkLabel.text = "http://xtender.com.mx"
        return cell
    }
    
}
