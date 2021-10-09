//
//  ButtonFactory.swift
//  InvestmentGame
//
//  Created by Daniil on 09.10.2021.
//

import UIKit

//final class ButtonFactory {
//  static func makePinkButton() -> UIButton {
//    let button = UIButton(type: .system)
//      .setTitleFont(.body16)
//      .setTitleColor(.base0)
//      .makeCornerRadius(radius: 28)
//      .addGradient(colors: UIColor.buttonGradient)
//      .addShadow()
//    return button
//  }
//
//  static func makeWhiteButton() -> UIButton {
//    let button = UIButton(type: .system)
//      .setTitleFont(.body16)
//      .setTitleColor(.base1)
//      .setBackgroundColor(.base0)
//      .makeCornerRadius(radius: 28)
//      .addShadow()
//    return button
//  }
//}

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
