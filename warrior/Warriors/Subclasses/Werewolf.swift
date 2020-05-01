//
//  Werewolf.swift
//  warrior
//
//  Created by Saddam Satouyev on 21/01/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//

import Foundation

class Werewolf: Warrior {
    
    override var descriptionString: String {  "🐺 Werewolf 🐺" }
    
    init(id: Int, name: String) {
        super.init(id: id, name: name, healthPointsMax: 120, baseAttackPoints: 30, magicPoints: 30, weapon: Mace())
    }
    
    
}
