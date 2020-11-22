import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#input__example
private let plainTextInputElement = """
{
    "type": "plain_text_input",
    "action_id": "plain_input",
    "placeholder": {
        "type": "plain_text",
        "text": "Enter some plain text"
    }
}
"""

class PlainTextInputElementTests: BlockElementTestCase {
    func test_plainTextInputElement() {
        let expectedInputElement = PlainTextInputElement(
            actionId: "plain_input",
            placeholder: TextObject(
                type: .plainText,
                text: "Enter some plain text"
            )
        )
        testCodableEquality(block: expectedInputElement, jsonString: plainTextInputElement)
    }
}
