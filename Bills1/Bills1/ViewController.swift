import UIKit

extension UIColor {
    convenience init?(hex: String) {
        if hex.first != "#" || hex.count != 7 && hex.count != 9 {
            return nil
        }
        guard let valueR = Int(hex.prefix(3).suffix(2), radix: 16),
              let valueG = Int(hex.prefix(5).suffix(2), radix: 16),
              let valueB = Int(hex.prefix(7).suffix(2), radix: 16) else {
            return nil
        }

        let redVal = CGFloat(valueR)
        let greenVal = CGFloat(valueG)
        let blueVal = CGFloat(valueB)
        var alphaVal: CGFloat = 1
        if hex.count == 9 {
            if let valueA = Int(hex.prefix(3).suffix(2), radix: 16) {
                alphaVal = CGFloat(valueA)
            }
        }
        self.init(red: redVal / 255, green: greenVal / 255, blue: blueVal / 255, alpha: alphaVal / 255)
    }
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let layer = CAGradientLayer()
        let customBlue = UIColor(hex: "#2a83e8")!//"#eaddc3")!//#EADDC3 //"#2a83e8"
        //let customWhite = UIColor(hex: "#e9e9e9")!
        let customYellow = UIColor(hex: "#fac043")!//"#7da8d4")! //"#fac043"
        layer.colors = [customYellow.cgColor, UIColor.white.cgColor, customBlue.cgColor]
        layer.frame = view.frame
        layer.locations = [0,0.5]
        view.layer.insertSublayer(layer, at: 0)
    }
}

