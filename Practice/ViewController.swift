//
//  ViewController.swift
//  Practice
//
//  Created by 藤田佳己 on 2020/05/13.
//  Copyright © 2020 Fujita Fujimon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label1: UILabel!
    @IBOutlet var menuImageView: UIImageView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //ボタンを押すとポップアップでラベルにテキストを入力する
    @IBAction func enterTapped(_ sender: Any) {
        var alertTextField: UITextField?
        

        let alert = UIAlertController(
            title: "Menuを編集する",
            message: "Menuを追加してください",
            preferredStyle: UIAlertController.Style.alert)
        alert.addTextField(
            configurationHandler: {(textField: UITextField!) in
                alertTextField = textField
                textField.text = self.label1.text
        })
        alert.addAction(
            UIAlertAction(
                title: "Cancel",
                style: UIAlertAction.Style.cancel,
                handler: nil))
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: UIAlertAction.Style.default) { _ in
                if let text = alertTextField?.text {
                    self.label1.text = text
                }
            }
        )
        self.present(alert, animated: true, completion: nil)
    }
    
    
    
    //imageを定義した
    let image = UIImage(named:"menu_design")!
    
    //スクリーンショットを撮るメソッド
    func getScreenShot(windowFrame: CGRect) -> UIImage {

        UIGraphicsBeginImageContextWithOptions(CGSize(width: image.size.width,height: image.size.width), false, 0.0)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        self.view.layer.render(in: context)
        let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()

        return capturedImage
       
    }
    
    
    //スクリーンショットをボタンをタップして実行する
   @IBAction func tapButton() {
          getScreenShot(windowFrame: CGRect(x: 0,y: 0,width: image.size.width,height:
               image.size.width))
          let image = getScreenShot(windowFrame: self.view.bounds)
          UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
      }
    
    

}

