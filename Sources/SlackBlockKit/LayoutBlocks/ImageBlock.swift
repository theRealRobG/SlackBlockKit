public struct ImageBlock: LayoutBlock {
    public static let type = LayoutBlockType.image
    public let type: String
    public let imageUrl: String
    public let altText: String
    public let title: TextObject?
    public let blockId: String?
    
    public init(
        imageUrl: String,
        altText: String,
        title: TextObject? = nil,
        blockId: String? = nil
    ) {
        self.type = Self.type.rawValue
        self.imageUrl = imageUrl
        self.altText = altText
        self.title = title
        self.blockId = blockId
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case imageUrl = "image_url"
        case altText = "alt_text"
        case title
        case blockId = "block_id"
    }
}
