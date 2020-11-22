import SlackBlockKit
import XCTest

class BlockTestCase: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonEncoder = JSONEncoder()
        jsonDecoder = JSONDecoder()
    }
    
    func testCodableEquality<BlockType: BlockElement & Equatable>(
        block: BlockType,
        jsonString: String,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        do {
            // test encode
            let json = try jsonEncoder.encodeAsString(block)
            AssertJSONEqual(json, jsonString)
            // test decode
            let actualBlock = try jsonDecoder.decode(Swift.type(of: block), from: jsonString)
            XCTAssertEqual(block, actualBlock)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testCodableEquality<ViewType: View & Equatable>(
        view: ViewType,
        jsonString: String,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        do {
            // test encode
            let json = try jsonEncoder.encodeAsString(view)
            AssertJSONEqual(json, jsonString)
            // test decode
            let actualView = try jsonDecoder.decode(Swift.type(of: view), from: jsonString)
            XCTAssertEqual(view, actualView)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
