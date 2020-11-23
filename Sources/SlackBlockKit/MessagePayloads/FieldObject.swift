/// Extra field information to show in the attachment
public struct FieldObject: Codable, Equatable {
    /// Shown as a bold heading displayed in the field object. It cannot contain
    /// markup and will be escaped for you.
    public let title: String?
    /// The text value displayed in the field object. It can be formatted as plain
    /// text, or with `mrkdwn` by using the `mrkdwn_in` option in
    /// `SecondaryMessageAttachment`.
    public let value: String?
    /// Indicates whether the field object is short enough to be displayed side-by-side
    /// with other field objects. Defaults to `false`.
    public let short: Bool?
    
    public init(
        title: String?,
        value: String?,
        short: Bool?
    ) {
        self.title = title
        self.value = value
        self.short = short
    }
}
