//
//  GameScene.swift
//  iPhoneXSpriteKit
//
//  Created by Alessandro Ornano on 20/01/2018.
//  Copyright © 2018 Alessandro Ornano. All rights reserved.
//

import SpriteKit
import UIKit

class GameScene: SKScene, LayoutSubviewDelegate {
    var labLeftTop:SKLabelNode!
    var labRightTop:SKLabelNode!
    var labLeftBottom:SKLabelNode!
    var labRightBottom:SKLabelNode!
    func safeAreaUpdated() {
        if let view = self.view {
            let top = view.bounds.height-(view.bounds.height-view.safeAreaLayoutGuide.layoutFrame.height)+UIApplication.shared.statusBarFrame.height
            let bottom = view.bounds.height - view.safeAreaLayoutGuide.layoutFrame.height-UIApplication.shared.statusBarFrame.height
            print(bottom,top)
            refreshPositions(top: top, bottom: bottom)
        }
    }
    override func didMove(to view: SKView) {
        print("---")
        print("∙ \(type(of: self))")
        print("---")
        if let view = self.view, let controller = view.next, controller is GameViewController {
            (controller as! GameViewController).layoutSubviewDelegate = self
        }
        labLeftTop = SKLabelNode.init(text: "LEFTTOP")
        labLeftTop.horizontalAlignmentMode = .left
        labLeftTop.verticalAlignmentMode = .top
        labRightTop = SKLabelNode.init(text: "RIGHTTOP")
        labRightTop.horizontalAlignmentMode = .right
        labRightTop.verticalAlignmentMode = .top
        labLeftBottom = SKLabelNode.init(text: "LEFTBTM")
        labLeftBottom.horizontalAlignmentMode = .left
        labLeftBottom.verticalAlignmentMode = .bottom
        labRightBottom = SKLabelNode.init(text: "RIGHTBTM")
        labRightBottom.horizontalAlignmentMode = .right
        labRightBottom.verticalAlignmentMode = .bottom
        self.addChild(labLeftTop)
        self.addChild(labRightTop)
        self.addChild(labLeftBottom)
        self.addChild(labRightBottom)
        labLeftTop.position = CGPoint(x:0,y:self.frame.height)
        labRightTop.position = CGPoint(x:self.frame.width,y:self.frame.height)
        labLeftBottom.position = CGPoint(x:0,y:0)
        labRightBottom.position = CGPoint(x:self.frame.width,y:0)
    }
    func refreshPositions(top:CGFloat,bottom:CGFloat){
        labLeftTop.position = CGPoint(x:0,y:top)
        labRightTop.position = CGPoint(x:self.frame.width,y:top)
        labLeftBottom.position = CGPoint(x:0,y:bottom)
        labRightBottom.position = CGPoint(x:self.frame.width,y:bottom)
    }
}
