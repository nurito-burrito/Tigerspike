//
//  CalculatorRobot.swift
//  CalculatorUITests
//
//  Created by Nurseda Balcioglu on 12/01/2021.
//  Copyright © 2021 Alonso. All rights reserved.
//

import Foundation
import XCTest

class CalculatorRobot: Apply {
    
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    func tapOnButtonWithIdentifier(_ identifier: String) {
        app.buttons[identifier].tap()
    }
    
    func assertExist(_ identifier: String) {
        XCTAssert(app.buttons[identifier].exists)
    }
    
    func assertEqual<T: Equatable>(_ expression1: T, _ expression2: T) {
        XCTAssertEqual(expression1, expression2)
    }
    
    func assertExpectation(_ elementQuery: XCUIElementQuery,
                           predicate: NSPredicate) {
        let expectation = XCTNSPredicateExpectation(predicate: predicate,
                                                    object: elementQuery)

        guard XCTWaiter.wait(for: [expectation], timeout: 5) == .completed else {
            XCTAssert(false, "element: \(elementQuery) doesn't \(predicate)")
            return
        }
    }
    
    func assertButtonsAreShown() {
        let predicate = NSPredicate(format: "count == 19")
        let element = app.buttons
        assertExpectation(element, predicate: predicate)
    }
    
    func assertButtonLabelsAreCorrect() {
        assertEqual("0", app.buttons["0"].label)
        assertEqual("1", app.buttons["1"].label)
        assertEqual("2", app.buttons["2"].label)
        assertEqual("3", app.buttons["3"].label)
        assertEqual("4", app.buttons["4"].label)
        assertEqual("5", app.buttons["5"].label)
        assertEqual("6", app.buttons["6"].label)
        assertEqual("7", app.buttons["7"].label)
        assertEqual("8", app.buttons["8"].label)
        assertEqual("9", app.buttons["9"].label)
        assertEqual("Decimal", app.buttons["Decimal"].label)
        assertEqual("Equals", app.buttons["Equals"].label)
        assertEqual("+", app.buttons["+"].label)
        assertEqual("-", app.buttons["-"].label)
        assertEqual("*", app.buttons["*"].label)
        assertEqual("/", app.buttons["/"].label)
        assertEqual("%", app.buttons["%"].label)
        assertEqual("+-", app.buttons["+-"].label)
        assertEqual("All clear", app.buttons["All clear"].label)
    }
    
    func assertDisplayView(_ identifier: String) {
        
    }
    
    func labelContent(_ identifier: String) -> String {
        return app.staticTexts.element(matching: .any,
                                       identifier: identifier).label
    }
    
    func displayViewText() -> String {
        return app.staticTexts["displayView"].label
    }
    
    func assertDisplayView() {
        assertEqual(displayViewText(), labelContent("displayView"))
    }
    
    func tapNineNines() {
        tapOnButtonWithIdentifier("9")
        tapOnButtonWithIdentifier("9")
        tapOnButtonWithIdentifier("9")
        tapOnButtonWithIdentifier("9")
        tapOnButtonWithIdentifier("9")
        tapOnButtonWithIdentifier("9")
        tapOnButtonWithIdentifier("9")
        tapOnButtonWithIdentifier("9")
        tapOnButtonWithIdentifier("9")
    }
}


protocol Apply {}

extension Apply {
    public func apply(_ block: (Self) throws -> Void) rethrows {
        try block(self)
    }
}
