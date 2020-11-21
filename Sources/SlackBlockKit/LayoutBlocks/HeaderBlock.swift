/// A `header` is a plain-text block that displays in a larger, bold font. Use it
/// to delineate between different groups of content in your app's surfaces.
///
/// Available in surfaces:
///   - `Modals`
///   - `Messages`
///   - `Home tabs`
public struct HeaderBlock: LayoutBlock {
    public static let type = LayoutBlockType.header
    /// The type of block. For this block, `type` will always be `header`.
    public let type: String
    /// The text for the block, in the form of a `plain_text` text object. Maximum
    /// length for the `text` in this field is 150 characters.
    public let text: TextObject
    /// A string acting as a unique identifier for a block. If not specified, one
    /// will be generated. Maximum length for this field is 255 characters.
    /// `block_id` should be unique for each message and each iteration of a message.
    /// If a message is updated, use a new `block_id`.
    public let blockId: String?
    
    public init(
        text: TextObject,
        blockId: String?
    ) {
        self.type = Self.type.rawValue
        self.text = text
        self.blockId = blockId
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case text
        case blockId = "block_id"
    }
}
