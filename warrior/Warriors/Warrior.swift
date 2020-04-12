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
    var magicPoints: Int
    
    var isAlive: Bool {
        healthPointsCurrent > 0
    }

    init(id: Int, name: String, healthPointsMax: Int, attackPoints: Int, magicPoints: Int) {
        self.id = id
        self.name = name
        self.healthPointsMax = healthPointsMax
        self.healthPointsCurrent = healthPointsMax
        self.attackPoints = attackPoints
        self.magicPoints = magicPoints
    }
    
    func attack(victimWarrior: Warrior) {
        print("Le guerrier \(name) attaque \(victimWarrior.name)")
        print("Le nombre de dégât infligé est \(attackPoints)")
        
        victimWarrior.healthPointsCurrent -= attackPoints
        
        if victimWarrior.healthPointsCurrent < 0 {
            victimWarrior.healthPointsCurrent = 0
        }
    
        print("Les points de vies de la victime et désormais \(victimWarrior.healthPointsCurrent)")
    }
    
    func heal(warrior: Warrior) {
        warrior.healthPointsCurrent += magicPoints
    }
    

}


