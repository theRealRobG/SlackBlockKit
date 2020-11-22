import SlackBlockKit

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

class ButtonElementTests: BlockElementTestCase {
    func test_regularInteractiveButton() {
        let expectedButton = ButtonElement(
            text: TextObject(
                type: .plainText,
                text: "Click Me"
            ),
            actionId: "button",
            value: "click_me_123"
        )
        testCodableEquality(block: expectedButton, jsonString: regularInteractiveButton)
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
        testCodableEquality(block: expectedButton, jsonString: buttonWithAPrimaryStyleAttribute)
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
        testCodableEquality(block: expectedButton, jsonString: linkButton)
    }
}
