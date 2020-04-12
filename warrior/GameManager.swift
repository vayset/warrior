//
//  gamemanager.swift
//  warrior
//
//  Created by Saddam Satouyev on 10/01/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//

import Foundation


class GameManager {
    /// la function startGame contient 4 autre function des que on va appler startGame auto elle va appler les 4 classe qu'elle contient
    func startGame() {
        createPlayers()
        startTeamCreationPhase()
        startFightPhase()
        handleEndGame()
    }
    
    
    private let numberOfPlayer = 2
    
    private var turnCounter = 0
    

    private var players: [Player] = []
    
    private var isGameOver: Bool {
        var numberOfPlayersInGame = 0
        
        for player in players {
            if player.isStillInGame {
                numberOfPlayersInGame += 1
            }
        }
        
        return numberOfPlayersInGame == 1
    }
    
    private var winner: Player? {
        if isGameOver {
            for player in players {
                if player.isStillInGame {
                    return player
                }
            }
        }
        return nil
    }

    // Boucle for qui permet de créer autant de id que notre constante numberofplayer l'indique
    private func createPlayers() {
        for playerId in 1...numberOfPlayer {
            createPlayer(id: playerId)
        }
    }
    /// dans la function createPlayer on retrouve une constante  player qui contient la methode Player, et on retrouve la variable players qui dans son tableux player
    private func createPlayer(id: Int) {
        let player = Player(id: id)
        players.append(player)
    }
  
    private func startTeamCreationPhase() {
        for player in players {
            player.createWarriors()
        }
    }
    /// dans la function startFightPhase on vois une boucle while qui veut dire tant que is not  isGameOver bah le turnCounter va rajouter de 1 et aussi dans meme boucle while on voit un for qui pour mission de derouler de jeux et apres on retrouve une condition si isGameOver bah on quite la function
    private func startFightPhase() {
        while !isGameOver {
            turnCounter += 1
            
            for player in players {
                guard let opponent = getOpponentFrom(player: player) else { return }
                player.playTurn(opponent: opponent)
//                if isGameOver {
//                    break
//                }
            }
        }
    }
    
    private func getOpponentFrom(player: Player) -> Player? {
        for playerInList in players {
            if player.id != playerInList.id {
                return playerInList
            }
        }
        
        return nil
    }
    /// dans la function handleEndGame on afficher le winner, on creer une condition avec une constante qui aura une valeur winner, donc la function va verifier qui est encore en vie et print le message avec le gagnant et aussi le nombre de tour
    private func handleEndGame() {
        // TODO: Print stats and winner
        if let winner = winner {
            print("The winner is player \(winner.id)")
        }
        print("Nombre de tour \(turnCounter)")
    }
}
