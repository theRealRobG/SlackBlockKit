/// The user who interacted to trigger this request.
public struct SlackUser: Codable, Equatable {
    public let id: String
    public let username: String?
    public let name: String?
    public let teamId: String?
    
    public init(
        id: String,
        username: String? = nil,
        name: String? = nil,
        teamId: String? = nil
    ) {
        self.id = id
        self.username = username
        self.name = name
        self.teamId = teamId
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case username
        case name
        case teamId = "team_id"
    }
}
