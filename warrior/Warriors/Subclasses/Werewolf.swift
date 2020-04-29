//
//  Werewolf.swift
//  warrior
//
//  Created by Saddam Satouyev on 21/01/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//

import Foundation

class Werewolf: Warrior {
    
    init(id: Int, name: String) {
        super.init(id: id, name: name, healthPointsMax: 220, baseAttackPoints: 30, magicPoints: 30, weapon: Mace())
    }
    
    
}
