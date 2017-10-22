//
//  ViewController.swift
//  ARcocaCola
//
//  Created by kenneth moody on 10/20/17.
//  Copyright © 2017 iMoody Studio. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
      //  self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        //        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
                let sphere = SCNSphere(radius: 0.2)
        
                let material = SCNMaterial()
        
        material.diffuse.contents = UIImage(named: "coke.png")
        
        
                sphere.firstMaterial = material
        
        let sphereNode = SCNNode(geometry: sphere)
        
        sphereNode.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        
        sphereNode.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(sphereNode)
        
                sceneView.autoenablesDefaultLighting = true

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
    
  
}
