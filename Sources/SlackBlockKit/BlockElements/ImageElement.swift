/// An element to insert an image as part of a larger block of content.
/// If you want a block with *only* an image in it, you're looking for the
/// `image` block.
///
/// Works with block types:
///   - `Section`
///   - `Context`
public struct ImageElement: BlockElement, ContextBlockElement, SectionBlockElement, Equatable {
    public static let type = BlockElementType.image
    /// The type of element. In this case `type` is always `image`.
    public let type: String
    /// The URL of the image to be displayed.
    public let imageUrl: String
    /// A plain-text summary of the image. This should not contain any markup.
    public let altText: String
    
    public init(
        imageUrl: String,
        altText: String
    ) {
        self.type = Self.type.rawValue
        self.imageUrl = imageUrl
        self.altText = altText
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case imageUrl = "image_url"
        case altText = "alt_text"
    }
}
