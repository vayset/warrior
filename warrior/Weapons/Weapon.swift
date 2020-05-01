//
//  Weapon.swift
//  warrior
//
//  Created by Saddam Satouyev on 16/04/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//

import Foundation

class Weapon {
    
    // MARK: - Internal
    
    // MARK: Properties - Internal
    
    var attackPointsBonus: Int
    /// Initialization of properties
    init(weaponDammage: Int) {
        self.attackPointsBonus = weaponDammage
    }
    
}
