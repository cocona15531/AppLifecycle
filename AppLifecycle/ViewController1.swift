//
//  ViewController.swift
//  ViewControllerLifecycle
//
//  Created by Angela Yu on 28/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ViewController1: UIViewController {
    
    //viewdidroadはviewが作成された時に一度だけ呼ばれる
    //それ以外のメソッドは表示されるたびに呼ばれる
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC1 viewDidLoad Called")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC1 viewWillAppear Called")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("VC1 viewDidAppear Called")
    }
    
    //モーダル遷移の場合はvc1が完全に消えていないので
    //以下のメソッドは画面が遷移しても呼ばれない
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("VC1 viewWillDisappear Called")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("VC1 viewDidDisappear Called")
    }
    
    //このメソッドは遷移前にdestinationVCを取得しても
    //遷移するまではviewcontroller2でlabelは作成されておらず
    //viewcontrollerにもリンクされていないのでクラッシュしてしまう
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ViewController2
        destinationVC.label.text = "Hello"
    }

}

