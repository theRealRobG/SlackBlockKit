/// Determines when a plain-text input element will return a `block_actions`
/// interaction payload.
public struct DispatchActionConfiguration: Codable {
    /// An array of interaction types that you would like to receive a `block_actions`
    /// payload for.
    ///
    /// Should be one or both of:
    ///   - `on_enter_pressed` — payload is dispatched when user presses the enter key
    ///   while the input is in focus. Hint text will appear underneath the input explaining
    ///   to the user to press enter to submit.
    ///   - `on_character_entered` — payload is dispatched when a character is entered
    ///   (or removed) in the input.
    public let triggerActionsOn: [InteractionType]?
    
    public init(triggerActionsOn: [InteractionType]? = nil) {
        self.triggerActionsOn = triggerActionsOn
    }
    
    public enum CodingKeys: String, CodingKey {
        case triggerActionsOn = "trigger_actions_on"
    }
}

public extension DispatchActionConfiguration {
    enum InteractionType: String, Codable {
        case onEnterPressed = "on_enter_pressed"
        case onCharacterEntered = "on_character_entered"
    }
}
