public enum BlockType: String, Codable {
    case button
    case checkboxes
    case datepicker
    case image
    case multiConversationsSelect = "multi_conversations_select"
    case multiExternalSelect = "multi_external_select"
    case multiChannelsSelect = "multi_channels_select"
    case multiStaticSelect = "multi_static_select"
    case multiUsersSelect = "multi_users_select"
    case overflow
    case plainTextInput = "plain_text_input"
    case radioButtons = "radio_buttons"
    case conversationsSelect = "conversations_select"
    case externalSelect = "external_select"
    case channelsSelect = "channels_select"
    case staticSelect = "static_select"
    case usersSelect = "users_select"
    case timepicker
}
