//
//  warriorclass.swift
//  warrior
//
//  Created by Saddam Satouyev on 06/01/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//

import Foundation


class Warrior {
    
    // MARK: Static
    
    static let selectableWarriors: [Warrior] = [
        Mage(id: 1, name: ""),
        Knight(id: 2, name: ""),
        Archer(id: 3, name: ""),
        Hobbit(id: 4, name: ""),
        Cavalier(id: 5, name: ""),
        Werewolf(id: 6, name: "")
    ]
    // MARK: Init
    
    /// Initialization of properties
    init(id: Int, name: String, healthPointsMax: Int, baseAttackPoints: Int, magicPoints: Int, weapon: Weapon) {
        self.id = id
        self.name = name
        self.healthPointsMax = healthPointsMax
        self.healthPointsCurrent = healthPointsMax
        self.magicPoints = magicPoints
        self.weapon = weapon
        self.baseAttackPoints = baseAttackPoints
    }
    
    // MARK: - Internal
    
    // MARK: Properties - Internal
    
    let name: String
    let healthPointsMax: Int
    var healthPointsCurrent: Int
    let id: Int
    var descriptionString: String { "warrior" }
    
    /// A computed properties which adds damage from basic attack and weapon attack
     var attackPoints: Int {
        weapon.attackPointsBonus + baseAttackPoints
    }
    
    /// A computed properties who tell us if the warriors and alive
    var isAlive: Bool {
        healthPointsCurrent > 0
    }
    
    // MARK: Methods - Internal
    
    /// Method for attacking opponents
    func attack(victimWarrior: Warrior) {
        print("The warrior \(name) attack \(victimWarrior.name)")
        let randomBonusNumber = Int.random(in: 1...2)
        
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
            askIfWantToOpenChest(warrior: self, chestIsBonus: isBonus)
        }
        
        victimWarrior.healthPointsCurrent -= attackPoints
        
        if victimWarrior.healthPointsCurrent < 0 {
            victimWarrior.healthPointsCurrent = 0
        }
        print()
        print("❤️❤️❤️ The victim's life points are now \(victimWarrior.healthPointsCurrent) HP ❤️❤️❤️")
        print()
    }
    
    /// methode Heal
    func heal(warrior: Warrior) {
        warrior.healthPointsCurrent += magicPoints
        
        if warrior.healthPointsCurrent > warrior.healthPointsMax {
            warrior.healthPointsCurrent = warrior.healthPointsMax
        }
    }
    
    func describe() {
        print("\(id) \(descriptionString) \(name) ❤️ HP \(healthPointsCurrent)/\(healthPointsMax) 🗡 AP \(attackPoints) 🩸 MP \(magicPoints)")
    }
    
    // MARK: - Private
    
    // MARK: Properties - Private
    
    private var weapon: Weapon
    private var magicPoints: Int
    private var baseAttackPoints: Int

    
    // MARK: Methods - Private
    
    /// Method interact with user and retrieve input
    private func input() -> Int {
        guard let inputLine = readLine() else {
            print("Terminal link error")
            return input()
        }
        guard let inputInt = Int(inputLine) else {
            print("Enter number please")
            return input()
        }
        guard inputInt < 3 else {
            print("A number between 1 and 3 please")
            return input()
        }
        return inputInt
    }
    
    /// Method which will ask if the user wants to open the bonus chest
    private func askIfWantToOpenChest(warrior: Warrior, chestIsBonus: Bool) {
        
        let shouldOpenChestInput = input()
        let randomNumber = Int.random(in: 10...20)
        
        switch shouldOpenChestInput {
            
        case 1:
            if chestIsBonus {
                
                warrior.weapon = Weapon(weaponDammage: warrior.weapon.attackPointsBonus + randomNumber)
                print()
                print("Congratulations it's a bonus !  👍")
                print()
                print("You have \(randomNumber) attack points additional 🎉")
            } else {
                warrior.weapon = Weapon(weaponDammage: warrior.weapon.attackPointsBonus - randomNumber)
                print()
                print("It's a penalty ! Sorry 🙁")
                print()
                print("You have \(randomNumber) attack points less 😢")
            }
        case 2:
            warrior.healthPointsCurrent -= attackPoints
        default: return
        }
        
        
    }
    
    
}


