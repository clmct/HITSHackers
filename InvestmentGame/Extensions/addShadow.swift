import UIKit

extension UIView {
  @discardableResult
  func addShadow() -> UIView {
    layer.shadowColor = UIColor.gray.cgColor
    layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
    layer.shadowOpacity = 1
    layer.shadowRadius = 24
    return self
  }
}
