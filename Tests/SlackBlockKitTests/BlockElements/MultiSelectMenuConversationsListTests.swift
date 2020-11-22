import SlackBlockKit

private let conversationsListMultiSelect = """
{
    "action_id": "text1234",
    "type": "multi_conversations_select",
    "placeholder": {
        "type": "plain_text",
        "text": "Select conversations"
    }
}
"""

class MultiSelectMenuConversationsListTests: BlockTestCase {
    func test_conversationsListMultiSelect() {
        let expectedMultiSelect = MultiSelectMenuConversationsList(
            placeholder: TextObject(
                type: .plainText,
                text: "Select conversations"
            ),
            actionId: "text1234"
        )
        testCodableEquality(block: expectedMultiSelect, jsonString: conversationsListMultiSelect)
    }
}
