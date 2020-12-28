public struct PlainTextInputStateValue: StateValue, Equatable {
    public static let type: StateValueType = .plainTextInput
    public let type: String
    public let value: String?
    
    public init(value: String?) {
        self.type = Self.type.rawValue
        self.value = value
    }
    
    // The value is always needed, so we override the synthesized encode method, to ensure
    // that even if value is nil, that it will still be encoded into the final output.
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        if let value = value {
            try container.encode(value, forKey: .value)
        } else {
            try container.encodeNil(forKey: .value)
        }
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case value
    }
}
