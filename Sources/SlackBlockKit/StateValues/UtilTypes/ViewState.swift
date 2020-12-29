public struct ViewState: Codable, Equatable {
    public static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        return lhs.values.isEqual(to: rhs.values)
    }
    
    /// A dictionary of objects. Each object represents a block in the source view that contained
    /// stateful, interactive components. Objects are keyed by the `block_id` of those blocks.
    /// These objects each contain a child object. The child object is keyed by the `action_id` of
    /// the interactive element in the block. This final child object will contain the `type` and
    /// submitted `value` of the input block element.
    public let values: StateValues
    
    public init(values: StateValues) {
        self.values = values
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.values = try container.decode(AnyStateValues.self, forKey: .values).mapValues { $0.mapValues(\.value) }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(values.mapValues { $0.mapValues(AnyStateValue.init) }, forKey: .values)
    }
    
    public enum CodingKeys: String, CodingKey {
        case values
    }
}
