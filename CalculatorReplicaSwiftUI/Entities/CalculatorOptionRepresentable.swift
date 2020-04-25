//
//  CalculatorOptionRepresentable.swift
//  CalculatorReplicaSwiftUI
//
//  Created by Alonso on 4/20/20.
//  Copyright © 2020 Alonso. All rights reserved.
//

import Foundation

enum CalculatorOptionRepresentable: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case decimal = "."
    case exponent = "e"
    case clear = "AC"
    case sum = "+"
    case subtraction = "-"
    case multiplication = "*"
    case division = "/"
    case percent = "%"
    case negative = "+-"
    case equal = "="
    
    var character: Character {
        return self.rawValue.first!
    }
    
    var operation: CalculatorOperation? {
        switch self {
        case .clear:
            return .clear
        case .sum:
            return .binaryOperation({ $0 + $1 })
        case .subtraction:
            return .binaryOperation({ $0 - $1 })
        case .multiplication:
            return .binaryOperation({ $0 * $1 })
        case .division:
            return .binaryOperation({ $0 / $1 })
        case .percent:
            return .unaryOperation({ $0 * 0.01 })
        case .negative:
            return .unaryOperation({ -$0 })
        case .equal:
            return .equals
        case .decimal:
            return .decimal
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .zero, .exponent:
            return nil
        }
    }
}
