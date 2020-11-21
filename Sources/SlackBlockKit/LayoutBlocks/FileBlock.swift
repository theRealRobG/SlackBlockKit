/// Displays a remote file. You can't add this block to app surfaces directly,
/// but it will show up when retrieving messages that contain remote files.
///
/// Appears in surfaces:
///   - `Messages`
public struct FileBlock: LayoutBlock {
    public static let type = LayoutBlockType.file
    /// The type of block. For a file block, `type` is always `file`.
    public let type: String
    /// The external unique ID for this file.
    public let externalId: String
    /// At the moment, `source` will always be remote for a `remote` file.
    public let source: String
    /// A string acting as a unique identifier for a block. If not specified, one
    /// will be generated. Maximum length for this field is 255 characters.
    /// `block_id` should be unique for each message and each iteration of a message.
    /// If a message is updated, use a new `block_id`.
    public let blockId: String?
    
    public init(
        externalId: String,
        blockId: String? = nil
    ) {
        self.type = Self.type.rawValue
        self.externalId = externalId
        self.source = "remote"
        self.blockId = blockId
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case externalId = "external_id"
        case source
        case blockId = "block_id"
    }
}
