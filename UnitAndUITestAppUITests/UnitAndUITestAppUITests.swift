//
//  UnitAndUITestAppUITests.swift
//  UnitAndUITestAppUITests
//
//  Created by Canberk Bibican on 26.06.2022.
//

import XCTest

class UnitAndUITestAppUITests: XCTestCase {
    private var device: XCUIDevice!
    private var app: XCUIApplication!
    private var email, pass, loginButton, loginButtonErrorAlert: XCUIElement!

    override func setUpWithError() throws {

        try super.setUpWithError()

        app = XCUIApplication()
        app.launch()
        device = XCUIDevice.shared

        email = app.textFields["Email"]
        pass = app.secureTextFields["Password"]
        loginButton = app.buttons["Login"]
        loginButtonErrorAlert = app.alerts["errorAlertDialog"]

        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
        email = nil
        pass = nil
        loginButton = nil
        try super.tearDownWithError()
    }

    func testLoginViewController_WhenViewLoaded_RequiredUIElementsAreEnabled() throws {
        XCTAssertTrue(email.isEnabled, "EmailTextField Enable")
        XCTAssertTrue(pass.isEnabled, "PasswordTextField Enable")
        XCTAssertTrue(loginButton.isEnabled, "LoginButton Enable")

    }

    func testLoginViewController_WhenInvalidEmail_PresentsErrorAlertDialog() throws {
        // Arrange
        email.tap()
        email.typeText("c")

        pass.tap()
        pass.typeText("a")

        // Act
        loginButton.tap()
        loginButtonErrorAlert.buttons.firstMatch.tap()
        print("Erroun Button Labeli : " + loginButtonErrorAlert.buttons.firstMatch.label)

        // Assert
        XCTAssertTrue(loginButtonErrorAlert.waitForExistence(timeout: 1), "Error Dialog Not Presented")
        XCTAssertEqual(loginButtonErrorAlert.buttons.firstMatch.label, "OK")
    }

    func testLoginViewController_WhenInvalidEmail_PresentsSuccessAlertDialog() throws {
        // Arrange
        email.tap()
        email.typeText("canberk@flowq.com")

        pass.tap()
        pass.typeText("asd123")

        // Act
        device.orientation = .portrait
        loginButton.tap()

        // Screenshot
        // let emailTextFieldScreenshot = email.screenshot()
        // let appScreenshot = app.screenshot()
        let appScreenshot = XCUIScreen.main.screenshot()
        let appAttachment = XCTAttachment(screenshot: appScreenshot)
        appAttachment.name = "Screenshot app"
        appAttachment.lifetime = .keepAlways
        add(appAttachment)
        // --> TestDiamond rigth click and go to Jump Report for Screenshots

        // Assert
        XCTAssertTrue(app.otherElements["HomepageViewController"].waitForExistence(timeout: 1), "Not present")
        // XCTAssertTrue(app.alerts["successAlertDialog"].waitForExistence(timeout: 1), "Success Dialog  Presented")
    }

    func testXCUITest_Elements_Examples() throws {
        /*
        device.orientation = .portrait
        // device.press(.home)
        let siri = device.siriService
        siri.activate(voiceRecognitionText: "Selam")

        email.doubleTap()
        email.twoFingerTap()
        email.tap(withNumberOfTaps: 5, numberOfTouches: 5)
        email.press(forDuration: .infinity)
        email.swipeDown()
        app.swipeLeft()
        email.rotate(CGFloat(5), withVelocity: CGFloat(5))
        email.pinch(withScale: CGFloat(7), velocity: CGFloat(7))
        email.adjust(toNormalizedSliderPosition: CGFloat(7))
        XCTAssertTrue(loginButton.isEnabled, "LoginButton Enable")
        */
    }

    /*
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
  */
}
