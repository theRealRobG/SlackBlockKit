// https://stackoverflow.com/a/44473156/7039100
struct AnySlackEvent: Codable {
    let event: SlackEvent
    
    init(_ event: SlackEvent) {
        self.event = event
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(SlackEventType.self, forKey: .type)
        self.event = try type.eventMetaType.init(from: decoder)
    }
    
    func encode(to encoder: Encoder) throws {
        try event.encode(to: encoder)
    }
    
    private enum CodingKeys: CodingKey {
        case type
        case event
    }
}
