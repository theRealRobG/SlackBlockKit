public protocol SectionBlockElement: BlockElement {}

/// A `section` is one of the most flexible blocks available - it can be used as a simple
/// text block, in combination with text fields, or side-by-side with any of the available
/// block elements.
///
/// Available in surfaces:
///   - `Modals`
///   - `Messages`
///   - `Home tabs`
public struct SectionBlock: LayoutBlock, Equatable {
    public static let type = LayoutBlockType.section
    /// The type of block. For a section block, `type` will always be `section`.
    public let type: String
    /// The text for the block, in the form of a text object. Maximum length for the `text`
    /// in this field is 3000 characters. This field is not required if a valid array of
    /// `fields` objects is provided instead.
    public let text: TextObject?
    /// A string acting as a unique identifier for a block. If not specified, one will be
    /// generated. You can use this `block_id` when you receive an interaction payload to
    /// identify the source of the action. Maximum length for this field is 255 characters.
    /// `block_id` should be unique for each message and each iteration of a message. If a
    /// message is updated, use a new `block_id`.
    public let blockId: String?
    /// Required if no `text` is provided. An array of text objects. Any text objects included
    /// with `fields` will be rendered in a compact format that allows for 2 columns of
    /// side-by-side text. Maximum number of items is 10. Maximum length for the `text` in each
    /// item is 2000 characters. Click here for an example.
    public let fields: [TextObject]?
    /// One of the available element objects.
    public let accessory: SectionBlockElement?
    
    public init(
        text: TextObject,
        blockId: String? = nil,
        fields: [TextObject]? = nil,
        accessory: SectionBlockElement? = nil
    ) {
        self.type = Self.type.rawValue
        self.text = text
        self.blockId = blockId
        self.fields = fields
        self.accessory = accessory
    }
    
    public init(
        text: TextObject? = nil,
        blockId: String? = nil,
        fields: [TextObject],
        accessory: SectionBlockElement? = nil
    ) {
        self.type = Self.type.rawValue
        self.text = text
        self.blockId = blockId
        self.fields = fields
        self.accessory = accessory
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.text = try container.decodeIfPresent(TextObject.self, forKey: .text)
        self.blockId = try container.decodeIfPresent(String.self, forKey: .blockId)
        self.fields = try container.decodeIfPresent([TextObject].self, forKey: .fields)
        
        guard let anyElement = try container.decodeIfPresent(AnyBlockElement.self, forKey: .accessory) else {
            self.accessory = nil
            return
        }
        guard let accessory = anyElement.element as? SectionBlockElement else {
            throw UnexpectedBlockType(
                expectedBlockType: SectionBlockElement.self,
                actualBlockType: Swift.type(of: anyElement.element).self
            )
        }
        self.accessory = accessory
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(blockId, forKey: .blockId)
        try container.encodeIfPresent(fields, forKey: .fields)
        if let accessory = accessory {
            try container.encode(AnyBlockElement(accessory), forKey: .accessory)
        }
    }
    
    public static func == (lhs: SectionBlock, rhs: SectionBlock) -> Bool {
        return
            lhs.type == rhs.type &&
            lhs.text == rhs.text &&
            lhs.blockId == rhs.blockId &&
            lhs.fields == rhs.fields &&
            isEqual(lhs: lhs.accessory, rhs: rhs.accessory)
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case text
        case blockId = "block_id"
        case fields
        case accessory
    }
}
