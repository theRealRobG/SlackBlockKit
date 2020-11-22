import SlackBlockKit
import XCTest

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

class DatePickerElementTests: BlockElementTestCase {
    func test_datePickerElement() {
        let expectedDatePicker = DatePickerElement(
            actionId: "datepicker123",
            placeholder: TextObject(
                type: .plainText,
                text: "Select a date"
            ),
            initialDate: "1990-04-28"
        )
        
        testCodableEquality(block: expectedDatePicker, jsonString: datePickerElement)
    }
}
