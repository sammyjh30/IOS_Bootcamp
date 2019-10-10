//
//  DataModel.swift
//  DeathNote
//
//  Created by Samantha HILLEBRAND on 2019/10/10.
//  Copyright © 2019 Samantha HILLEBRAND. All rights reserved.
//

import UIKit

class DataModel {
    var deathName: String?
    var deathDate: String?
    var deathDescription: String?
    
    init(deathName: String?, deathDate: String?, deathDescription: String?) {
        self.deathName = deathName
        self.deathDate = deathDate
        self.deathDescription = deathDescription
    }
}
