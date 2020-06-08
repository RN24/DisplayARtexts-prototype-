//
//  ViewController.swift
//  test
//
//  Created by 西岡亮太 on 2020/06/06.
//  Copyright © 2020 西岡亮太. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

var ARtexts = "Please input letters to text field!"




class ViewController: UIViewController, UITextFieldDelegate, ARSCNViewDelegate {
    
    
    
 

    var scene = SCNScene()
    
    
    @IBOutlet var sceneView: ARSCNView!
    
    @IBOutlet weak var InputLetters: UITextField!
    
    @IBOutlet weak var showLetters: UIButton!//ボタンを操作するには宣言が必要？
    
    var textNode = SCNNode()
    var oldNode = SCNNode()
    var textGeometry = SCNText()
    var oldGeometry = SCNText()
    

    
    @IBAction func endKeyboard(_ sender: Any) {
    }
    
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView = ARSCNView(frame: self.view.frame)
        self.view.addSubview(self.sceneView)//こいつを入れると最前面に追加されるので下のtextFieldが隠れる
        self.view.addSubview(showLetters!)//subViewに追加
        self.view.addSubview(InputLetters)//subViewに追加
        self.view.addSubview(label)//subViewに追加
        
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
     //ARtexts = "\(InputLetters.text!)"
     //label.text = ARtexts
     textGeometry = SCNText(string: ARtexts, extrusionDepth: 1.0)//ARtextをわたす
     textGeometry.firstMaterial?.diffuse.contents = UIColor.orange
     textNode = SCNNode(geometry: textGeometry)
     textNode.position = SCNVector3(-1.0, 0.1, -2.0)
     textNode.scale = SCNVector3(0.02, 0.02, 0.02)
     scene.rootNode.addChildNode(textNode)
        
        
        
        
        // Set the scene to the view
        sceneView.scene = scene
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
        @IBAction func showLetters(_ sender: Any) {
            
            textNode.removeFromParentNode()
            
         
            ARtexts = "\(InputLetters.text!)"
            label.text = ARtexts
            textGeometry = SCNText(string: ARtexts, extrusionDepth: 1.0)//ARtextをわたす
            textGeometry.firstMaterial?.diffuse.contents = UIColor.orange
            textNode = SCNNode(geometry: textGeometry)
            textNode.position = SCNVector3(-1.0, 0.1, -2.0)
            textNode.scale = SCNVector3(0.02, 0.02, 0.02)
            
         
    //        scene.rootNode.replaceChildNode(oldNode, with: textNode/*, with: textNode*/)
    //        oldNode = textNode
            scene.rootNode.addChildNode(textNode)
            
        }
        
}
