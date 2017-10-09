//
//  ViewController.swift
//  MiniBrowser
//
//  Created by Tama on 2017. 10. 9..
//  Copyright © 2017년 Tama. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UITextFieldDelegate, WKNavigationDelegate {

    @IBOutlet var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet var urlTextField: UITextField!
    @IBOutlet var mainWebView: WKWebView!
    @IBOutlet var spinningActivityIndicatorView: UIActivityIndicatorView!
    
    @IBAction func backButtonAction(_ sender: Any) {
        mainWebView.goBack()
    }
    
    @IBAction func forwardButtonAction(_ sender: Any) {
        mainWebView.goForward()
    }
    
    @IBAction func stopButtonAction(_ sender: Any) {
        mainWebView.stopLoading()
    }
    
    @IBAction func refreshButtonAction(_ sender: Any) {
        mainWebView.reload()
    }
    
    @IBAction func bookMarkAction(_ sender: Any) {
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)!
        let urlString = "https://www.\(bookMarkUrl).com"
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        if !urlString.hasPrefix("https://"){
            urlString = "https://\(urlTextField.text!)"
        }
        urlTextField.text = urlString
        mainWebView.load(URLRequest(url: URL(string: urlString)!))
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        spinningActivityIndicatorView.startAnimating()    // 표시는 되지만 바로 멈추는것처럼 보임...load가 비동기라 그럼
        self.mainWebView.navigationDelegate = self
        let urlString = "https://www.facebook.com"
        mainWebView.load(URLRequest(url: URL(string: urlString)!)) //비동기처리가 됨...스레드가 자동으로 1개 만들어지면서 이 작업이 따로 실행됨
        urlTextField.text = urlString
//        spinningActivityIndicatorView.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        spinningActivityIndicatorView.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        spinningActivityIndicatorView.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        spinningActivityIndicatorView.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

