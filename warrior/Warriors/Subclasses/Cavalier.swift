//
//  Cavalier.swift
//  warrior
//
//  Created by Saddam Satouyev on 21/01/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//

import Foundation

class Cavalier: Warrior {
    
    init(id: Int, name: String) {
        super.init(id: id, name: name, healthPointsMax: 250, baseAttackPoints: 20, magicPoints: 20, weapon: Spear())
    }
}
