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
    var weapon: Weapon
    var magicPoints: Int
    
    var baseAttackPoints: Int
    
    var attack: Int {
        weapon.attackPointsBonus + baseAttackPoints
    }
    
    var isAlive: Bool {
        healthPointsCurrent > 0
    }
    
    init(id: Int, name: String, healthPointsMax: Int, baseAttackPoints: Int, magicPoints: Int, weapon: Weapon) {
        self.id = id
        self.name = name
        self.healthPointsMax = healthPointsMax
        self.healthPointsCurrent = healthPointsMax
        self.magicPoints = magicPoints
        self.weapon = weapon
        self.baseAttackPoints = baseAttackPoints
    }
    
    func input() -> Int {
        guard let inputLine = readLine() else {
            print("Problème de liason avec terminal")
            return input()
        }
        guard let inputInt = Int(inputLine) else {
            print("Veuillez insérer un chiffre")
            return input()
        }
        guard inputInt < 3 else {
            print("Veuillez selectioner entre 1 et 2")
            return input()
        }
        return inputInt
    }
    

    
    func askIfWantToOpenChest(warrior: Warrior, chestIsBonus: Bool) {
        
        let shouldOpenChestInput = input()
        
        switch shouldOpenChestInput {
            
        case 1:
            if chestIsBonus {
                
                //warrior.weapon = Weapon(weaponDammage: warrior.weapon.attackPointsBonus + Int.random(in: 10...20))
                // ENLEVER LA LIGNE DAPRES et attribuer une nouvelle arme à la place au guerier
                warrior.healthPointsCurrent -= attack + Int.random(in: 10...20)
                print()
                print("Congratulations it's a bonus !  👍")
            } else {
                
                //warrior.weapon = Weapon(weaponDammage: warrior.weapon.attackPointsBonus - Int.random(in: 10...20))
                // SAME HERE
                warrior.healthPointsCurrent -= attack - Int.random(in: 10...20)
                print()
                print("It's a penalty ! Sorry 🙁")
            }
            
            
        case 2:
            warrior.healthPointsCurrent -= attack
        default: return
        }
        
        
    }
    
    
    func attack(victimWarrior: Warrior) {
        print("Le guerrier \(name) attaque \(victimWarrior.name)")
        let randomBonusNumber = Int.random(in: 1...6)
        
        if randomBonusNumber <= 2 {
            print()
            print("🎉 Congratulations you found a mystery chest 🎉")
            print()
            print("Do you want to open it 🤔? Be aware that it can be a bonus as a penalty !")
            print()
            print("1: 🔐 Yes")
            print()
            print("2: 🔒 No")
            print()
            
            let isBonus = randomBonusNumber == 1
            askIfWantToOpenChest(warrior: victimWarrior, chestIsBonus: isBonus)
        
            
        }
        
        victimWarrior.healthPointsCurrent -= attack
        
        
        if victimWarrior.healthPointsCurrent < 0 {
            victimWarrior.healthPointsCurrent = 0
        }
        
        print("Les points de vies de la victime et désormais \(victimWarrior.healthPointsCurrent)")
        
    }
    
    
    func heal(warrior: Warrior) {
        warrior.healthPointsCurrent += magicPoints
    }
    
    
}


