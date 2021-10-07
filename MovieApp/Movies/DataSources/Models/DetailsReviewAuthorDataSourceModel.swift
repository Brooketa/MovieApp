struct DetailsReviewAuthorDataSourceModel {

    let authorName: String?
    let authorUsername: String
    let authorAvatarPath: String?

    init(from model: DetailsReviewAuthorClientModel) {
        authorName = model.authorName
        authorUsername = model.authorUsername
        authorAvatarPath = model.authorAvatarPath
    }

}
