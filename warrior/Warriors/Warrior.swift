//
//  warriorclass.swift
//  warrior
//
//  Created by Saddam Satouyev on 06/01/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//

import Foundation


class Warrior {
    let id: Int
    let name: String

    let healthPointsMax: Int
    var healthPointsCurrent: Int

    var attackPoints: Int
    
    var isAlive: Bool {
        healthPointsCurrent > 0
    }

    init(id: Int, name: String, healthPointsMax: Int,attackPoints: Int) {
        self.id = id
        self.name = name
        self.healthPointsMax = healthPointsMax
        self.healthPointsCurrent = healthPointsMax
        self.attackPoints = attackPoints
    }

}


