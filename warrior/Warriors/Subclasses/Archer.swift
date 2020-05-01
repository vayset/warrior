//
//  Archer.swift
//  warrior
//
//  Created by Saddam Satouyev on 21/01/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//

import Foundation

class Archer: Warrior {
    
    override var descriptionString: String {  "🏹 Archer 🏹" }
    
    init(id: Int, name: String) {
        super.init(id: id, name: name, healthPointsMax: 90, baseAttackPoints: 20, magicPoints: 10, weapon: Bow())
    }
}
