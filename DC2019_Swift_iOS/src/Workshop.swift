
    import SpriteKit
    import Foundation

    /**
        The game workshop context.
    */
    class Workshop
    {
        /** The custom implementation of the SpriteKit scene. */
        var scene       :Scene
        /** The touch system. */
        var touchSystem :TouchSystem
        /** The game level instance. */
        var level       :Level

        /**
            Creates a new game workshop instance.

            - parameter appendTo: The native view to append the workshop game view to.
        */
        init( appendTo viewHost: UIView )
        {
            scene = Scene(
                width:  viewHost.frame.width,
                height: viewHost.frame.height
            )
            touchSystem = TouchSystem()
            level       = Level( scene: scene )

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
            view.backgroundColor = UIColor.black
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
            level.render( touchSystem: touchSystem )

            scene.moveCameraTo( target: level.getPlayerPosition() );

            level.applyParallaxScrolling( scene: scene, camera: scene.camera! )
        }
    }
