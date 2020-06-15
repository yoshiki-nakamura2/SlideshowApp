//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 中村嘉希 on 2020/06/10.
//  Copyright © 2020 yoshiki.nakamura2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var next2Button: UIButton!
    @IBOutlet weak var back2Button: UIButton!
    @IBOutlet weak var start2Botton: UIButton!
    //タイマー
    var timer: Timer!
    
    //表示した画像番号
    var pictureImageNo = 0
    var tappedImage :UIImage?
    //画像の名前
    let imagename = ["picture1","picture2","picture3","picture4","picture5","picture6","picture7","picture8"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let image = UIImage(named: "picture1")
        imageView.image = image
        
    }
    
    
    
    
    //メゾットの作成
    func pictureImage(){
        
        let picturename = imagename[pictureImageNo]
        
        //画像読み込み
        let image = UIImage(named: "\(picturename)")
        
        //読み込んだ画像を表示
        imageView.image = image
        
        
        
    }
    //進むボタン
    @IBAction func nextButton(_ sender: Any) {
        
        if pictureImageNo < imagename.count - 1{
            
            //表示している画像の番号を1増やす
            pictureImageNo += 1
            
            //表示している画像を元に戻す
            pictureImage()
        }
        else{
            pictureImageNo = 0
            pictureImage()
        }
    }
    
    //戻るボタン
    @IBAction func backButton(_ sender: Any) {
        if pictureImageNo >= 1 && pictureImageNo <= imagename.count - 1{
            
            //表示している画像の番号を1減らす
            pictureImageNo -= 1
            
            //表示している画像を元に戻す
            pictureImage()
        }
        else{
            pictureImageNo = imagename.count - 1
            pictureImage()
        }
    }
    
    
    @IBAction func startButton(_ sender: Any) {
        
        if self.timer == nil{
            // タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            //再生・停止ボタンをクリックした時は進む・戻るを非表示
            next2Button.isEnabled = false
            back2Button.isEnabled = false
            
            //ボタンの名前変更（停止）
            start2Botton.setTitle("停止", for: .normal)
        }
        else if self.timer != nil {
            
            // タイマーを停止
            self.timer.invalidate()
            
            self.timer = nil
            
            //再生・停止ボタンをクリックした時は進む・戻るを非表示
            next2Button.isEnabled = true
            back2Button.isEnabled = true
            
            //ボタンの名前変更（再生）
            start2Botton.setTitle("再生", for: .normal)
            
        }
    }
    
    // #selectorで呼び出される関数
    @objc func updateTimer(_ timer: Timer) {
        if pictureImageNo < imagename.count - 1{
            
            //表示している画像の番号を1増やす
            pictureImageNo += 1
            
            //表示している画像を元に戻す
            pictureImage()
        }
        else{
            pictureImageNo = 0
            pictureImage()
        }
    }
    
    @IBAction func imageAction(_ sender: Any) {
        self.performSegue(withIdentifier: "tonext", sender: nil)
        
        if self.timer != nil{
            //タイマーを停止
            self.timer.invalidate()
            
            self.timer = nil
            //再生・停止ボタンをクリックした時は進む・戻るを非表示
            next2Button.isEnabled = true
            back2Button.isEnabled = true
            
            //ボタンの名前変更（停止）
            start2Botton.setTitle("再生", for: .normal)
        }
        else if self.timer != nil {
            // タイマーを設定
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            self.timer = nil
            
            //再生・停止ボタンをクリックした時は進む・戻るを非表示
            next2Button.isEnabled = false
            back2Button.isEnabled = false
            
            //ボタンの名前変更（再生）
            start2Botton.setTitle("停止", for: .normal)
            
        }
    }
    
    
    
    
    
    //画面遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any!){
        
        let nextViewController: nextViewController = segue.destination as! nextViewController
        
        let neme = imagename[pictureImageNo]
        
        let image = UIImage(named: neme)
        
        
        nextViewController.selectedImage = image
    }
    
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        // 他の画面から segue を使って戻ってきた時に呼ばれる
    }
    
    
    
    
    
    
    
    
}





















