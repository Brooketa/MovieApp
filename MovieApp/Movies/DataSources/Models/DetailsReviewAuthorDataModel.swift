struct DetailsReviewAuthorDataModel {

    let authorName: String?
    let authorUsername: String
    let authorAvatarPath: String?

    init(from model: DetailsReviewAuthorResponse) {
        authorName = model.authorName
        authorUsername = model.authorUsername
        authorAvatarPath = model.authorAvatarPath
    }

}
