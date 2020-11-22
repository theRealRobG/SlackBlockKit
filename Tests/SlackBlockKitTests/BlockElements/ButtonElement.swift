import SlackBlockKit
import XCTest

// https://api.slack.com/reference/block-kit/block-elements#button__examples
private let regularInteractiveButton = """
{
  "type": "button",
  "text": {
    "type": "plain_text",
    "text": "Click Me"
  },
  "value": "click_me_123",
  "action_id": "button"
}
"""
private let buttonWithAPrimaryStyleAttribute = """
{
  "type": "button",
  "text": {
    "type": "plain_text",
    "text": "Save"
  },
  "style": "primary",
  "value": "click_me_123",
  "action_id": "button"
}
"""
private let linkButton = """
{
  "type": "button",
  "text": {
    "type": "plain_text",
    "text": "Link Button"
  },
  "url": "https://api.slack.com/block-kit",
  "action_id": "button"
}
"""

class ButtonElementTests: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonEncoder = JSONEncoder()
        jsonDecoder = JSONDecoder()
    }
    
    func test_regularInteractiveButton() {
        let expectedButton = ButtonElement(
            text: TextObject(
                type: .plainText,
                text: "Click Me"
            ),
            actionId: "button",
            value: "click_me_123"
        )
        
        do {
            // test encode
            let json = try jsonEncoder.encodeAsString(expectedButton)
            AssertJSONEqual(json, regularInteractiveButton)
            // test decode
            let buttonElement = try jsonDecoder.decode(ButtonElement.self, from: regularInteractiveButton)
            XCTAssertEqual(expectedButton, buttonElement)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_buttonWithAPrimaryStyleAttribute() {
        let expectedButton = ButtonElement(
            text: TextObject(
                type: .plainText,
                text: "Save"
            ),
            actionId: "button",
            value: "click_me_123",
            style: .primary
        )
        
        do {
            // test encode
            let json = try jsonEncoder.encodeAsString(expectedButton)
            AssertJSONEqual(json, buttonWithAPrimaryStyleAttribute)
            // test decode
            let buttonElement = try jsonDecoder.decode(ButtonElement.self, from: buttonWithAPrimaryStyleAttribute)
            XCTAssertEqual(expectedButton, buttonElement)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_linkButton() {
        let expectedButton = ButtonElement(
            text: TextObject(
                type: .plainText,
                text: "Link Button"
            ),
            actionId: "button",
            url: "https://api.slack.com/block-kit"
        )
        
        do {
            // test encode
            let json = try jsonEncoder.encodeAsString(expectedButton)
            AssertJSONEqual(json, linkButton)
            // test decode
            let buttonElement = try jsonDecoder.decode(ButtonElement.self, from: linkButton)
            XCTAssertEqual(expectedButton, buttonElement)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
