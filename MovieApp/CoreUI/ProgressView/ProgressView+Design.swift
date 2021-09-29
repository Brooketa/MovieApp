import UIKit
import SnapKit

extension ProgressView: ConstructViewsProtocol {
    func buildViews() {
        createViews()
        styleViews()
    }

    func createViews() {
        createBackgroundLayer()

        progressLayer = CAShapeLayer()
        layer.addSublayer(progressLayer)

        progressLabel = UILabel()
        addSubview(progressLabel)
    }

    func styleViews() {
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.lightGreen.cgColor
        progressLayer.lineWidth = 4
        progressLayer.lineCap = .round
        progressLayer.lineJoin = .round

        progressLabel.textColor = .white
        progressLabel.textAlignment = .center
    }

    func defineLayoutForViews() {
        progressLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    private func createBackgroundLayer() {
        let backgroundPath = UIBezierPath(ovalIn: CGRect(origin: .zero, size: frame.size))
        let backgroundLayer = CAShapeLayer()
        backgroundLayer.path = backgroundPath.cgPath
        backgroundLayer.opacity = 0.2
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.strokeColor = UIColor.lightGreen.cgColor
        backgroundLayer.lineWidth = 3.5
        layer.addSublayer(backgroundLayer)
    }
}
