import XCTest
@testable import DomainKit

final class TracksUseCaseTests: XCTestCase {
    
    func testTracksAvailable() async throws {
        let tracks = try await TracksFacade().get()
        XCTAssertFalse(tracks.isEmpty)
    }
    
}
