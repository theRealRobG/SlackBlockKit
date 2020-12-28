public struct StateValueSelectedOption: Codable, Equatable {
    public let text: TextObject
    public let value: String
    public let description: TextObject?
    
    public init(text: TextObject, value: String, description: TextObject?) {
        self.text = text
        self.value = value
        self.description = description
    }
}
