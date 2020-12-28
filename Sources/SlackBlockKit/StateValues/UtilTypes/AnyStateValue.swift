// https://stackoverflow.com/a/44473156/7039100
struct AnyStateValue: Codable {
    let value: StateValue
    
    init(_ value: StateValue) {
        self.value = value
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(StateValueType.self, forKey: .type)
        self.value = try type.eventMetaType.init(from: decoder)
    }
    
    func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
    
    private enum CodingKeys: CodingKey {
        case type
        case value
    }
}
