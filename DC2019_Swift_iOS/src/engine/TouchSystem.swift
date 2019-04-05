
    import SpriteKit
    import Foundation

    /**
        The input controller that recognizes touch events.
    */
    class TouchSystem
    {
        /** Indicates swipe left. */
        var swipedLeft  :Bool
        /** Indicates swipe right. */
        var swipedRight :Bool
        /** Indicates a click. */
        var didClick    :Bool

        /** Stores the last touch location point. */
        private var lastTouchLocation :CGPoint?

        /**
         *  Creates a new instance of the touch system.
         */
        init()
        {
            swipedLeft  = false
            swipedRight = false
            didClick    = false
        }

        /**
         *  Being invoked when the touch is down.
         *
         *  @param point The point where the touch went down.
         */
        func onTouchDown( point:CGPoint ) -> Void
        {
            lastTouchLocation = point
            swipedLeft        = false
            swipedRight       = false
            didClick          = false
        }

        /**
         *  Being invoked when the touch is up.
         *
         *  @param point The point where the touch went up.
         */
        func onTouchUp( point:CGPoint ) -> Void
        {
            lastTouchLocation = nil
            swipedLeft        = false
            swipedRight       = false
            didClick          = true
        }

        /**
         *  Being invoked when the touch is moved.
         *
         *  @param point The point where the touch moved to.
         */
        func onTouchMove( point:CGPoint ) -> Void
        {
            swipedLeft  = false
            swipedRight = false
            didClick    = false

            if let location = lastTouchLocation
            {
                if ( point.x < location.x )
                {
                    swipedLeft = true
                }
                else if ( point.x > location.x )
                {
                    swipedRight = true
                }
            }

            lastTouchLocation = point
        }
    }
