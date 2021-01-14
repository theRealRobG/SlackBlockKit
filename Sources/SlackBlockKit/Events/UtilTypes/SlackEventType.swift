public enum SlackEventType: String, Codable {
    case appHomeOpened = "app_home_opened"
    
    var eventMetaType: SlackEvent.Type {
        switch self {
        case .appHomeOpened: return AppHomeOpenedEvent.self
        }
    }
}
