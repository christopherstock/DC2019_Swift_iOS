
    import UIKit

    class ViewController: UIViewController
    {
        var workshop :Workshop?

        override func viewDidLoad()
        {
            super.viewDidLoad()

            // Do any additional setup after loading the view, typically from a nib.
            workshop = Workshop( appendTo: self.view )
        }

        /**
         *  Being invoked from the system when a touch operation has started.
         */
        override func touchesBegan( _ touches: Set<UITouch>, with event: UIEvent? )
        {
            if let firstTouch:UITouch = event?.allTouches?.first,
               let workshop = workshop
            {
                workshop.touchSystem.onTouchDown(
                    point: firstTouch.location( in: self.view )
                )
            }
        }

        /**
         *  Being invoked from the system when a touch operation has ended.
         */
        override func touchesMoved( _ touches: Set<UITouch>, with event: UIEvent? )
        {
            if let firstTouch:UITouch = event?.allTouches?.first,
               let workshop = workshop
            {
                workshop.touchSystem.onTouchMove(
                    point: firstTouch.location( in: self.view )
                )
            }
        }

        /**
         *  Being invoked from the system when a touch operation is moving.
         */
        override func touchesEnded( _ touches: Set<UITouch>, with event: UIEvent? )
        {
            if let firstTouch:UITouch = event?.allTouches?.first,
               let workshop = workshop
            {
                workshop.touchSystem.onTouchUp(
                    point: firstTouch.location( in: self.view )
                )
            }
        }

        /**
         *  Being invoked from the system when a touch operation is cancelled.
         */
        override func touchesCancelled( _ touches: Set<UITouch>, with event: UIEvent? )
        {
            if let firstTouch:UITouch = event?.allTouches?.first,
               let workshop = workshop
            {
                workshop.touchSystem.onTouchUp(
                    point: firstTouch.location( in: self.view )
                )
            }
        }
    }
