
    import SpriteKit
    import Foundation

    /**
        The game workshop context.
    */
    class Workshop
    {
        /** The custom implementation of the SpriteKit scene. */
        var scene     :Scene
        /** The key system. */
        var keySystem :KeySystem
        /** The game level instance. */
        var level     :Level

        /**
            Creates a new game workshop instance.

            - parameter appendTo: The native view to append the workshop game view to.
        */
        init( appendTo viewHost: UIView )
        {
            scene     = Scene()
            keySystem = KeySystem()
            level     = Level( scene: scene )

            appendWorkshopView( to: viewHost )

            scene.setGameLoop( self )
        }

        /**
            Appends the game workshop's SpriteKit view to the specified ViewController view
            and adjusts the ViewController view to the SpriteKit view size.

            - parameter to: The native view to append the workshop game view to.
        */
        private func appendWorkshopView( to view: UIView )
        {
            view.addSubview( scene.skView )
            view.frame.size = scene.skView.frame.size
        }
    }

    /**
        Extends the game workshop with game loop functionality.
    */
    extension Workshop : GameLoop
    {
        /**
            Renders one iteration of the game loop.
        */
        func render() -> Void
        {
            level.render( keySystem: keySystem )

            scene.moveCameraTo( target: level.getPlayerPosition() );

            level.applyParallaxScrolling( camera: scene.camera! )
        }
    }
