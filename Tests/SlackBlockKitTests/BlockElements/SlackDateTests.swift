import SlackBlockKit
import XCTest

class SlackDateTests: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonEncoder = JSONEncoder()
        jsonDecoder = JSONDecoder()
    }
    
    func test_date_valid_decode() throws {
        let expectedDate = SlackDate(year: 2021, month: 1, day: 14)
        let actualDate = try decodeDate(from: "2021-01-14")
        XCTAssertEqual(expectedDate, actualDate)
    }
    
    func test_date_valid_encode() throws {
        let expectedDate = dateStringJSON(forDateString: "1991-03-30")
        let date = SlackDate(year: 1991, month: 3, day: 30)
        try XCTAssertEqual(expectedDate, encodeDateAsString(date: date))
    }
    
    func test_date_earliestDay_decode() throws {
        let expectedDate = SlackDate(year: 0, month: 1, day: 1)
        let actualDate = try decodeDate(from: "0000-01-01")
        XCTAssertEqual(expectedDate, actualDate)
    }
    
    func test_date_earliestDay_encode() throws {
        let expectedDate = dateStringJSON(forDateString: "0000-01-01")
        let date = SlackDate(year: 0, month: 1, day: 1)
        try XCTAssertEqual(expectedDate, encodeDateAsString(date: date))
    }
    
    func test_date_invalid_wrongSeparators() {
        XCTAssertThrowsError(try decodeDate(from: "2021:01:14")) { error in
            guard let decodingError = error as? DecodingError else { return XCTFail() }
            switch decodingError {
            case .dataCorrupted(let context):
                XCTAssertEqual(context.debugDescription, "Invalid date structure: date not split into 3 components by `-` separator.")
            default:
                XCTFail()
            }
        }
    }
    
    func test_date_invalid_incorrectNumberOfSeparators() {
        XCTAssertThrowsError(try decodeDate(from: "2021-01")) { error in
            guard let decodingError = error as? DecodingError else { return XCTFail() }
            switch decodingError {
            case .dataCorrupted(let context):
                XCTAssertEqual(context.debugDescription, "Invalid date structure: date not split into 3 components by `-` separator.")
            default:
                XCTFail()
            }
        }
    }
    
    func test_date_invalid_yearNotNumber() {
        XCTAssertThrowsError(try decodeDate(from: "twentytwentyone-01-14")) { error in
            guard let decodingError = error as? DecodingError else { return XCTFail() }
            switch decodingError {
            case .dataCorrupted(let context):
                XCTAssertEqual(context.debugDescription, "Invalid date structure: year component not valid Int.")
            default:
                XCTFail()
            }
        }
    }
    
    func test_date_invalid_monthNotNumber() {
        XCTAssertThrowsError(try decodeDate(from: "2021-jan-14")) { error in
            guard let decodingError = error as? DecodingError else { return XCTFail() }
            switch decodingError {
            case .dataCorrupted(let context):
                XCTAssertEqual(context.debugDescription, "Invalid date structure: month component not valid Int.")
            default:
                XCTFail()
            }
        }
    }
    
    func test_date_invalid_dayNotNumber() {
        XCTAssertThrowsError(try decodeDate(from: "2021-01-fourteenth")) { error in
            guard let decodingError = error as? DecodingError else { return XCTFail() }
            switch decodingError {
            case .dataCorrupted(let context):
                XCTAssertEqual(context.debugDescription, "Invalid date structure: day component not valid Int.")
            default:
                XCTFail()
            }
        }
    }
}

extension SlackDateTests {
    fileprivate struct TestHelperJSON: Codable, Equatable {
        let date: SlackDate
    }
    
    fileprivate func decodeDate(from: String) throws -> SlackDate {
        return try jsonDecoder.decode(TestHelperJSON.self, from: dateStringJSON(forDateString: from)).date
    }
    
    fileprivate func encodeDateAsString(date: SlackDate) throws -> String {
        return try jsonEncoder.encodeAsString(dateTestHelper(forDate: date))
    }
    
    private func dateStringJSON(forDateString dateString: String) -> String {
        return "{\"date\":\"\(dateString)\"}"
    }
    
    private func dateTestHelper(forDate date: SlackDate) -> TestHelperJSON {
        return TestHelperJSON(date: date)
    }
}
