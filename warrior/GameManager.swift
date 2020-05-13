//
//  gamemanager.swift
//  warrior
//
//  Created by Saddam Satouyev on 10/01/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//

import Foundation


class GameManager {
    
    // MARK: - Internal API
    
    // MARK: Methods - Internal
    
    /// The startGame function contains 4 other functions as soon as we start automatically startGame it will apply the 4 classes it contains
    func startGame() {
        printWelcomeInstructions()
        createPlayers()
        startTeamCreationPhase()
        startFightPhase()
        handleEndGame()
    }
    
    // MARK: - Private
    
    // MARK: Properties - Private
    
    /// Property that contains number of players
    private let numberOfPlayer = 2
    
    /// Property that contains turn counter
    private var turnCounter = 0
    
    /// A array containing the players
    private var players: [Player] = []
    
    /// a computed properties to define if the game is finished
    private var isGameOver: Bool {
        var numberOfPlayersInGame = 0
        
        for player in players {
            if player.isStillInGame {
                numberOfPlayersInGame += 1
            }
        }
        
        return numberOfPlayersInGame == 1
    }
    
    /// computed properties to recover the winner
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
    
    
    // MARK: Methods - Private
    
    /// Method for printing welcome instructions
    private func printWelcomeInstructions() {
        print("===🗡 RPG Warrior 🗡===")
        print()
        print("Welcome dear players")
        print()
        print("LET THE GAME BEGIN")
        
    }
    
    /// Method for creating players
    private func createPlayers() {
        
        for playerId in 1...numberOfPlayer {
            createPlayer(id: playerId)
        }
        
    }
    
    /// Method for adding the player to the players table by assigning it an identifier
    private func createPlayer(id: Int) {
        let player = Player(id: id)
        players.append(player)
    }
    
    private func startTeamCreationPhase() {
        for player in players {
            player.createWarriors(players: players)
        }
    }
    
    /// Method to start the combat phase
    private func startFightPhase() {
        printFightPhaseBeginInstructions()

        while !isGameOver {
            turnCounter += 1
            
            for player in players {
                guard let opponent = getOpponentFrom(player: player) else { return }
                player.playTurn(opponent: opponent)
                if isGameOver {
                    break
                }
            }
        }
    }
    
    /// Method for printing fight phase instructions
    private func printFightPhaseBeginInstructions() {
        print("===🗡 FIGHT PHASE 🗡===")
        print()
        print("Now that you've picked your team...")
        print()
        print("LET THE FIGHT BEGIN")
    }
    
    /// Method for defining an opponent
    private func getOpponentFrom(player: Player) -> Player? {
        for playerInList in players {
            if player.id != playerInList.id {
                return playerInList
            }
        }
        
        return nil
    }
    
    /// Method for defining the end of the game
    private func handleEndGame() {
        // TODO: Print stats and winner
        
        if let winner = winner {
            for player in players {
                print(player.playerDescription)
                player.describeWarriors()
                print()
            }
            print("🎉🎉🎉 The winner is player \(winner.playerDescription) 🎉🎉🎉")
            print()
        }
        print("Number of turns: \(turnCounter)")
        print()
    }
}
