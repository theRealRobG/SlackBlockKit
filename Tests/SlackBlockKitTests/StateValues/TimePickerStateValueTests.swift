import SlackBlockKit
import XCTest

private let timePicker = """
{
  "selected_time": "13:37",
  "type": "timepicker"
}
"""

class TimePickerStateValueTests: XCTestCase {
    private var jsonDecoder: JSONDecoder!
    
    override func setUp() {
        jsonDecoder = JSONDecoder()
    }
    
    func test_timePicker() throws {
        let timePickerState = try jsonDecoder.decode(TimePickerStateValue.self, from: timePicker)
        let expectedTimePicker = TimePickerStateValue(selectedTime: "13:37")
        XCTAssertEqual(timePickerState, expectedTimePicker)
    }
}
