
import UIKit

class ViewController: UIViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.redColor()
        
        let innerFrame = CGRectMake(100, 100, 100, 100)
        
        let innerView = UIView(frame: innerFrame)
        
        innerView.backgroundColor = UIColor.greenColor()
        
        innerView.addInnerShadow(onSide: UIView.innerShadowSide.BottomAndLeft, shadowColor: UIColor.blackColor(), shadowSize: 10.0, cornerRadius: 0.0, shadowOpacity: 1.0)
        
        view.addSubview(innerView)
    }
}

