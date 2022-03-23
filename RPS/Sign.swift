//
//  Sign.swift
//  RPS
//
//  Created by Aluno24 on 25/02/22.
//  Copyright © 2022 Aluno24. All rights reserved.
//

import Foundation

enum Sign {
    case rock
    case paper
    case scissors
    
    func opponentTurn(opponentMove: Sign) -> GameState {
        if self == .paper {
            if opponentMove == .paper {
                return .draw
            }else if opponentMove == .rock {
                return .win
            }else {
                return .lose
            }
        }else if self == .rock {
            if opponentMove == .paper {
                return .lose
            }else if opponentMove == .rock {
                return .draw
            }else {
                return .win
            }
        }else {
            if opponentMove == .paper {
                return .win
            }else if opponentMove == .rock {
                return .lose
            }else {
                return .draw
            }
        }
    }
}

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    }else if sign == 1 {
        return .paper
    }else {
        return .scissors
    }
}



