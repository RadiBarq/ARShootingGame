
import UIKit
import SpriteKit
import GameplayKit
import ARKit

class GameViewController: UIViewController {
  
  var sceneView: ARSKView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    if let view = self.view as? ARSKView{
      
      sceneView = view
      sceneView.delegate = self
      let scene = GameScene(size: view.bounds.size)
      scene.scaleMode = .resizeFill
      scene.anchorPoint = CGPoint(x: 0.5, y: 0.5)
      view.presentScene(scene)
      view.showsFPS = true
      view.showsNodeCount = true
      
    }
    
  }
  
  override var shouldAutorotate: Bool {
    return true
  }
  
  override func viewWillAppear(_ animated: Bool) {
    
    super.viewWillAppear(animated)
    let configuration = ARWorldTrackingConfiguration()
    sceneView.session.run(configuration)
    
  }

  override func viewWillDisappear(_ animated: Bool) {
    
    super.viewWillDisappear(animated)
    sceneView.session.pause()
    
  }
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    if UIDevice.current.userInterfaceIdiom == .phone {
      return .allButUpsideDown
    } else {
      return .all
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Release any cached data, images, etc that aren't in use.
  }
  
  override var prefersStatusBarHidden: Bool {
    return true
  }
}

extension GameViewController: ARSKViewDelegate{
  
  func session(_ session: ARSession,
               didFailWithError error: Error) {
    print("Session Failed - probably due to lack of camera access")
  }
  
  func sessionWasInterrupted(_ session: ARSession) {
    print("Session interrupted")
  }
  
  
  func sessionInterruptionEnded(_ session: ARSession) {
    print("Session resumed")
    
    // here we restart the tracking and anchors.
    sceneView.session.run(session.configuration!,
                          options: [.resetTracking,
                                    .removeExistingAnchors])
  }
  
  func view(_ view: ARSKView,
            nodeFor anchor: ARAnchor) -> SKNode? {
    let bug = SKSpriteNode(imageNamed: "bug")
    bug.name = "bug"
    return bug
  }
  
}

