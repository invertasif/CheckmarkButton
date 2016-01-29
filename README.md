# CheckmarkButton
Button animation in Playgrounds (new in Xcode 7.3)

👻👻👻👻👻👻👻👻👻👻👻👻

![](http://g.recordit.co/RG6lWJQXuz.gif)


## How to use ?

Just use the class Checkmark which is an subclass of UIButton
use the CheckamarkDelegate to check if the button was pressed.
You can customize the linewidth of the checkmark and checkmarkcolor.

```
class ButtonViewController : UIViewController,CheckamarkDelegate{
    
    var buttonView: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        self.view.backgroundColor = UIColor.whiteColor()
        
        let checkMark = Checkmark(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        checkMark.backgroundColor = UIColor(red:0.92, green:0.11, blue:0.4, alpha:1)
        checkMark.center = self.view.center
        checkMark.delegate = self
        
        
        checkMark.lineWidth = 9.0
        checkMark.checkmarkColor = UIColor.whiteColor()
        
        self.view.addSubview(checkMark)
        
    }
    
    
    func pressedCheckmark(checkmark: Checkmark) {
        print("Wuhhuuuu 👻 do some stuff")
    }

    
}
```
