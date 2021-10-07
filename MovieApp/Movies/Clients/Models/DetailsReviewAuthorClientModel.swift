struct DetailsReviewAuthorClientModel: Codable {

    let authorName: String?
    let authorUsername: String
    let authorAvatarPath: String?

    enum CodingKeys: String, CodingKey {
        case authorName = "name"
        case authorUsername = "username"
        case authorAvatarPath = "avatar_path"
    }

}
