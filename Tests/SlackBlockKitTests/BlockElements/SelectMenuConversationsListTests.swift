import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#conversation_select__example
private let conversationListSelect = """
{
    "action_id": "text1234",
    "type": "conversations_select",
    "placeholder": {
        "type": "plain_text",
        "text": "Select an item"
    }
}
"""

class SelectMenuConversationsListTests: BlockElementTestCase {
    func test_conversationListSelect() {
        let expectedSelect = SelectMenuConversationsList(
            placeholder: TextObject(
                type: .plainText,
                text: "Select an item"
            ),
            actionId: "text1234"
        )
        testCodableEquality(block: expectedSelect, jsonString: conversationListSelect)
    }
}
