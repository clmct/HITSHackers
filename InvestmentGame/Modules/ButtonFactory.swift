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
//
//extension UIButton {
//
//  @discardableResult
//  func makeCornerRadius(radius: CGFloat) -> UIButton {
//    layer.cornerRadius = radius
//    return self
//  }
//
//  @discardableResult
//  func setTitle( title: String) -> UIButton {
//    setTitle(title, for: .normal)
//    return self
//  }
//
//  @discardableResult
//  func setTitleColor( color: UIColor) -> UIButton {
//    setTitleColor(color, for: .normal)
//    return self
//  }
//
//  @discardableResult
//  func setBackgroundColor( color: UIColor) -> UIButton {
//    backgroundColor = color
//    return self
//  }
//
//  @discardableResult
//  func setTitleFont( font: UIFont) -> UIButton {
//    titleLabel?.font = font
//    return self
//  }
//
//  @discardableResult
//  func setBorder(color: UIColor, width: CGFloat) -> UIButton {
//    layer.borderColor = color.cgColor
//    layer.borderWidth = width
//    return self
//  }
//
//  @discardableResult
//  func addGradient(colors: [UIColor]) -> UIButton {
//    addGradient(colors: colors, direction: .horizontal)
//    return self
//  }
//
//  @discardableResult
//  func addShadow() -> UIButton {
//    layer.shadowColor = UIColor.shadow.cgColor
//    layer.shadowOffset = CGSize(width: 0.0, height: 4.0)
//    layer.shadowOpacity = 1
//    layer.shadowRadius = 24
//    return self
//  }
//}
