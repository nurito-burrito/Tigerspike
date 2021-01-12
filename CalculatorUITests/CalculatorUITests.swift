//
//  CalculatorUITests.swift
//  CalculatorUITests
//
//  Created by Nurseda Balcioglu on 12/01/2021.
//  Copyright © 2021 Alonso. All rights reserved.
//

import XCTest
@testable import Calculator

class CalculatorUITests: XCTestCase {
    
    public var app: XCUIApplication!
    private var calculatorRobot: CalculatorRobot!
    
    override func setUp() {
        super.setUp()
        
        
        self.app = XCUIApplication()
        self.app.launch()
        calculatorRobot = CalculatorRobot(app: app)

    }

    override func tearDown() {
        super.tearDown()
    }

    /**
     * Given:   I have opened the app
     * Then:    All screen elements are visible
     */
    func testAllScreenElements() {

        calculatorRobot.apply { robot in
            robot.assertButtonsAreShown()
            robot.assertButtonLabelsAreCorrect()
        }
    }
    
    /**
     * Given:   I have tapped on any number or made a calculation
     * When:   I tap on AC button
     * Then:    Display view should be 0
     **/
    func testACButtonResetsDisplayView() {
        
        calculatorRobot.apply { robot in
            robot.tapOnButtonWithIdentifier("5")
            robot.assertEqual("5", robot.displayViewText())
            robot.tapOnButtonWithIdentifier("All clear")
            robot.assertEqual("0", robot.displayViewText())
        }
    }
    
    /**
     * Given:   I have tapped on any number
     * When:   I tap on . button
     * Then:    Display view should display the correct value
     **/
    func testDemicalFunctionality() {
        
        calculatorRobot.apply { robot in
            robot.tapOnButtonWithIdentifier("5")
            robot.tapOnButtonWithIdentifier("Decimal")
            robot.tapOnButtonWithIdentifier("5")
            robot.assertEqual("5.5", robot.displayViewText())
        }
    }
    
    /**
     * Given:   I have tapped on 2 + 2
     * When:   I tap on = button
     * Then:    Display view should display the correct value
     **/
    func testAdditionFunctionality() {
        
        calculatorRobot.apply { robot in
            robot.tapOnButtonWithIdentifier("2")
            robot.tapOnButtonWithIdentifier("+")
            robot.tapOnButtonWithIdentifier("2")
            robot.tapOnButtonWithIdentifier("Equals")
            robot.assertEqual("4", robot.displayViewText())
        }
    }
    
    /**
     * Given:   I have tapped on 3 - 2
     * When:   I tap on = button
     * Then:    Display view should display the correct value
     **/
    func testSubstractionFunctionality() {
        
        calculatorRobot.apply { robot in
            robot.tapOnButtonWithIdentifier("3")
            robot.tapOnButtonWithIdentifier("-")
            robot.tapOnButtonWithIdentifier("2")
            robot.tapOnButtonWithIdentifier("Equals")
            robot.assertEqual("1", robot.displayViewText())
        }
    }
    
    /**
     * Given:   I have tapped on 2 x 2
     * When:   I tap on = button
     * Then:    Display view should display the correct value
     **/
    func testMultiplicationFunctionality() {
        
        calculatorRobot.apply { robot in
            robot.tapOnButtonWithIdentifier("2")
            robot.tapOnButtonWithIdentifier("*")
            robot.tapOnButtonWithIdentifier("2")
            robot.tapOnButtonWithIdentifier("Equals")
            robot.assertEqual("4", robot.displayViewText())
        }
    }
    
    /**
     * Given:   I have tapped on 4 / 2
     * When:   I tap on = button
     * Then:    Display view should display the correct value
     **/
    func testDivisionFunctionality() {
        
        calculatorRobot.apply { robot in
            robot.tapOnButtonWithIdentifier("8")
            robot.tapOnButtonWithIdentifier("/")
            robot.tapOnButtonWithIdentifier("4")
            robot.tapOnButtonWithIdentifier("Equals")
            robot.assertEqual("2", robot.displayViewText())
        }
    }
    
    /**
     * Given:   I have tapped on any number
     * When:   I tap on +/- button
     * Then:    Display view should display the number with a -
     * And: When I tap on +/- again, the - should disappear
     */
    func testNegativeNumberFunctionality() {
        
        calculatorRobot.apply { robot in
            robot.tapOnButtonWithIdentifier("5")
            robot.tapOnButtonWithIdentifier("+-")
            robot.assertEqual("-5", robot.displayViewText())
            robot.tapOnButtonWithIdentifier("+-")
            robot.assertEqual("5", robot.displayViewText())
        }
    }
    
    /**
     * Given:   I have tapped on any number
     * When:   I tap on % button
     * Then:    Display view should display the correct value
     */
    func testPercentageFunctionality() {
        
        calculatorRobot.apply { robot in
            robot.tapOnButtonWithIdentifier("1")
            robot.tapOnButtonWithIdentifier("0")
            robot.tapOnButtonWithIdentifier("%")
            robot.assertEqual("0.1", robot.displayViewText())
        }
    }
    
    /**
     * Given:   I have calculated a very large number
     * When:   The result is displayed
     * Then:    I see an error appear on teh display view
     */
    func testErrorFunctionality() {
        
        calculatorRobot.apply { robot in
            robot.tapNineNines()
            robot.tapOnButtonWithIdentifier("*")
            robot.tapNineNines()
            robot.tapOnButtonWithIdentifier("Equals")
            robot.assertEqual("1e18", robot.displayViewText())
        }
    }
}

