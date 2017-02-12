# SpriteKit_Custom_Shaders

This project was ported from on online tutorial found [here](http://www.ymc.ch/de/blog/making-a-pixel-shader-for-ios8-with-sprite-kit/#comment-37010)

Original was written in Objective-C using Xcode 8. 

This project was written using Swift 3.0 and Xcode 10. 

The project is largely the same with a few exceptions:

* The SKScene is loaded programmatically, although the code to load directly from .sks remains, but is commented out
* The scene is created programmatically to the size of its view. UIScreen.scale is used to calculate the size uniforms instead of relying on a zooming effect.
* I've commented out the addition of a SKSpriteNode which had no effect on the final scene (assuming no errors).

Notes:
* I've noticed that the reflection shader fails to render about 50% of the time in iOS simulator. There are no errors in the console and no crashes. I'm not sure why.
