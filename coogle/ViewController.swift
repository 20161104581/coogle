//
//  ViewController.swift
//  coogle
//
//  Created by 20161104581 on 2018/12/28.
//  Copyright © 2018 20161104581. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController{
    
    
    
    @IBOutlet weak var textfile1: UITextField!
    
    @IBOutlet weak var enter: UIButton!
    @IBOutlet weak var webview: WKWebView!
    lazy private var progressView: UIProgressView = {
        self.progressView = UIProgressView.init(frame: CGRect(x: CGFloat(0), y: CGFloat(65), width: UIScreen.main.bounds.width, height: 2))
        self.progressView.tintColor = UIColor.green      // 进度条颜色
        self.progressView.trackTintColor = UIColor.white // 进度条背景色
        return self.progressView
        }()
        
    
    let progressview = UIProgressView (frame:CGRect.init(x:0,y:0,width:200,height:10))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webview)
        view.addSubview(progressView)
        
        webview.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webview.load(URLRequest.init(url: URL.init(string: "https://www.baidu.com/")!))
    }
    
    
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == "estimatedProgress"{
            progressView.alpha = 1.0
            progressView.setProgress(Float(webview.estimatedProgress), animated: true)
            if webview.estimatedProgress >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseOut, animations: {
                    self.progressView.alpha = 0
                }, completion: { (finish) in
                    self.progressView.setProgress(0.0, animated: false)
                })
            }
        }
    }
       
   
    
    
    
    

    @IBAction func buttonClick(_ sender: Any) {
        let urls = textfile1.text
        // print(urls)
        webview.load(NSURLRequest(url: NSURL(string: urls!)! as URL)as URLRequest)
    }
    
    @IBAction func refreshClick(_ sender: Any) {
        webview.reload()
        
    }
    //前进
    
    @IBAction func toClick(_ sender: Any) {
         webview.goForward()
        
    }
    
   
    @IBAction func backClick(_ sender: Any) {
        webview.goBack()
    }
    
 


 
    

    

}


