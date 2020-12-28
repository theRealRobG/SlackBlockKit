/// Secondary content can be attached to messages to include lower priority content -
/// content that doesn't necessarily need to be seen to appreciate the intent of the
/// message, but perhaps adds further context or additional information.
public struct SecondaryMessageAttachment: Codable, Equatable {
    /// An array of layout blocks in the same format as described in the building blocks
    /// guide.
    public let blocks: [LayoutBlock]?
    /// Changes the color of the border on the left side of this attachment from the
    /// default gray. Can either be one of `good` (green), `warning` (yellow), `danger`
    /// (red), or any hex color code (eg. `#439FE0`)
    public let color: MessageBorderColor?
    /// A valid URL that displays a small 16px by 16px image to the left of the `author_name`
    /// text. Will only work if `author_name` is present.
    ///
    /// **Block alternatives:** An image element in a context block.
    public let authorIcon: String?
    /// A valid URL that will hyperlink the author_name text. Will only work if author_name
    /// is present.
    ///
    /// **Block alternatives:** A text object in a context block.
    public let authorLink: String?
    /// Small text used to display the author's name.
    ///
    /// **Block alternatives:** A text object in a context block.
    public let authorName: String?
    /// A plain text summary of the attachment used in clients that don't show formatted text
    /// (eg. IRC, mobile notifications).
    ///
    /// **Block alternatives:** The top-level `text` field from the message payload.
    public let fallback: String?
    /// An array of field objects that get displayed in a table-like way (See the example above).
    /// For best results, include no more than 2-3 field objects.
    ///
    /// **Block alternatives:** `fields` in a section block.
    public let fields: [FieldObject]?
    /// Some brief text to help contextualize and identify an attachment. Limited to 300 characters,
    /// and may be truncated further when displayed to users in environments with limited screen
    /// real estate.
    ///
    /// **Block alternatives:** A text object in a context block.
    public let footer: String?
    /// A valid URL to an image file that will be displayed beside the `footer` text. Will only
    /// work if `author_name` is present. We'll render what you provide at 16px by 16px. It's best
    /// to use an image that is similarly sized.
    ///
    /// **Block alternatives:** An image element in a context block.
    public let footerIcon: String?
    /// A valid URL to an image file that will be displayed at the bottom of the attachment. We
    /// support GIF, JPEG, PNG, and BMP formats.
    ///
    /// Large images will be resized to a maximum width of 360px or a maximum height of 500px,
    /// while still maintaining the original aspect ratio. Cannot be used with `thumb_url`.
    ///
    /// **Block alternatives:** An image block.
    public let imageUrl: String?
    /// An array of field names that should be formatted by `mrkdwn` syntax.
    ///
    /// **Block alternatives:** Format text objects with `mrkdwn`.
    public let mrkdwnIn: [String]?
    /// Text that appears above the message attachment block. It can be formatted as plain text,
    /// or with `mrkdwn` by including it in the `mrkdwn_in` field.
    ///
    /// **Block alternatives:** A section block.
    public let pretext: String?
    /// The main body text of the attachment. It can be formatted as plain text, or with `mrkdwn`
    /// by including it in the `mrkdwn_in` field. The content will automatically collapse if it
    /// contains 700+ characters or 5+ linebreaks, and will display a "Show more..." link to expand
    /// the content.
    ///
    /// **Block alternatives:** A section block using text formatting.
    public let text: String?
    /// A valid URL to an image file that will be displayed as a thumbnail on the right side of a
    /// message attachment. We currently support the following formats: GIF, JPEG, PNG, and BMP.
    ///
    /// The thumbnail's longest dimension will be scaled down to 75px while maintaining the aspect
    /// ratio of the image. The filesize of the image must also be less than 500 KB.
    ///
    /// For best results, please use images that are already 75px by 75px.
    ///
    /// **Block alternatives:** A section block with an image element.
    public let thumbUrl: String?
    /// Large title text near the top of the attachment.
    ///
    /// **Block alternatives:** A section block.
    public let title: String?
    /// A valid URL that turns the `title` text into a hyperlink.
    ///
    /// **Block alternatives:** A section block using `mrkdwn` links.
    public let titleLink: String?
    /// An integer Unix timestamp that is used to related your attachment to a specific time. The
    /// attachment will display the additional timestamp value as part of the attachment's footer.
    ///
    /// Your message's timestamp will be displayed in varying ways, depending on how far in the past
    /// or future it is, relative to the present. Form factors, like mobile versus desktop may also
    /// transform its rendered appearance.
    ///
    /// **Block alternatives:** A context block using date formatting.
    public let ts: Int?
    
