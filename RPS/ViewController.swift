//
//  ViewController.swift
//  RPS
//
//  Created by Aluno24 on 25/02/22.
//  Copyright © 2022 Aluno24. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var appSign: UILabel!
    
    @IBOutlet weak var appStatus: UILabel!
    
    @IBOutlet weak var rockSign: UIButton!
    
    @IBOutlet weak var paperSign: UIButton!
    
    @IBOutlet weak var scissorsSign: UIButton!
    
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func rockChoice(_ sender: Any) {
        play(choice: "rock")
    }
    
    @IBAction func paperChoice(_ sender: Any) {
        play(choice: "paper")
        
    }
    
    @IBAction func scissorsChoice(_ sender: Any) {
        play(choice: "scissors")
    }
    
    @IBAction func playAgainChoice(_ sender: Any) {
        start()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        start()
    }
    
    func start() {
        appStatus.text = "START"
        appSign.text = "🤖"
        playAgain.isHidden = true
        
        rockSign.isHidden = false
        paperSign.isHidden = false
        scissorsSign.isHidden = false
        
        view.backgroundColor = .white
    }
    
    func play(choice: String) {
        let opponentMovement = randomSign()
        playAgain.isHidden = false
        
        var result: GameState
        
        if choice == "rock" {
            result = Sign.rock.opponentTurn(opponentMove: opponentMovement)
        }else if choice == "paper" {
            result = Sign.paper.opponentTurn(opponentMove: opponentMovement)
        }else {
            result = Sign.scissors.opponentTurn(opponentMove: opponentMovement)
            
        }
        
        if opponentMovement == .paper {
            appSign.text = "🖐"
        }else if opponentMovement == .rock {
            appSign.text = "👊"
        }else {
            appSign.text = "✌️"
        }
        
        if result == .win {
            view.backgroundColor = .green
        }else if result == .draw {
            view.backgroundColor = .yellow
        }else {
            view.backgroundColor = .red
        }
        
        appStatus.text = "\(result)".uppercased()
        
        rockSign.isHidden = true
        paperSign.isHidden = true
        scissorsSign.isHidden = true
    }
}
