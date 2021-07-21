//
//  ViewController.swift
//  WebView
//
//  Created by aleksandar.aleksic on 8.7.21..
//

import UIKit
import WebKit

class ViewController: UIViewController {

    let webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        webView.load(urlString: "https://www.apple.com")
//        webView.myLoad("https://www.apple.com")
    }

    @IBAction func letsGO(_ sender: Any) {
        if let url = URL(string: "https://www.apple.com"){
            UIApplication.shared.canOpenURL(url)
        }
    }
    
    override func loadView() {
        self.view = webView
//        if let url = URL(string: "https://www.apple.com"){
//            let request = URLRequest(url: url)
//            webView.load(request)
//        }
        
        //MARK: Otvaranje linka preko Safari
        if let url = URL(string: "https://www.apple.com"){
            UIApplication.shared.canOpenURL(url)
        }
        
        //MARK: PRIKAZ HTML stranice za web-view
//        if let url = Bundle.main.url(forResource: "help", withExtension: "html"){
//            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
//        }
    }
   

}

extension WKWebView{
    func load (urlString: String){
        if let url = URL(string: urlString){
            let request = URLRequest(url: url)
            load(request)
        }
    }
}



