//
//  UnitAndUITestAppTests.swift
//  UnitAndUITestAppTests
//
//  Created by Canberk Bibican on 26.06.2022.
//

import XCTest
@testable import UnitAndUITestApp

class UnitAndUITestAppTests: XCTestCase {

    static var classInstanceCounter = 0

    override class func setUp() {
        super.setUp()
    }

    override func setUp() {
        UnitAndUITestAppTests.classInstanceCounter += 1
    }

    override func setUpWithError() throws {

    }

    override func tearDownWithError() throws {

    }

    func testMailValidation_LoginInput_MailIsValidTrue() throws {
        // AAA pattern
        
        print("Runnig : \(UnitAndUITestAppTests.classInstanceCounter)")
        let viewController = ViewController()
        
        /// Arrange
        let mail = "jkahsdf@aaaa.com"
        
        /// Act
        let mailValid = viewController.isValidEmail(mail)
        
        /*
         let mailList = ["jkasdahsdf@aaaa.com", "jkahsdf@aaaa.com"]
         for vailmail in mailList {
            XCTAssertTrue(viewController.isValidEmail(vailmail),"emailValid")
        }
        */
        
        /// Assert
        XCTAssertTrue(mailValid, "Email Valid")
        /* ///Throw Error
        XCTAssertThrowsError(try mailValid, "message") { error in
            XCTAssertEqual(error, Error, "mesage")
        }
        */
    }

    func testExample2() throws {

    }

    func testPerformanceExample() throws {

        self.measure {

        }
    }

}
