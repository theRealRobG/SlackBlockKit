/// All of the Slack APIs that publish messages use a common base structure, called a message
/// payload. This is a JSON object that is used to define metadata about the message, such as
/// where it should be published, as well as its visual composition.
///
/// This is a list of the fields available in that common structure, but you should also consult
/// the reference docs for any messaging APIs you are using to see if there are any additional
/// fields required by those methods. For example, if you're using the Web API to send messages,
/// you'll also need to specify the `channel` where the message should be published.
public struct MessagePayload: Codable, Equatable {
    /// The usage of this field changes depending on whether you're using `blocks` or not. If you
    /// are, this is used as a fallback string to display in notifications. If you aren't, this
    /// is the main body text of the message. It can be formatted as plain text, or with `mrkdwn`.
    /// This field is not enforced as required when using `blocks`, however it is highly recommended
    /// that you include it as the aforementioned fallback.
    public let text: String?
    /// An array of layout blocks in the same format as described in the building blocks guide.
    public let blocks: [LayoutBlock]?
    /// An array of legacy secondary attachments. We recommend you use `blocks` instead.
    public let attachments: [SecondaryMessageAttachment]?
    /// The ID of another un-threaded message to reply to.
    public let threadTs: String?
    /// Determines whether the `text` field is rendered according to `mrkdwn` formatting or not.
    /// Defaults to `true`.
    public let mrkdwn: Bool?
    /// The channel where the message should be published.
    public let channel: String?
    
    public init(
        text: String,
        attachments: [SecondaryMessageAttachment]? = nil,
        threadTs: String? = nil,
        mrkdwn: Bool? = nil,
        channel: String? = nil
    ) {
        self.text = text
        self.blocks = nil
        self.attachments = attachments
        self.threadTs = threadTs
        self.mrkdwn = mrkdwn
        self.channel = channel
    }
    
    public init(
        blocks: [LayoutBlock],
        text: String? = nil,
        attachments: [SecondaryMessageAttachment]? = nil,
        threadTs: String? = nil,
        mrkdwn: Bool? = nil,
        channel: String? = nil
    ) {
        self.text = text
        self.blocks = blocks
        self.attachments = attachments
        self.threadTs = threadTs
        self.mrkdwn = mrkdwn
        self.channel = channel
    }
    
    public init(
        attachments: [SecondaryMessageAttachment],
        text: String? = nil,
        blocks: [LayoutBlock]? = nil,
        threadTs: String? = nil,
        mrkdwn: Bool? = nil,
        channel: String? = nil
    ) {
        self.text = text
        self.blocks = blocks
        self.attachments = attachments
        self.threadTs = threadTs
        self.mrkdwn = mrkdwn
        self.channel = channel
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.text = try container.decodeIfPresent(String.self, forKey: .text)
        self.blocks = try container.decodeIfPresent([AnyLayoutBlock].self, forKey: .blocks)?.map { $0.block }
        self.attachments = try container.decodeIfPresent([SecondaryMessageAttachment].self, forKey: .attachments)
        self.threadTs = try container.decodeIfPresent(String.self, forKey: .threadTs)
        self.mrkdwn = try container.decodeIfPresent(Bool.self, forKey: .mrkdwn)
        self.channel = try container.decodeIfPresent(String.self, forKey: .channel)
        
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(blocks?.map(AnyLayoutBlock.init), forKey: .blocks)
        try container.encodeIfPresent(attachments, forKey: .attachments)
        try container.encodeIfPresent(threadTs, forKey: .threadTs)
        try container.encodeIfPresent(mrkdwn, forKey: .mrkdwn)
        try container.encodeIfPresent(channel, forKey: .channel)
    }
    
    public static func == (lhs: MessagePayload, rhs: MessagePayload) -> Bool {
        guard lhs.blocks?.count == rhs.blocks?.count else { return false }
        if let lhsBlocks = lhs.blocks {
            guard lhsBlocks.enumerated().allSatisfy({ $1.isEqual(to: rhs.blocks?[$0]) }) else { return false }
        }
        return
            lhs.text == rhs.text &&
            lhs.attachments == rhs.attachments &&
            lhs.threadTs == rhs.threadTs &&
            lhs.mrkdwn == rhs.mrkdwn &&
            lhs.channel == rhs.channel
    }
    
    public enum CodingKeys: String, CodingKey {
        case text
        case blocks
        case attachments
        case threadTs = "thread_ts"
        case mrkdwn
        case channel
    }
}
