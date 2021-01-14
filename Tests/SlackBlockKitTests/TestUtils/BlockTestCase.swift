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
    
    func testCodableEquality<EventType: SlackEvent & Equatable>(
        event: EventType,
        jsonString: String,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        do {
            // test encode
            let json = try jsonEncoder.encodeAsString(event)
            AssertJSONEqual(json, jsonString)
            // test decode
            let actualEvent = try jsonDecoder.decode(Swift.type(of: event), from: jsonString)
            XCTAssertEqual(event, actualEvent)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testCodableEquality<EventWrapperType: SlackEventWrapper & Equatable>(
        event: EventWrapperType,
        jsonString: String,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        do {
            // test encode
            let json = try jsonEncoder.encodeAsString(event)
            AssertJSONEqual(json, jsonString)
            // test decode
            let actualEvent = try jsonDecoder.decode(Swift.type(of: event), from: jsonString)
            XCTAssertEqual(event, actualEvent)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
