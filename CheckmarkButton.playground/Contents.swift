//: Playground - noun: a place where people can play

import UIKit
import XCPlayground


protocol CheckamarkDelegate : class{
    func pressedCheckmark(_ checkmark : Checkmark)
}

class Checkmark : UIButton, CAAnimationDelegate {
    
    
    // The linewidth of the Checkmark
    var lineWidth: CGFloat?
    // The checkmarkColor
    var checkmarkColor: UIColor?
    //Delegate for the action
    weak var delegate: CheckamarkDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            self.layer.cornerRadius = self.frame.width / 2
            self.layer.masksToBounds = true
            self.startAnimaion()
            self.addTarget(self, action: #selector(Checkmark.didPressed(_:)), for: .touchDown)
    }
    
   required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func startAnimaion() -> Void{
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.layer.opacity = 0.0
            
        }) { (sucess) in
            UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: UIViewAnimationOptions(), animations: {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.layer.opacity = 1.0
            }) { (sucess) in
                UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: UIViewAnimationOptions(), animations: {
                    
                    
                }) { (sucess) in
                    
                    self.drawfirstLine(CGPoint(x: self.frame.width / 3.2, y: self.frame.width / 1.6), end:CGPoint(x: self.frame.width / 2.2, y: self.frame.width / 1.3), view: self)
                    
                }
                
            }
            
        }
        
    }
    
    func drawfirstLine(_ start : CGPoint,end : CGPoint, view:UIView){
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineCap = kCALineJoinRound
        shapeLayer.strokeColor = self.checkmarkColor?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = self.lineWidth == nil ? 13.0 : self.lineWidth!
        shapeLayer.strokeEnd = 1.0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.8
        animation.speed = 1.8
        animation.delegate = self
        view.layer.addSublayer(shapeLayer)
        shapeLayer.add(animation, forKey: animation.keyPath)
    }
    
    func drawsecondLine(_ start : CGPoint,end : CGPoint, view:UIView){
        let path = UIBezierPath()
        path.move(to: start)
        path.addLine(to: end)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.lineCap = kCALineJoinRound
        shapeLayer.strokeColor = self.checkmarkColor?.cgColor ?? UIColor.white.cgColor
        shapeLayer.lineWidth = self.lineWidth == nil ? 13.0 : self.lineWidth!
        shapeLayer.strokeEnd = 1.0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.5
        animation.speed = 2.1
        view.layer.addSublayer(shapeLayer)
        shapeLayer.add(animation, forKey: animation.keyPath)
    }


    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if flag == true {
            self.drawsecondLine(CGPoint(x: self.frame.width / 2.2, y: self.frame.width / 1.3), end: CGPoint(x: self.frame.width / 1.5, y: self.frame.width / 3.9), view: self)
        }
    }

    
    func didPressed(_ sender: UIButton) {
        self.delegate?.pressedCheckmark(self)
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: UIViewAnimationOptions(), animations: {
            self.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (sucess) in
            UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            }) { (sucess) in
                
                
            }
            
        }
    }
}


//--------------------------------------------------------------//

class ButtonViewController : UIViewController,CheckamarkDelegate{
    
    var buttonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        self.view.backgroundColor = UIColor.white
        
        let checkMark = Checkmark(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        checkMark.backgroundColor = UIColor(red:0.92, green:0.11, blue:0.4, alpha:1)
        checkMark.center = self.view.center
        checkMark.delegate = self
        
        
        checkMark.lineWidth = 9.0
        checkMark.checkmarkColor = UIColor.white
        
        self.view.addSubview(checkMark)
        
    }
    
    
    func pressedCheckmark(_ checkmark: Checkmark) {
        print("Wuhhuuuu 👻 do some stuff")
    }

    
}


var buttonVC = ButtonViewController()
XCPlaygroundPage.currentPage.liveView = buttonVC.view











