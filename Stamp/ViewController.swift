//
//  ViewController.swift
//  Stamp
//
//  Created by 春田実利 on 2022/08/14.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageNameArray: [String] = ["hana","hoshi","onpu","shitumon"]
    
    var imageIndex: Int = 0
    
    @IBOutlet var backGroundImageView: UIImageView!
    
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        if imageIndex != 0 {
            imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            imageView.image = image
            
            imageView.center = CGPoint(x: location.x, y: location.y)
            
            self.view.addSubview(imageView)
        
        }
            
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        
        backGroundImageView.image = image
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func firseSelectButton(){
        imageIndex = 1
        
    }
    
    @IBAction func secondSelectButton(){
        imageIndex = 2
        
    }
   
    @IBAction func thirdSelectButton(){
        imageIndex = 3
        
    }
    @IBAction func fourthSelectButton(){
        imageIndex = 4
        
    }
    
    @IBAction func backButton(){
        self.imageView.removeFromSuperview()
        
    }
    
    @IBAction func selectBackGround(){
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        imagePickerController.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        
        self.present(imagePickerController, animated: true, completion: nil)
        
    }
    
    @IBAction func save(){
        let rect: CGRect = CGRect(x: 0, y: 30, width: 320, height: 380)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
        
    }


}

