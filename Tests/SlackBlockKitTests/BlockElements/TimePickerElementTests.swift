import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#timepicker__example
private let timePickerElevenForty = """
{
    "type": "timepicker",
    "action_id": "timepicker123",
    "initial_time": "11:40",
    "placeholder": {
        "type": "plain_text",
        "text": "Select a time"
    }
}
"""

class TimePickerElementTests: BlockTestCase {
    func test_timePickerElevenForty() {
        let expectedTimePicker = TimePickerElement(
            actionId: "timepicker123",
            placeholder: TextObject(
                type: .plainText,
                text: "Select a time"
            ),
            initialTime: "11:40"
        )
        testCodableEquality(block: expectedTimePicker, jsonString: timePickerElevenForty)
    }
}
