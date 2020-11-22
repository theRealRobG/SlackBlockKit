import SlackBlockKit
import XCTest

class BlockElementTestCase: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonEncoder = JSONEncoder()
        jsonDecoder = JSONDecoder()
    }
    
    func testCodableEquality<BlockType: BlockElement & Equatable>(block: BlockType, jsonString: String) {
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
}
