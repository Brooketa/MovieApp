struct DetailsReviewAuthorRepositoryModel {

    let authorName: String?
    let authorUsername: String
    let authorAvatarPath: String?

    init(from model: DetailsReviewAuthorDataModel) {
        authorName = model.authorName
        authorUsername = model.authorUsername
        authorAvatarPath = model.authorAvatarPath
    }

}
