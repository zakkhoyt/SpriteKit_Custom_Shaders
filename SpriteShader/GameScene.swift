//
//  GameScene.swift
//  SpriteShader
//
//  Created by Zakk Hoyt on 2/11/17.
//  Copyright © 2017 Zakk Hoyt. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    
    override func didMove(to view: SKView) {

        // Shader work with pixels, not points like we are used to on iOS. Store scale for use below.
        let scale = UIScreen.main.scale
        
        // Setup a container sprite for the shader that makes the movement
        // We are using an empty image in a sprite node because sprite nodes allow you to specify size, and shader.
        let moveNode = SKSpriteNode(imageNamed: "dummypixel")
        moveNode.position = CGPoint(x: frame.midX, y: frame.midY)
        moveNode.size = frame.size
        addChild(moveNode)
        // Create the shader from a shader-file
        let moveShader = SKShader(fileNamed: "shader_water_movement.fsh")
        // Set variables that are used in the shader script
        moveShader.uniforms = [
            SKUniform(
                name: "size",
                vectorFloat3: vector_float3(Float(scale * frame.width), Float(scale * frame.height), 0)
            ),
            SKUniform(
                name: "customTexture",
                texture: SKTexture(imageNamed: "sand")
            ),
        ]
        //Add the shader to the sprite
        moveNode.shader = moveShader
        
        
        // Setup a container sprite for the shader that makes the reflections
        // NOTE: It is necessary to modify your Info.plist to get this shader to work
        // PrefersOpenGL = YES
        let reflectNode = SKSpriteNode(imageNamed: "dummypixel")
        reflectNode.position = CGPoint(x: frame.midX, y: frame.midY)
        reflectNode.size = frame.size
        addChild(reflectNode)
        // Create the shader from a shader-file
        let reflectShader = SKShader(fileNamed: "shader_water_reflection.fsh")
        // Set vairiables that are used in the shader script
        reflectShader.uniforms = [
            SKUniform(
                name: "size",
                vectorFloat3: vector_float3(Float(scale * frame.width), Float(scale * frame.height), 0)
            ),
        ]
        // Add the shader to the sprite
        reflectNode.shader = reflectShader

        /* I'm not sure why original author included the following code. It gets obscured by the above. Maybe in case the above fails, but why not add "sand" instead of "beach"? */
//        //just add sand sprite only to look good :-)
//        let beachNode = SKSpriteNode(imageNamed: "beach")
//        beachNode.position = CGPoint(x: frame.midX, y: frame.midY)
//        beachNode.size = self.size
//        addChild(beachNode)
    }
}
