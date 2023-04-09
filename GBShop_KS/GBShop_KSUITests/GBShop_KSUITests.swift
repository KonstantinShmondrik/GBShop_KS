//
//  GBShop_KSUITests.swift
//  GBShop_KSUITests
//
//  Created by Константин Шмондрик on 09.06.2022.
//

import XCTest


class GBShop_KSUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {

    }
    
    func testRightLogin() throws {
 
        let app = XCUIApplication()
        setupSnapshot(app)
        
        app.launch()
        
        snapshot("LoginScreen")
        
        let loginView = app.otherElements["loginView"].firstMatch
        let loginTexField = loginView.textFields["loginTexField"].firstMatch
        let passwordTexField = loginView.textFields["passwordTexField"].firstMatch
        let loginButton = loginView.buttons["loginButton"].firstMatch
        let tabBarViewController = app.otherElements["tabBarViewController"].firstMatch
        
        print(app.debugDescription)

        loginTexField.tap()
        loginTexField.typeText("Somebody")
        
        passwordTexField.tap()
        passwordTexField.typeText("mypassword")
        
        loginButton.tap()
        XCTAssert(tabBarViewController.waitForExistence(timeout: 5))
        
        snapshot("CatalogScreen")
        
    }
    
    func testFailedLogin() throws {
        let app = XCUIApplication()
        
        setupSnapshot(app)
        
        app.launch()
        let loginView = app.otherElements["loginView"].firstMatch
        let loginTexField = loginView.textFields["loginTexField"].firstMatch
        let passwordTexField = loginView.textFields["passwordTexField"].firstMatch
        let loginButton = loginView.buttons["loginButton"].firstMatch
        let alert = app.alerts.firstMatch
        
        loginTexField.tap()
        loginTexField.typeText("login")
        
        passwordTexField.tap()
        passwordTexField.typeText("password")
        
        loginButton.tap()
        XCTAssert(alert.waitForExistence(timeout: 2.0))
        
        snapshot("AlertScreen")
        
        alert.buttons.firstMatch.tap()
        
        XCTAssert(loginView.waitForExistence(timeout: 5))
       
        
    }

    
    func testRegist() throws {
        
        let app = XCUIApplication()
        
        setupSnapshot(app)
        
        app.launch()
        let loginView = app.otherElements["loginView"].firstMatch
        let registButton = loginView.buttons["registButton"].firstMatch
        let registrationViewController = app.otherElements["registrationViewController"].firstMatch

        registButton.tap()
        XCTAssert(registrationViewController.waitForExistence(timeout: 5))
        
        snapshot("RegistScreen")
        
    }

}
