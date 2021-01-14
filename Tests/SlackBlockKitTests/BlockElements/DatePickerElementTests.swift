import SlackBlockKit

// https://api.slack.com/reference/block-kit/block-elements#datepicker__example
private let datePickerElement = """
{
    "type": "datepicker",
    "action_id": "datepicker123",
    "initial_date": "1990-04-28",
    "placeholder": {
        "type": "plain_text",
        "text": "Select a date"
    }
}
"""

class DatePickerElementTests: BlockTestCase {
    func test_datePickerElement() {
        let expectedDatePicker = DatePickerElement(
            actionId: "datepicker123",
            placeholder: TextObject(
                type: .plainText,
                text: "Select a date"
            ),
            initialDate: SlackDate(year: 1990, month: 4, day: 28)
        )
        testCodableEquality(block: expectedDatePicker, jsonString: datePickerElement)
    }
}
