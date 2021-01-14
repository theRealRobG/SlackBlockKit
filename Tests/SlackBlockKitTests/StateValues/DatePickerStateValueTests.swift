import SlackBlockKit
import XCTest

private let datePicker = """
{
  "type": "datepicker",
  "selected_date": "1990-04-28"
}
"""

class DatePickerStateValueTests: XCTestCase {
    private var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
    }
    
    func test_datePicker() throws {
        let datePickerState = try jsonDecoder.decode(DatePickerStateValue.self, from: datePicker)
        let expectedDatePicker = DatePickerStateValue(selectedDate: SlackDate(year: 1990, month: 4, day: 28))
        XCTAssertEqual(datePickerState, expectedDatePicker)
    }
}
