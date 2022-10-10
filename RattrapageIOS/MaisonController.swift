import UIKit

func randomCGFloat() -> CGFloat {
return CGFloat(arc4random()) / CGFloat(UInt32.max)}

extension UIColor {
    static func randomColor() -> UIColor {
        let r = randomCGFloat()
        let g = randomCGFloat()
        let b = randomCGFloat()

        // If you wanted a random alpha, just create another
        // random number for that too.
        return UIColor(red: r, green: g, blue: b, alpha: 1.0)
    }
}

class MaisonViewController: UIViewController {
    @IBOutlet weak var showText: UILabel!
    @IBOutlet weak var changeBackground: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        showText
            .textColor = UIColor.randomColor()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
