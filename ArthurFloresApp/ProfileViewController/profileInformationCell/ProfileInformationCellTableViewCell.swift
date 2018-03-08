//
//  ProfileInformationCellTableViewCell.swift
//  ArthurFloresApp
//
//  Created by Arturo Flores on 07/03/18.
//  Copyright © 2018 ArthurFlores. All rights reserved.
//

import UIKit

class ProfileInformationCellTableViewCell: UITableViewCell {


    @IBOutlet weak var titleTxtLabel: UILabel!
    
    @IBOutlet weak var infoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
