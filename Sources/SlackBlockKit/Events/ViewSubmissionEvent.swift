/// Received when a user submits a view in a modal.
public struct ViewSubmissionEvent: SlackEventWrapper, Equatable {
    public static let type: SlackEventWrapperType = .viewSubmission
    /// Helps identify the source of the payload. The `type` for this interaction is `view_submission`.
    public let type: String
    /// The shared-private callback token that authenticates this callback to the application as
    /// having come from Slack. Match this against what you were given when the subscription was
    /// created. If it does not match, do not process the event and discard it.
    public let token: String
    /// The workspace that the interaction happened in.
    public let team: SlackTeam
    /// The user who interacted to trigger this request.
    public let user: SlackUser
    /// The source view of the modal that the user submitted.
    public let view: ModalView
    
    // The following may also appear
    public var apiAppId: String?
    public var isEnterpriseInstall: Bool?
    public var responseUrls: [String]?
    public var triggerId: String?
    
    public init(
        token: String,
        team: SlackTeam,
        user: SlackUser,
        view: ModalView
    ) {
        self.type = Self.type.rawValue
        self.token = token
        self.team = team
        self.user = user
        self.view = view
    }
    
    public enum CodingKeys: String, CodingKey {
        case type
        case token
        case team
        case user
        case view
        case apiAppId = "api_app_id"
        case isEnterpriseInstall = "is_enterprise_install"
        case responseUrls = "response_urls"
        case triggerId = "trigger_id"
    }
}
