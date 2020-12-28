public struct TimePickerStateValue: StateValue {
    public static let type: StateValueType = .timepicker
    public let type: String
    public let selectedTime: String
    
    public init(selectedTime: String) {
        self.type = Self.type.rawValue
        self.selectedTime = selectedTime
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case selectedTime = "selected_time"
    }
}
