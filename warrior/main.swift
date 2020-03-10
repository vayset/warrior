//
//  main.swift
//  warrior
//
//  Created by Saddam Satouyev on 06/01/2020.
//  Copyright © 2020 Saddam Satouyev. All rights reserved.
//

import Foundation

//1. Mettre en place le jeu
// en demandant à chaque (boucle for)
// joueur (class Player) => Tableau de joueur [Player]
// de créer (player.createWarriors())
// les guerriers ([Warrior]  de son équipe .
// Le joueur (Player) devra créer  chaque personnage (createWarrior)
// un nom (warrior.name)
// différent de tous les autres personnages déjà créés dans le jeu (checkNameValidity(name: String, warriors: [warriors])).


let gameManager = GameManager()
gameManager.startGame()

