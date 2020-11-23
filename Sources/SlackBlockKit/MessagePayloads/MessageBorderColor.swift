public enum MessageBorderColor: RawRepresentable, Codable, Equatable {
    case good
    case warning
    case danger
    case custom(hexColorCode: String)
    
    public var rawValue: String {
        switch self {
        case .good: return "good"
        case .warning: return "warning"
        case .danger: return "danger"
        case .custom(let hexColorCode): return hexColorCode
        }
    }
    
    public init?(rawValue: String) {
        switch rawValue {
        case "good": self = .good
        case "warning": self = .warning
        case "danger": self = .danger
        default:
            guard rawValue.count == 7, rawValue.first == "#" else { return nil }
            guard rawValue.lowercased().dropFirst().allSatisfy({ Self.hexCharacters.contains(String($0)) }) else {
                return nil
            }
            self = .custom(hexColorCode: rawValue)
        }
    }
    
    private static let hexCharacters = Array(0...9).map(String.init) + ["a", "b", "c", "d", "e", "f"]
}
