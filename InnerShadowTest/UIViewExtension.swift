
import UIKit

extension UIView
{
    enum innerShadowSide
    {
        case All, Left, Right, Top, Bottom, TopAndLeft, TopAndRight, BottomAndLeft, BottomAndRight, ExceptLeft, ExceptRight, ExceptTop, ExceptBottom
    }
    
    func addInnerShadow(onSide onSide: innerShadowSide, shadowColor: UIColor, shadowSize: CGFloat, cornerRadius: CGFloat, shadowOpacity: CGFloat)
    {
        let shadowLayer = CAShapeLayer()
        shadowLayer.frame = bounds
        
        shadowLayer.shadowColor = UIColor.blackColor().CGColor
        shadowLayer.shadowOffset = CGSizeMake(0.0, 0.0)
        shadowLayer.shadowOpacity = 1.0
        shadowLayer.shadowRadius = shadowSize
        shadowLayer.fillRule = kCAFillRuleEvenOdd
        
        // Outer rectangle to restrict drawing area
        let shadowPath = CGPathCreateMutable()
        let insetRect = CGRectInset(CGRectOffset(frame, -frame.size.width, -frame.size.height), -shadowSize * 2.0, -shadowSize * 2.0)
        
        CGPathAddRect(shadowPath, nil, insetRect)
        
        // Inner path for mask
        let innerFrame: CGRect = { () -> CGRect in
            switch onSide
            {
                case .All:
                    return CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)
                case .Left:
                    return CGRectMake(0.0, -shadowSize * 2.0, frame.size.width + shadowSize * 2.0, frame.size.height + shadowSize * 4.0)
                case .Right:
                    return CGRectMake(-shadowSize * 2.0, -shadowSize * 2.0, frame.size.width + shadowSize * 2.0, frame.size.height + shadowSize * 4.0)
                case .Top:
                    return CGRectMake(-shadowSize * 2.0, 0.0, frame.size.width + shadowSize * 4.0, frame.size.height + shadowSize * 2.0)
                case.Bottom:
                    return CGRectMake(-shadowSize * 2.0, -shadowSize * 2.0, frame.size.width + shadowSize * 4.0, frame.size.height + shadowSize * 2.0)
                case .TopAndLeft:
                    return CGRectMake(0.0, 0.0, frame.size.width + shadowSize * 2.0, frame.size.height + shadowSize * 2.0)
                case .TopAndRight:
                    return CGRectMake(-shadowSize * 2.0, 0.0, frame.size.width + shadowSize * 2.0, frame.size.height + shadowSize * 2.0)
                case .BottomAndLeft:
                    return CGRectMake(0.0, -shadowSize * 2.0, frame.size.width + shadowSize * 2.0, frame.size.height + shadowSize * 2.0)
                case .BottomAndRight:
                    return CGRectMake(-shadowSize * 2.0, -shadowSize * 2.0, frame.size.width + shadowSize * 2.0, frame.size.height + shadowSize * 2.0)
                case .ExceptLeft:
                    return CGRectMake(-shadowSize * 2.0, 0.0, frame.size.width + shadowSize * 2.0, frame.size.height)
                case .ExceptRight:
                    return CGRectMake(0.0, 0.0, frame.size.width + shadowSize * 2.0, frame.size.height)
                case .ExceptTop:
                    return CGRectMake(0.0, -shadowSize * 2.0, frame.size.width, frame.size.height + shadowSize * 2.0)
                case .ExceptBottom:
                    return CGRectMake(0.0, 0.0, frame.size.width, frame.size.height + shadowSize * 2.0)
            }
        }()
        
        let innerPath = UIBezierPath(roundedRect: innerFrame, cornerRadius: cornerRadius).CGPath
        
        CGPathAddPath(shadowPath, nil, innerPath)
        CGPathCloseSubpath(shadowPath)
        
        shadowLayer.path = shadowPath
        
        layer.addSublayer(shadowLayer)
        clipsToBounds = true
    }
}
