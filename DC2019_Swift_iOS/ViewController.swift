
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        let workshop = Workshop( appendTo: self.view )
    }

    /**
     *  Being invoked from the system when a touch operation has started.
     */
    override func touchesBegan( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        print( ">>> Touches began" )

        if let firstTouch:UITouch = event?.allTouches?.first
        {
/*
            touch.onTouchDown(
                point: firstTouch.location( in: self )
            )
*/
        }
    }

    /**
     *  Being invoked from the system when a touch operation has ended.
     */
    override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        print( ">>> Touches moved" )

        if let firstTouch:UITouch = event?.allTouches?.first
        {
/*
            touch.onTouchMove(
                point: firstTouch.location( in: self )
            )
*/
        }
    }

    /**
     *  Being invoked from the system when a touch operation is moving.
     */
    override func touchesEnded( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        print( ">>> Touches ended" )

        if let firstTouch:UITouch = event?.allTouches?.first
        {
/*
            touch.onTouchUp(
                point: firstTouch.location( in: self )
            )
*/
        }
    }

    /**
     *  Being invoked from the system when a touch operation is cancelled.
     */
    override func touchesCancelled( _ touches: Set<UITouch>, with event: UIEvent? )
    {
        print( ">>> Touches cancelled" )

        if let firstTouch:UITouch = event?.allTouches?.first
        {
/*
            touch.onTouchUp(
                point: firstTouch.location( in: self )
            )
*/
        }
    }
}
