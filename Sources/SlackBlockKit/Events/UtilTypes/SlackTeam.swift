/// The workspace that the interaction happened in.
public struct SlackTeam: Codable, Equatable {
    public let id: String
    public let domain: String
    
    public init(id: String, domain: String) {
        self.id = id
        self.domain = domain
    }
}
