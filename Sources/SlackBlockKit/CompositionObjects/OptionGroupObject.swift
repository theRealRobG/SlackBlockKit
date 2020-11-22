/// Provides a way to group options in a select menu or multi-select menu.
public struct OptionGroupObject: Codable, Equatable {
    /// A `plain_text` only text object that defines the label shown above this
    /// group of options. Maximum length for the `text` in this field is 75 characters.
    public let label: TextObject
    /// An array of option objects that belong to this specific group. Maximum of 100 items.
    public let options: [OptionObject]
    
    public init(
        label: TextObject,
        options: [OptionObject]
    ) {
        self.label = label
        self.options = options
    }
}
