//
//  ListTableViewCell.swift
//  TaskDaysMatter
//
//  Created by Yuan REN on 2017/5/16.
//  Copyright © 2017年 Yuan REN. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var listNameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
