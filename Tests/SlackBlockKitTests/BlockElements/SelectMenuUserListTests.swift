import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#users_select__example
private let userListSelect = """
{
    "action_id": "text1234",
    "type": "users_select",
    "placeholder": {
        "type": "plain_text",
        "text": "Select an item"
    }
}
"""

class SelectMenuUserListTests: BlockTestCase {
    func test_userListSelect() {
        let expectedSelect = SelectMenuUserList(
            placeholder: TextObject(
                type: .plainText,
                text: "Select an item"
            ),
            actionId: "text1234"
        )
        testCodableEquality(block: expectedSelect, jsonString: userListSelect)
    }
}
