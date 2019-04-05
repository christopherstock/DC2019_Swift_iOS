
    import Foundation
    import SpriteKit

    /**
        The player being controlled by the user.
     */
    class Player : GameObject
    {
        /** The player's horizontal moving speed. */
        static let MOVE_VELOCITY :CGFloat = 500.0
        /** The player's jumping force. */
        static let JUMP_VELOCITY :CGFloat = 1000.0

        /** Flags if user shall move left. */
        private var moveLeft  :Bool = false
        /** Flags if user shall move right. */
        private var moveRight :Bool = false
        /** Flags if user shall jump. */
        private var doJump    :Bool = false

        /** The texture for the player moving left. */
        private var leftTexture :SKTexture
        /** The texture for the player moving right. */
        private var rightTexture :SKTexture

        /**
            Creates a new player instance.

            - parmeter scene: The SpriteKit scene to add this game object to.
            - parmeter x:     The startup position x.
            - parmeter y:     The startup position y.
        */
        init( scene: SKScene, x: CGFloat, y: CGFloat )
        {
            leftTexture  = SKTexture( image: UIImage( named: "walkLeft.png"  )! )
            rightTexture = SKTexture( image: UIImage( named: "walkRight.png" )! )

            super.init( scene: scene, x: x, y: y, imageFile: "walkRight.png", physic: Physic.player )

            node.physicsBody?.allowsRotation = false
        }

        /**
            Renders one iteration of the game loop for the player.

            - parameter touchSystem: The app's touch system that determines currently performed touches.
        */
        func render( touchSystem: TouchSystem ) -> Void
        {
            handleTouch( touchSystem: touchSystem )

            checkMovement()
            checkJump()
        }

        /**
            Checks and handles player collisions with the specified items.

            - parameter items: The stack of items to check player collision.
        */
        func checkItemCollision( items: [GameObject] ) -> Void
        {
            for item in items
            {
                if ( item.node.intersects( node ) )
                {
                    let DURATION = 0.3

                    let fadeOut = SKAction.fadeOut( withDuration: DURATION )
                    let rotate  = SKAction.rotate( byAngle: 0.05, duration: DURATION )
                    let scaleUp = SKAction.scale( to: 17.5, duration: DURATION )

                    item.node.run( fadeOut )
                    item.node.run( rotate  )
                    item.node.run( scaleUp )
                }
            }
        }

        /**
            Handles the player's keys for this game loop iteration.

         - parameter touchSystem: The app's touch system that determines currently performed touches.
        */
        func handleTouch( touchSystem: TouchSystem ) -> Void
        {
            moveLeft  = ( touchSystem.swipedLeft  )
            moveRight = ( touchSystem.swipedRight )

            if ( touchSystem.didClick )
            {
                doJump = true
                touchSystem.didClick = false
            }
        }

        /**
            Checks and handles horizontal player movement.
        */
        private func checkMovement() -> Void
        {
            if ( moveLeft && !moveRight )
            {
                node.physicsBody?.velocity.dx = -Player.MOVE_VELOCITY
                node.texture = leftTexture
            }
            else if ( moveRight && !moveLeft )
            {
                node.physicsBody?.velocity.dx = Player.MOVE_VELOCITY
                node.texture = rightTexture
            }
            else
            {
                node.physicsBody?.velocity.dx = 0.0
            }
        }

        /**
            Checks and handles player jumping.
        */
        private func checkJump() -> Void
        {
            if ( doJump  && isVerticalResting() )
            {
                doJump = false
                node.physicsBody?.velocity.dy = Player.JUMP_VELOCITY
            }
        }
    }
