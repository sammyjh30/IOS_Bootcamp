//
//  TableViewCell.swift
//  DeathNote
//
//  Created by Samantha HILLEBRAND on 2019/10/10.
//  Copyright © 2019 Samantha HILLEBRAND. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var deathName: UILabel!
    @IBOutlet weak var deathDate: UILabel!
    @IBOutlet weak var deathDescription: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
