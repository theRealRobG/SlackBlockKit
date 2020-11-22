// https://stackoverflow.com/a/44473156/7039100
struct AnyLayoutBlock: Codable {
    let block: LayoutBlock
    
    init(_ block: LayoutBlock) {
        self.block = block
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(LayoutBlockType.self, forKey: .type)
        self.block = try type.blockMetaType.init(from: decoder)
    }
    
    func encode(to encoder: Encoder) throws {
        try block.encode(to: encoder)
    }
    
    private enum CodingKeys: CodingKey {
        case type
        case block
    }
}
