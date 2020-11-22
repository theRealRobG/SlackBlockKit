/// A simple image block, designed to make those cat photos really pop.
///
/// Available in surfaces:
///   - `Modals`
///   - `Messages`
///   - `Home tabs`
public struct ImageBlock: LayoutBlock {
    public static let type = LayoutBlockType.image
    /// The type of block. For an image block, `type` is always `image`.
    public let type: String
    /// The URL of the image to be displayed. Maximum length for this field is 3000
    /// characters.
    public let imageUrl: String
    /// A plain-text summary of the image. This should not contain any markup. Maximum
    /// length for this field is 2000 characters.
    public let altText: String
    /// An optional title for the image in the form of a text object that can only be
    /// of `type: plain_text`. Maximum length for the `text` in this field is 2000 characters.
    public let title: TextObject?
    /// A string acting as a unique identifier for a block. If not specified, one will be
    /// generated. Maximum length for this field is 255 characters. `block_id` should be
    /// unique for each message and each iteration of a message. If a message is updated,
    /// use a new `block_id`.
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
