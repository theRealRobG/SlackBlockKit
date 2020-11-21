public protocol ContextBlockElement: BlockElement {}

/// Displays message context, which can include both images and text.
///
/// Available in surfaces:
///   - `Modals`
///   - `Messages`
///   - `Home tabs`
public struct ContextBlock: LayoutBlock {
    public static let type = LayoutBlockType.context
    /// The type of block. For a context block, `type` is always `context`.
    public let type: String
    /// An array of image elements and text objects. Maximum number of items is 10.
    public let elements: [ContextBlockElement]
    /// A string acting as a unique identifier for a block. If not specified, one will
    /// be generated. Maximum length for this field is 255 characters. `block_id` should
    /// be unique for each message and each iteration of a message. If a message is updated,
    /// use a new `block_id`.
    public let blockId: String?
    
    public init(
        elements: [ContextBlockElement],
        blockId: String?
    ) {
        if elements.count > 10 {
            assertionFailure("Maximum number of elements is 10.")
        }
        
        self.type = Self.type.rawValue
        self.elements = Array(elements.prefix(10))
        self.blockId = blockId
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.blockId = try container.decodeIfPresent(String.self, forKey: .blockId)
        self.elements = try container.decode([AnyBlockElement].self, forKey: .elements).map {
            guard let contextBlockElement = $0.element as? ContextBlockElement else {
                throw UnexpectedBlockType(
                    expectedBlockType: ContextBlockElement.self,
                    actualBlockType: Swift.type(of: $0.element).self
                )
            }
            return contextBlockElement
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encode(elements.map(AnyBlockElement.init), forKey: .elements)
        try container.encodeIfPresent(blockId, forKey: .blockId)
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case elements
        case blockId = "block_id"
    }
}
