import MetalKit

class SandboxScene: Scene{
    
    var debugCamera = DebugCamera()
    var cruiser = Cruiser()
    var leftSun = Sun()
    var middleSun = Sun()
    var rightSun = Sun()
    override func buildScene() {
        debugCamera.setPosition(float3(0,0,6))
        addCamera(debugCamera)
        
        leftSun.setPosition(float3(-1, 1, 0))
        leftSun.setMaterialIsLit(false)
        leftSun.setMaterialColor(float4(1,0,0,1))
        leftSun.setLightColor(float3(1,0,0))
        addLight(leftSun)
        
        middleSun.setPosition(float3(0, 1, 0))
        middleSun.setMaterialIsLit(false)
        middleSun.setLightBrightness(0.3)
        middleSun.setMaterialColor(float4(1,1,1,1))
        middleSun.setLightColor(float3(1,1,1))
        addLight(middleSun)
        
        rightSun.setPosition(float3( 1, 1, 0))
        rightSun.setMaterialIsLit(false)
        rightSun.setMaterialColor(float4(0,0,1,1))
        rightSun.setLightColor(float3(0,0,1))
        addLight(rightSun)
        
        cruiser.setMaterialAmbient(0.01)
        cruiser.setRotationX(0.3)
        cruiser.setMaterialShininess(50)
        addChild(cruiser)
    }
    
    override func doUpdate() {
        if(Mouse.IsMouseButtonPressed(button: .left)){
            cruiser.rotateX(Mouse.GetDY() * GameTime.DeltaTime)
            cruiser.rotateY(Mouse.GetDX() * GameTime.DeltaTime)
        }
        
        leftSun.setPositionX(cos(GameTime.TotalGameTime) - 1)
        middleSun.setPositionX(cos(GameTime.TotalGameTime))
        rightSun.setPositionX(cos(GameTime.TotalGameTime) + 1)
        
        cruiser.setMaterialShininess(cruiser.getShininess() + Mouse.GetDWheel())
    }
}
