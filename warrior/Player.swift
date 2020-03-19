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
    let id: Int
    
    init(id: Int) {
        self.id = id
    }

    
    let numberOfWarriorPerTeam = 3
    
    var warriors: [Warrior] = []
    
    var isStillInGame: Bool {
        for warrior in warriors {
            if warrior.isAlive {
                return true
            }
        }
        
        return false
    }
    /// dans la func createWarriors on voit d'abord un print vide qui permet de faire un retour à la ligne,apres un print qui va afficher le message: Player x (le id va afficher numerau atribuer au player) c'est toi de choisir tes guerriers, et encore un print vide pour retour a la ligne.   Apres on retrouve une boucle for dans quelle on va creer warriorId et dedans on boucle de 1 jusque a numberOfWarriorPerTeam ( c'est a dire 3 car numberOfWarriorPerTeam et une constante qu'on a definie plus haut avec INT 3) et chaque tour de boucle il va afficher : svp entrer le nom de votre warrior 1,2,3. (d'apres ce que j'ai compris warriorId et similaire a index qui recupere le nombre de tour de boucle) et aussi chaque tour de boucle il va exicuter createWarrior(id: warriorId) qui veut dire creer le warrior, le id: warriorId veut dire que id possede les valeur de warriorId c'est a dire 1,2,3, et pour finir on retrouve describeWarriors() permet d'afficher description des warriors
    func createWarriors() {
        print()
        print("Player \(id) it is your turn to pick your warriors !")
        print()
    
        for warriorId in 1...numberOfWarriorPerTeam {
            print("Please enter the name of your warrior \(warriorId)")
            createWarrior(id: warriorId)
        }
        
    }
    /// dans la function createWarrior on voit d'abord le parametre id qui permet d'avoir un id warrior grace a warriorId de la function precedente, apres on voit une constante warriorName qui a pour valeur getTerminalEntry() qui permet de entrer le name de warrior a chaque appel, apres on voit une variable warriorSelected qui a pour type la classe Warrior? qui permet de recuperer les warrior de ces sous classe c'est a dire plus bas selon le index indiquer il va passer par classe Warrior et ensuite ces sous classe, apres on retrouve un type de boucle repeat qui contient 2 print avec indication de chaque index relier a des warriors, apres on retrouve une constante warriorTypeIndex qui pour but de recuperer un numero pour index, et apres on retrouve warriorSelected qui contient getWarriorAccordingToTypeIndex et qui va nous donner selon le index saisi le warrior correspondant,
    private func createWarrior(id: Int) {
        let warriorName = getTerminalEntry()
        
        var warriorSelected: Warrior? = nil
        
        repeat {
            print()
            print("Select a class for your warrior by entering the corresponding integer (1-5):")
            print("⚔️(1)Knight⚔️,🏹(2)Archer🏹,👽(3)Hobbit👽,🐎(4)Cavalier🐎,🐺(5)Werewolf🐺")
            let warriorTypeIndex = getTerminalEntry()
            warriorSelected = getWarriorAccordingToTypeIndex(index: warriorTypeIndex, id: id, warriorName: warriorName)
        } while warriorSelected == nil
        
        guard let warrior = warriorSelected else {
            return
        }
        
        warriors.append(warrior)
    }
    
    /// On a une function getWarriorAccordingToTypeIndex qui pour parametre index id et warriorName et qui va nous retourner un type de warrior, comme on a vue dans la function precedente index et lier a warriorTypeIndex c'est a dire dans la function precedente index a pour  warriorTypeIndex, et warriorName qui est lier a name le string que on va saisir dans la constant warriorName sera atribuer a name aussi, apres on voit un switch pour parametre index et qui a 6 cas pour chaque cas c'est des warriors differente  et un message d'erreur dans le default,
    private func getWarriorAccordingToTypeIndex(index: String, id: Int, warriorName: String) -> Warrior? {
        switch index {
        case "1":
            return Knight(id: id, name: warriorName)
        case "2":
            return Archer(id: id, name: warriorName)
        case "3":
            return Hobbit(id: id, name: warriorName)
        case "4":
            return Cavalier(id: id, name: warriorName)
        case "5":
            return Werewolf(id: id, name: warriorName)
        default:
            print("Error: input was not between 1 and 5, try again")
            return nil
            // TODO: Devrais demander à nouveau de rentrer un nomnbre puisque le nombre est invalide
        }
    }
    /// on a une function getTerminalEntry()  sans parametre qui devra nous retourner une string, dans la function on va guard let inputString qui est egale a readLine, alros d'apres ce que j'ai compris guard va verifier si inputString et vide ou non si inputString n'est pas vie il va nous retourner getTerminalEntry() c'est a dire le texte indiquer dans le terminal mais si inputString est vide dans ce cas la il va pas exicuter le else et directement passer a return inputString c'est comme si c'etait une boucle.
    func getTerminalEntry() -> String {
        
        guard let inputString = readLine() else {
            return getTerminalEntry()
        }
        
        return inputString
    }
    
    /// alors on a la function describeWarriors sans parametre qui contient une boucle warrior dans la classe warriorss qui va afficher grace type of qui va chercher des donees dans warrior =  warriors et les print
    func describeWarriors() {
        for warrior in warriors {
            print("\(warrior.id) \(type(of: warrior)) \(warrior.name) HP \(warrior.healthPointsCurrent)/\(warrior.healthPointsMax)")
        }
    }
    
    /// Se
    
    
    private func performAttack(opponent: Player, warriorMakingAction: Warrior) {
        print("Choissisez le guerrier adverse que vous voudriez attaquer")
        print()
        let victimWarrior = pickWarrior(from: opponent)
        print("Le guerrier subissant Vous avez choisi \(victimWarrior.name)")
        warriorMakingAction.attack(victimWarrior: victimWarrior)
    }
    
    private func performHeal(warriorMakingAction: Warrior) {
        print()
        print("Choissisez le guerrier adverse que vous voudriez attaquer")
        print()
        let healedWarrior = pickWarrior(from: self)
        print("Le guerrier étant soigné Vous avez choisi \(healedWarrior.name)")
        warriorMakingAction.heal(warrior: healedWarrior)
    }
    
    enum WarriorAction {
        case Attack, Heal
    }
    
    private func askPlayerWarriorAction() -> WarriorAction {
        print("Choisissez une action")
         print("1. Attack")
         print("2. Soigner")
         
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

    func playTurn(opponent: Player) {
        
        let warriorMakingAction = pickWarrior(from: self)
        let warriorAction = askPlayerWarriorAction()

        
        switch warriorAction {
        case .Attack: performAttack(opponent: opponent, warriorMakingAction: warriorMakingAction)
        case .Heal: performHeal(warriorMakingAction: warriorMakingAction)
        }

        

//        warriorMakingAction.attack(warrior: victimWarrior)
        
        
        // CHoisi un guerrier
        
        // En fonction du type (is) de guerrier perform une attack (guerrier lambda) ou un soin (mage)
        
        // Si c'est une attaque il faut choisir un guerrier de l'autre équipe (faire passer l'autre équipe en paramètre)
        
        // Si c'est un soin il faut choisir un autre guerrier de sa propre équipe
        
    }

    func pickWarrior(from opponent: Player) -> Warrior {
        
        
        
        var pickedWarrior: Warrior?
        
        while pickedWarrior == nil {
            print()
            print("Player\(id) Choisi ton gurrier  d'attaque entre 1 et 3")
            print()
            opponent.describeWarriors()
            
            pickedWarrior = askPlayerToChooseWarrior(from: opponent.warriors)

            
        }
        
        return pickedWarrior!
        
        //        return warrior!
        // Print instruction
        
        // readline => déballer =>> convertir en Int(input) => déballer => vérifier que c'est biene ntre 1 et 3 => renvoyer guerrier en utilisant l'inoput en tant qu'index return warriors[input]
        
    }
    
    
    func askPlayerToChooseWarrior(from warriors: [Warrior]) -> Warrior? {

        guard let inputString = readLine() else {
            print("Erreur de liason avec terminal")
            return nil
        }
        
        guard let inputChoix = Int(inputString) else {
            print("Entrer un numero")
            return nil
        }
        
        guard inputChoix >= 1 && inputChoix <= 3 else {
            print("SVP un nombre entre 1 et 3")
            return nil
        }
        
        let pickedWarrior = warriors[inputChoix - 1]
        
        guard pickedWarrior.isAlive else {
            print("☠️ Veuillez choisir un guerrier vivant ")
            return nil
        }
        
        return pickedWarrior
    }
    
    
}
