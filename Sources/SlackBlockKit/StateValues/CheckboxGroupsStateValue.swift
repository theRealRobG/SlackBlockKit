public struct CheckboxGroupsStateValue: StateValue {
    public static let type: StateValueType = .checkboxes
    public let type: String
    public let selectedOptions: [StateValueSelectedOption]
    
    public init(selectedOptions: [StateValueSelectedOption]) {
        self.type = Self.type.rawValue
        self.selectedOptions = selectedOptions
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case selectedOptions = "selected_options"
    }
}
