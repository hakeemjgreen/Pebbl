//
//  Helpers.swift
//  Pebbl
//
//  Created by Hakeem Green on 10/8/22.
//

import Foundation
import UIKit


//Convert colors to HEX
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}


//Set text line height
extension UILabel {
    
    func setLineHeight(lineHeight: CGFloat) {
        guard let text = self.text else { return }
        
        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        
        style.lineSpacing = lineHeight
        attributeString.addAttribute(
            NSAttributedString.Key.paragraphStyle,
            value: style,
            range: NSMakeRange(0, attributeString.length))
        
        self.attributedText = attributeString
    }
    override open func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)

        guard newSuperview != nil else {
            return
        }

        //Change all text color to black
        if #available(iOS 13.0, *) {
            if textColor == UIColor.label {
                textColor = .black
            }
        } else if textColor == UIColor.darkText {
            textColor = .black
        }
    }

}

