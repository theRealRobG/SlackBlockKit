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
    
    func testCodableEquality<ViewType: SlackView & Equatable>(
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
    
    func testCodableEquality(
        message: MessagePayload,
        jsonString: String,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        do {
            // test encode
            let json = try jsonEncoder.encodeAsString(message)
            AssertJSONEqual(json, jsonString)
            // test decode
            let actualMessage = try jsonDecoder.decode(MessagePayload.self, from: jsonString)
            XCTAssertEqual(message, actualMessage)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
