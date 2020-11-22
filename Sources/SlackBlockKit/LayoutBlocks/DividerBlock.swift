/// A content divider, like an `<hr>`, to split up different blocks inside of a
/// message. The divider block is nice and neat, requiring only a `type`.
///
/// Available in surfaces:
///   - `Modals`
///   - `Messages`
///   - `Home tabs`
public struct DividerBlock: LayoutBlock, Equatable {
    public static let type = LayoutBlockType.divider
    ///     The type of block. For a divider block, `type` is always `divider`.
    public let type: String
    /// A string acting as a unique identifier for a block. If not specified, one
    /// will be generated. Maximum length for this field is 255 characters.
    /// `block_id` should be unique for each message and each iteration of a message.
    /// If a message is updated, use a new `block_id`.
    public let blockId: String?
    
    public init(
        blockId: String? = nil
    ) {
        self.type = Self.type.rawValue
        self.blockId = blockId
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case blockId = "block_id"
    }
}
