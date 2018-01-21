//
//  GameViewController.swift
//  iPhoneXSpriteKit
//
//  Created by Alessandro Ornano on 20/01/2018.
//  Copyright © 2018 Alessandro Ornano. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

protocol LayoutSubviewDelegate: class {
    func safeAreaUpdated()
}
class GameViewController: UIViewController {
    weak var layoutSubviewDelegate:LayoutSubviewDelegate?
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if let _ = self.view {
            layoutSubviewDelegate?.safeAreaUpdated()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---")
        print("∙ \(type(of: self))")
        print("---")
        guard let view = self.view as! SKView? else { return }
        view.ignoresSiblingOrder = true
        view.showsFPS = true
        view.showsNodeCount = true
        view.showsPhysics = true
        view.showsDrawCount = true
        let scene = GameScene(size:view.bounds.size)
        scene.scaleMode = .aspectFill
        view.presentScene(scene)
    }
}
