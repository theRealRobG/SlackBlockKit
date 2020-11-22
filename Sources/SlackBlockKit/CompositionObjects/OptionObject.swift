/// An object that represents a single selectable item in a select menu,
/// multi-select menu, checkbox group, radio button group, or overflow menu.
public struct OptionObject: Codable, Equatable {
    /// A text object that defines the text shown in the option on the menu.
    /// Overflow, select, and multi-select menus can only use `plain_text` objects,
    /// while radio buttons and checkboxes can use `mrkdwn` text objects. Maximum
    /// length for the `text` in this field is 75 characters.
    public let text: TextObject
    /// The string value that will be passed to your app when this option is chosen.
    /// Maximum length for this field is 75 characters.
    public let value: String
    /// A `plain_text` only text object that defines a line of descriptive text shown
    /// below the `text` field beside the radio button. Maximum length for the `text`
    /// object within this field is 75 characters.
    public let description: TextObject?
    /// A URL to load in the user's browser when the option is clicked.
    /// **The** `url` **attribute is only available in overflow menus.** Maximum length
    /// for this field is 3000 characters. If you're using `url`, you'll still receive
    /// an interaction payload and will need to send an acknowledgement response.
    public let url: String?
    
    public init(
        text: TextObject,
        value: String,
        description: TextObject? = nil,
        url: String? = nil
    ) {
        self.text = text
        self.value = value
        self.description = description
        self.url = url
    }
}
