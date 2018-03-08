//
//  appListTableViewCell.swift
//  ArthurFloresApp
//
//  Created by Arturo Flores on 08/03/18.
//  Copyright © 2018 ArthurFlores. All rights reserved.
//

import UIKit

class appListTableViewCell: UITableViewCell {

    @IBOutlet var iconAppImageView: UIImageView!
    @IBOutlet var nameApp: UILabel!
    @IBOutlet var descriptionApp: UILabel!
    @IBOutlet var retosLabel: UILabel!
    @IBOutlet var linkLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
