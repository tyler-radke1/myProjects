//
//  Flags_Game__Swift_UI_Version_UITestsLaunchTests.swift
//  Flags Game (Swift UI Version)UITests
//
//  Created by Tyler Radke on 1/10/23.
//

import XCTest

final class Flags_Game__Swift_UI_Version_UITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
