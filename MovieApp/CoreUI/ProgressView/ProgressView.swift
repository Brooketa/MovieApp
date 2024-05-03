import UIKit

class ProgressView: UIView {

    var progressLayer: CAShapeLayer!
    var progressLabel: UILabel!

    private let progressValueAttributes = [NSAttributedString.Key.font: UIFont.heading3Heavy]
    private let percentAttributes = [NSAttributedString.Key.font: UIFont.textVerySmall]

    init() {
        super.init(frame: .zero)

        buildViews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        buildViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didMoveToSuperview() {
        defineLayoutForViews()
    }

    func setProgress(progress: CGFloat = 0) {
        let maxAngle: Double = .pi * 2
        let startAngle = -.pi * 0.5
        let endAngle = startAngle + maxAngle * progress

        let path = UIBezierPath(
            arcCenter: CGPoint(x: frame.width / 2, y: frame.width / 2),
            radius: frame.width / 2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)

        progressLayer.path = path.cgPath
        progressLayer.add(makeProgressAnimation(), forKey: "progressValueAnimation")

        setProgressLabelText(progress: progress)
    }

    private func setProgressLabelText(progress: CGFloat) {
        let value = Int(progress * 100)

        let progressString = NSMutableAttributedString(string: "\(value)", attributes: progressValueAttributes)
        let percentString = NSAttributedString(string: "%", attributes: percentAttributes)
        progressString.append(percentString)

        progressLabel.attributedText = progressString
    }

    private func makeProgressAnimation() -> CABasicAnimation {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.timingFunction = .init(name: .easeInEaseOut)

        return animation
    }
}
