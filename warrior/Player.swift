//
//  Player.swift
//  warrior
//
//  Created by Saddam Satouyev on 14/01/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//
//1. Mettre en place le jeu
// en demandant à chaque (boucle for)
// joueur (class Player) => Tableau de joueur [Player]
// de créer (player.createWarriors())
// les guerriers ([Warrior]  de son équipe .
// Le joueur (Player) devra créer  chaque personnage (createWarrior)
// un nom (warrior.name)
// différent de tous les autres personnages déjà créés dans le jeu (checkNameValidity(name: String, warriors: [warriors])).

import Foundation



class Player {
    
    // MARK: Enum
    
    enum WarriorAction {
        case Attack, Heal
    }
    
    // MARK: - Internal
    
    // MARK: Properties - Internal
    
    let id: Int
    /// Initialization of propertie
    init(id: Int) {
        self.id = id
    }
    
    /// computed properties to find out if the warrior is still in play
    
    var isStillInGame: Bool {
        for warrior in warriors {
            if warrior.isAlive {
                return true
            }
        }
        
        return false
    }
    
    // MARK: Methods - Internal
    
    /// Method for defining an identifier for warriors
    func createWarriors(players: [Player]) {
        print()
        print("\(playerDescription) it is your turn to pick your warriors !")
        print()
        
        for warriorId in 1...numberOfWarriorPerTeam {
            print("Please enter the name of your warrior \(warriorId)")
            createWarrior(id: warriorId, players: players )
        }
        
    }
    
    /// Method that manages player rounds
    func playTurn(opponent: Player) {

        
        print()
        print(" \(playerDescription) Choose your attack warrior between 1 and 3")
        print()
        let warriorMakingAction = pickWarrior(from: self)
        let warriorAction = askPlayerWarriorAction()
        
        switch warriorAction {
        case .Attack: performAttack(opponent: opponent, warriorMakingAction: warriorMakingAction)
        case .Heal: performHeal(warriorMakingAction: warriorMakingAction)
        }
        
    }
    
    // MARK: - Private
    
    // MARK: Properties - Private
    
    private let numberOfWarriorPerTeam = 3
    
    private var warriors: [Warrior] = []
    
    private var playerDescription: String {
        switch id {
        case 1: return "👨🏻‍✈️ Player 1️⃣"
        case 2: return "👨🏻‍🚀 Player 2️⃣"
        default: return "👨🏻‍✈️ Player \(id)"
        }
    }
    
    // MARK: Methods - Private
    
    
    /// Method for creating the warrior
    private func createWarrior(id: Int, players: [Player]) {
        
        
        let warriorName = getWarriorName(players: players)
        
        
        var warriorSelected: Warrior? = nil
        
        repeat {
            print()
            print("Select a class for your warrior by entering the corresponding integer (1-6):")
            print()
            
            for selectableWarrior in Warrior.selectableWarriors {
                selectableWarrior.describe()
            }
            
            let warriorTypeIndex = getTerminalEntry()
            warriorSelected = getWarriorAccordingToTypeIndex(index: warriorTypeIndex, id: id, warriorName: warriorName)
        } while warriorSelected == nil
        
        guard let warrior = warriorSelected else {
            return
        }
        
        warriors.append(warrior)
    }
    
    /// Method for selecting a warrior with an idex
    private func getWarriorAccordingToTypeIndex(index: String, id: Int, warriorName: String) -> Warrior? {
        switch index {
        case "1":
            return Mage(id: id, name: warriorName)
        case "2":
            return Knight(id: id, name: warriorName)
        case "3":
            return Archer(id: id, name: warriorName)
        case "4":
            return Hobbit(id: id, name: warriorName)
        case "5":
            return Cavalier(id: id, name: warriorName)
        case "6":
            return Werewolf(id: id, name: warriorName)
        default:
            print("Error: input was not between 1 and 5, try again")
            return nil
            // TODO: Devrais demander à nouveau de rentrer un nomnbre puisque le nom
            
        }
    }
    /// Method to retrieve the character string enter the terminal
    private func getTerminalEntry() -> String {
        
        guard let inputString = readLine() else {
            print("Terminal error please try again")
            return getTerminalEntry()
        }
        
        guard !inputString.trimmingCharacters(in: .whitespaces).isEmpty else {
            print("Empty input errror please try again")
            return getTerminalEntry()
        }
        
        return inputString
    }
    
    private func getWarriorName(players: [Player]) -> String {
        let warriorName = getTerminalEntry()
        for player in players {
            for warrior in player.warriors {
                if warriorName.lowercased() == warrior.name.lowercased() {
                    print("Name is already used please pick another one")
                    return getWarriorName(players: players)
                }
            }
            
        }
        
        return warriorName
    }
    
    /// Method for retrieving characteristics of warriors
    private func describeWarriors() {
        for warrior in warriors {
            print("\(warrior.id)   \(warrior.descriptionString) \(warrior.name) HP \(warrior.healthPointsCurrent)/\(warrior.healthPointsMax)")
        }
    }
    
    /// Method for attacking an opponent
    
    private func performAttack(opponent: Player, warriorMakingAction: Warrior) {
        print()
        print("Choose the opposing warrior you would like to attack")
        print()
        let victimWarrior = pickWarrior(from: opponent)
        print("You chose \(victimWarrior.name) as a warrior victim")
        warriorMakingAction.attack(victimWarrior: victimWarrior)
    }
    
    /// Method for heal
    private func performHeal(warriorMakingAction: Warrior) {
        print()
        print("Choose the warrior on your team you would like to heal")
        print()
        let healedWarrior = pickWarrior(from: self)
        print("You heal \(healedWarrior.name)")
        warriorMakingAction.heal(warrior: healedWarrior)
    }
    
    
    /// Method for asking the user to choose an action
    private func askPlayerWarriorAction() -> WarriorAction {
        print()
        print("Choose an action")
        print("1. Attack")
        print("2. Heal")
        print()
        while true {
            
            if let choiceInput = readLine() {
                switch choiceInput {
                case "1": return .Attack
                    
                case "2": return .Heal
                    
                default: print("Error please enter a number between 1 and 2")
                }
                
            }
        }
    }
    
    /// Method for choosing a warrior
    private func pickWarrior(from opponent: Player) -> Warrior {
        
        var pickedWarrior: Warrior?
        
        while pickedWarrior == nil {
            opponent.describeWarriors()
            pickedWarrior = askPlayerToChooseWarrior(from: opponent.warriors)
        }
        
        return pickedWarrior!
        
    }
    
    /// Method for retrieving the user choice entered in the terminal
    private func askPlayerToChooseWarrior(from warriors: [Warrior]) -> Warrior? {
        
        guard let inputString = readLine() else {
            print("Terminal link error")
            return nil
        }
        
        guard let inputChoix = Int(inputString) else {
            print("Enter number please")
            return nil
        }
        
        guard inputChoix >= 1 && inputChoix <= 3 else {
            print("A number between 1 and 3 please")
            return nil
        }
        
        let pickedWarrior = warriors[inputChoix - 1]
        
        guard pickedWarrior.isAlive else {
            print("☠️ Please choose a living warrior ☠️")
            return nil
        }
        
        return pickedWarrior
    }
    
    
}
