import XCTest
@testable import SwiftKordApp

@MainActor
final class AppStateTests: XCTestCase {
    func testLoginCreatesSession() async {
        let appState = AppState(client: SwiftDiscClient())
        XCTAssertFalse(appState.isAuthenticated)

        await appState.login(displayName: "Test")

        XCTAssertTrue(appState.isAuthenticated)
        XCTAssertEqual(appState.session?.displayName, "Test")
    }
}
