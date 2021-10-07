struct DetailsTopCastViewModel {

    let topCast: [TopBilledCastViewModel]

    init(from models: [DetailsCastUseCaseModel]) {
        topCast = models.map { TopBilledCastViewModel(from: $0) }
    }

}
