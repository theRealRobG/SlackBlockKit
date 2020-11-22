import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#users_multi_select__example
private let usersListSelect = """
{
    "action_id": "text1234",
    "type": "multi_users_select",
    "placeholder": {
        "type": "plain_text",
        "text": "Select users"
    }
}
"""

class MultiSelectMenuUserListTests: BlockElementTestCase {
    func test_usersListSelect() {
        let expectedMultiSelect = MultiSelectMenuUserList(
            placeholder: TextObject(
                type: .plainText,
                text: "Select users"
            ),
            actionId: "text1234"
        )
        testCodableEquality(block: expectedMultiSelect, jsonString: usersListSelect)
    }
}
