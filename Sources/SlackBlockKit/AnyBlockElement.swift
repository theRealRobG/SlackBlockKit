struct AnyBlockElement: Codable {
    let element: BlockElement
    
    init(_ element: BlockElement) {
        self.element = element
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(BlockElementType.self, forKey: .type)
        self.element = try type.blockMetaType.init(from: decoder)
    }
    
    func encode(to encoder: Encoder) throws {
        try element.encode(to: encoder)
    }
    
    private enum CodingKeys: CodingKey {
        case type
        case element
    }
}