    public init(
        blocks: [LayoutBlock],
        color: MessageBorderColor? = nil,
        authorIcon: String? = nil,
        authorLink: String? = nil,
        authorName: String? = nil,
        fallback: String? = nil,
        fields: [FieldObject]? = nil,
        footer: String? = nil,
        footerIcon: String? = nil,
        imageUrl: String? = nil,
        mrkdwnIn: [String]? = nil,
        pretext: String? = nil,
        text: String? = nil,
        thumbUrl: String? = nil,
        title: String? = nil,
        titleLink: String? = nil,
        ts: Int? = nil
    ) {
        self.blocks = blocks
        self.color = color
        self.authorIcon = authorIcon
        self.authorLink = authorLink
        self.authorName = authorName
        self.fallback = fallback
        self.fields = fields
        self.footer = footer
        self.footerIcon = footerIcon
        self.imageUrl = imageUrl
        self.mrkdwnIn = mrkdwnIn
        self.pretext = pretext
        self.text = text
        self.thumbUrl = thumbUrl
        self.title = title
        self.titleLink = titleLink
        self.ts = ts
    }
    
    /// If you are using attachments, we still recommend that you use the blocks field above
    /// to structure and layout the content within them using Block Kit.
    ///
    /// Legacy options shown below should be avoided in nearly every case - blocks offer the
    /// same visual capabilities, and add many more. Meanwhile, these legacy options may be
    /// subject to reductions in visibility or functionality.
    ///
    /// All of these fields are optional if you're including blocks as above. If you aren't,
    /// one of either fallback or text are required.
    public init(
        fallback: String,
        color: MessageBorderColor? = nil,
        authorIcon: String? = nil,
        authorLink: String? = nil,
        authorName: String? = nil,
        fields: [FieldObject]? = nil,
        footer: String? = nil,
        footerIcon: String? = nil,
        imageUrl: String? = nil,
        mrkdwnIn: [String]? = nil,
        pretext: String? = nil,
        text: String? = nil,
        thumbUrl: String? = nil,
        title: String? = nil,
        titleLink: String? = nil,
        ts: Int? = nil
    ) {
        self.blocks = nil
        self.color = color
        self.authorIcon = authorIcon
        self.authorLink = authorLink
        self.authorName = authorName
        self.fallback = fallback
        self.fields = fields
        self.footer = footer
        self.footerIcon = footerIcon
        self.imageUrl = imageUrl
        self.mrkdwnIn = mrkdwnIn
        self.pretext = pretext
        self.text = text
        self.thumbUrl = thumbUrl
        self.title = title
        self.titleLink = titleLink
        self.ts = ts
    }
    
