
import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.blue.withAlphaComponent(0.5)
        
        let innerFrame = CGRect(x: 50, y: 100, width: 100, height: 100)
        
        let innerView = UIView(frame: innerFrame)
        
        innerView.backgroundColor = UIColor.cyan
        
        innerView.addInnerShadow(onSide: UIView.innerShadowSide.bottomAndLeft, shadowColor: UIColor.red, shadowSize: 10.0, shadowOpacity: 10.0)
        
        view.addSubview(innerView)
    }
}
