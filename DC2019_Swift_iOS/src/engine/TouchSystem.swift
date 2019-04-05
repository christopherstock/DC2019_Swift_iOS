
    import SpriteKit
    import Foundation

    /**
        The input controller that recognizes touch events.
    */
    class TouchSystem
    {
        /** Flags the 'pressed' state for all keyCodes. */
//        var pressed :[UInt16:Bool] = [:]

        /**
            Creates a new key system by adding event monitoring for key up and down events.
        */
        init()
        {
/*
            UIEvent.addLocalMonitorForEvents( matching: . )
            {
                self.onKeyDown( event: $0 )

                // returning 'nil' indicates the event as handled
                return nil
            }

            UIEvent.addLocalMonitorForEvents( matching: .keyUp )
            {
                self.onKeyUp( event: $0 )

                // returning 'nil' indicates the event as handled
                return nil
            }
*/
        }

        /**
            Determines if a key is currently pressed.

            - parameter keyCode: The keyCode to determine pressed behaviour for.

            - return: *true* if the key with the queried keyCode is currently pressed. Otherwise *false*.
        */
/*
        func isPressed( keyCode:KeyCode ) -> Bool
        {
            if let pressed = pressed[ keyCode.rawValue ]
            {
                return pressed
            }

            return false
        }
*/
        /**
            Being invoked when a key is pressed.

            - parameter event: The event object that contains all information about the key down event.
        */
/*
        private func onKeyDown( event:UIEvent ) -> Void
        {
//            pressed[ event.keyCode ] = true
        }
*/
        /**
            Being invoked when a key is released.

            - parameter event: The event object that contains all information about the key up event.
        */
/*
        private func onKeyUp( event:UIEvent ) -> Void
        {
//            pressed[ event.keyCode ] = false
        }
*/
    }
