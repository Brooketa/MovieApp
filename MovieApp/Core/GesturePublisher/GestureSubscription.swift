import Combine
import UIKit

class GestureSubscription<S: Subscriber>: Subscription where S.Input == GestureType, S.Failure == Never {

    private var subscriber: S?
    private var gestureType: GestureType
    private var view: UIView

    init(subscriber: S, view: UIView, gestureType: GestureType) {
        self.subscriber = subscriber
        self.view = view
        self.gestureType = gestureType

        configureGesture(gestureType)
    }

    func request(_ demand: Subscribers.Demand) { }

    func cancel() {
        subscriber = nil
    }

    private func configureGesture(_ gestureType: GestureType) {
        let recognizer = gestureType.recognizer
        recognizer.addTarget(self, action: #selector(handler))
        view.addGestureRecognizer(recognizer)
    }

    @objc private func handler() {
        _ = subscriber?.receive(gestureType)
    }
}