    /// If you are using attachments, we still recommend that you use the blocks field above
    /// to structure and layout the content within them using Block Kit.
    ///
    /// Legacy options shown below should be avoided in nearly every case - blocks offer the
    /// same visual capabilities, and add many more. Meanwhile, these legacy options may be
    /// subject to reductions in visibility or functionality.
    ///
    /// All of these fields are optional if you're including blocks as above. If you aren't,
    /// one of either fallback or text are required.
    public init(
        text: String,
        color: MessageBorderColor? = nil,
        authorIcon: String? = nil,
        authorLink: String? = nil,
        authorName: String? = nil,
        fallback: String? = nil,
        fields: [FieldObject]? = nil,
        footer: String? = nil,
        footerIcon: String? = nil,
        imageUrl: String? = nil,
        mrkdwnIn: [String]? = nil,
        pretext: String? = nil,
        thumbUrl: String? = nil,
        title: String? = nil,
        titleLink: String? = nil,
        ts: Int? = nil
    ) {
        self.blocks = nil
        self.color = color
        self.authorIcon = authorIcon
        self.authorLink = authorLink
        self.authorName = authorName
        self.fallback = fallback
        self.fields = fields
        self.footer = footer
        self.footerIcon = footerIcon
        self.imageUrl = imageUrl
        self.mrkdwnIn = mrkdwnIn
        self.pretext = pretext
        self.text = text
        self.thumbUrl = thumbUrl
        self.title = title
        self.titleLink = titleLink
        self.ts = ts
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.blocks = try container.decodeIfPresent([AnyLayoutBlock].self, forKey: .blocks)?.map { $0.block }
        self.color = try container.decodeIfPresent(MessageBorderColor.self, forKey: .color)
        self.authorIcon = try container.decodeIfPresent(String.self, forKey: .authorIcon)
        self.authorLink = try container.decodeIfPresent(String.self, forKey: .authorLink)
        self.authorName = try container.decodeIfPresent(String.self, forKey: .authorName)
        self.fallback = try container.decodeIfPresent(String.self, forKey: .fallback)
        self.fields = try container.decodeIfPresent([FieldObject].self, forKey: .fields)
        self.footer = try container.decodeIfPresent(String.self, forKey: .footer)
        self.footerIcon = try container.decodeIfPresent(String.self, forKey: .footerIcon)
        self.imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        self.mrkdwnIn = try container.decodeIfPresent([String].self, forKey: .mrkdwnIn)
        self.pretext = try container.decodeIfPresent(String.self, forKey: .pretext)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.thumbUrl = try container.decodeIfPresent(String.self, forKey: .thumbUrl)
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.titleLink = try container.decodeIfPresent(String.self, forKey: .titleLink)
        self.ts = try container.decodeIfPresent(Int.self, forKey: .ts)
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(blocks?.map(AnyLayoutBlock.init), forKey: .blocks)
        try container.encodeIfPresent(color, forKey: .color)
        try container.encodeIfPresent(authorIcon, forKey: .authorIcon)
        try container.encodeIfPresent(authorLink, forKey: .authorLink)
        try container.encodeIfPresent(authorName, forKey: .authorName)
        try container.encodeIfPresent(fallback, forKey: .fallback)
        try container.encodeIfPresent(fields, forKey: .fields)
        try container.encodeIfPresent(footer, forKey: .footer)
        try container.encodeIfPresent(footerIcon, forKey: .footerIcon)
        try container.encodeIfPresent(imageUrl, forKey: .imageUrl)
        try container.encodeIfPresent(mrkdwnIn, forKey: .mrkdwnIn)
        try container.encodeIfPresent(pretext, forKey: .pretext)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(thumbUrl, forKey: .thumbUrl)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(titleLink, forKey: .titleLink)
        try container.encodeIfPresent(ts, forKey: .ts)
    }
    
    public static func == (lhs: SecondaryMessageAttachment, rhs: SecondaryMessageAttachment) -> Bool {
        guard lhs.blocks?.count == rhs.blocks?.count else { return false }
        if let lhsBlocks = lhs.blocks {
            guard lhsBlocks.enumerated().allSatisfy({ $1.isEqual(to: rhs.blocks?[$0]) }) else { return false }
        }
        return
            lhs.color == rhs.color &&
            lhs.authorIcon == rhs.authorIcon &&
            lhs.authorLink == rhs.authorLink &&
            lhs.authorName == rhs.authorName &&
            lhs.fallback == rhs.fallback &&
            lhs.fields == rhs.fields &&
            lhs.footer == rhs.footer &&
            lhs.footerIcon == rhs.footerIcon &&
            lhs.imageUrl == rhs.imageUrl &&
            lhs.mrkdwnIn == rhs.mrkdwnIn &&
            lhs.pretext == rhs.pretext &&
            lhs.text == rhs.text &&
            lhs.thumbUrl == rhs.thumbUrl &&
            lhs.title == rhs.title &&
            lhs.titleLink == rhs.titleLink &&
            lhs.ts == rhs.ts
    }
    
    public enum CodingKeys: String, CodingKey {
        case blocks
        case color
        case authorIcon = "author_icon"
        case authorLink = "author_link"
        case authorName = "author_name"
        case fallback
        case fields
        case footer
        case footerIcon = "footer_icon"
        case imageUrl = "image_url"
        case mrkdwnIn = "mrkdwn_in"
        case pretext
        case text
        case thumbUrl = "thumb_url"
        case title
        case titleLink = "title_link"
        case ts
    }
}
