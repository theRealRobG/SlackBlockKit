public struct DatePickerStateValue: StateValue, Equatable {
    public static let type: StateValueType = .datepicker
    public let type: String
    public let selectedDate: String
    
    public init(selectedDate: String) {
        self.type = Self.type.rawValue
        self.selectedDate = selectedDate
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case selectedDate = "selected_date"
    }
}
