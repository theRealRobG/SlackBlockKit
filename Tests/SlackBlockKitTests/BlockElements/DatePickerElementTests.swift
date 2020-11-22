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

class DatePickerElementTests: XCTestCase {
    var jsonEncoder: JSONEncoder!
    var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonEncoder = JSONEncoder()
        jsonDecoder = JSONDecoder()
    }
    
    func test_datePickerElement() {
        let expectedDatePicker = DatePickerElement(
            actionId: "datepicker123",
            placeholder: TextObject(
                type: .plainText,
                text: "Select a date"
            ),
            initialDate: "1990-04-28"
        )
        
        do {
            // test encode
            let json = try jsonEncoder.encodeAsString(expectedDatePicker)
            AssertJSONEqual(json, datePickerElement)
            // test decode
            let actualDatePickerElement = try jsonDecoder.decode(DatePickerElement.self, from: datePickerElement)
            XCTAssertEqual(expectedDatePicker, actualDatePickerElement)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
