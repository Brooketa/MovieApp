struct DetailsCastNetworkModel: Codable {

    let id: Int
    let response: [DetailsCastClientModel]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case response = "cast"
    }

}
