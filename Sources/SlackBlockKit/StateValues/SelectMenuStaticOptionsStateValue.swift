public struct SelectMenuStaticOptionsStateValue: StateValue {
    public static let type: StateValueType = .staticSelect
    public let type: String
    public let selectedOption: StateValueSelectedOption?
    
    public init(selectedOption: StateValueSelectedOption?) {
        self.type = Self.type.rawValue
        self.selectedOption = selectedOption
    }
    
    // The selectedOption is always needed, so we override the synthesized encode method, to ensure
    // that even if selectedOption is nil, that it will still be encoded into the final output.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        if let selectedOption = selectedOption {
            try container.encode(selectedOption, forKey: .selectedOption)
        } else {
            try container.encodeNil(forKey: .selectedOption)
        }
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case selectedOption = "selected_option"
    }
}
