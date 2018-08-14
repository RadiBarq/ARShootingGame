
import SpriteKit


enum Sounds {
  
  static let fire =      SKAction.playSoundFileNamed("sprayBug",
                                                     waitForCompletion: false)
  static let hit =       SKAction.playSoundFileNamed("hitBug",
                                                     waitForCompletion: false)
  static let bugspray =  SKAction.playSoundFileNamed("catchBugspray",
                                                     waitForCompletion: false)
  static let win =       SKAction.playSoundFileNamed("win.wav",
                                                     waitForCompletion: false)
  static let lose =      SKAction.playSoundFileNamed("lose.wav",
                                                     waitForCompletion: false)
}


enum NodeType: String {
  
  case bug = "bug"
  case firebug = "firebug"
  case bugspray = "bugspray"
}

