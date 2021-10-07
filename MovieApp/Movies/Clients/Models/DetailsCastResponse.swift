struct DetailsCastResponse: Decodable {

    let castID: Int
    let castName: String
    let castRole: String
    let castCharacter: String
    let castProfileImagePath: String?

    enum CodingKeys: String, CodingKey {
        case castID = "id"
        case castName = "name"
        case castRole = "known_for_department"
        case castCharacter = "character"
        case castProfileImagePath = "profile_path"
    }

}
