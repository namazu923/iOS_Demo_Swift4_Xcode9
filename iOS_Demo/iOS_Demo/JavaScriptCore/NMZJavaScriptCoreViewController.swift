//
//  NMZJavaScriptCoreViewController.swift
//  iOS_Demo
//
//  Created by Namazu on 2017/11/13.
//  Copyright © 2017年 namazu923. All rights reserved.
//

import UIKit
import WebKit
import JavaScriptCore

// MARK: - protocol
/**
 * Native methods to be called by JavaScript for UIWebView
 */
@objc protocol NMZJavaScriptExports: JSExport {
    func uiNativeChangeColorToBlue()
    func uiNativeChangeColorToRed()
}

// MARK: - NMZJavaScriptCoreViewController
class NMZJavaScriptCoreViewController: UIViewController {

    // MARK: - Params
    var rightBarItem: UIBarButtonItem?
    
    let webViewTitle = UILabel()
    let uiWebView = UIWebView()
    let wkWebView = WKWebView()
    let line = UIView()
    let nativeTitle = UILabel()
    let addParagraphButton = UIButton()
    
    var context: JSContext?
    
    enum WebViewState {
        case UIWebView
        case WKWebView
    }
    
    var webViewState: WebViewState = .UIWebView
    
    // MARK: - Set Views
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        view.addSubviews(views: [webViewTitle, uiWebView, wkWebView, line, nativeTitle, addParagraphButton])

        setNavigationBar()
        
        setWebViewTitle()
        setUIWebView()
        setWKWebView()
        
        setDivider()
        
        setButton()
        
    }
    
    func setNavigationBar() {
        rightBarItem = UIBarButtonItem(title: "changeWebView", style: .plain, target: self, action: #selector(changeWebView))
        navigationItem.rightBarButtonItem = rightBarItem
    }
    
    func setWebViewTitle() {
        webViewTitle.text = "UIWebView"
        webViewTitle.backgroundColor = UIColor.gray
    }
    
    func setUIWebView() {
        
        let url = Bundle.main.url(forResource: "nmzJavaScriptCore_UIWebView", withExtension: "html", subdirectory: nil)
        uiWebView.loadRequest(URLRequest(url: url!))
        
        // get JSContext from UIWebView
        context = uiWebView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as? JSContext
        
        // set Native Object(with methods that implementing JSExport protocol)
        // also set KeyedSubscript to be used in JavaScript
        context?.setObject(self, forKeyedSubscript: "uiCallNativeMethod" as NSCopying & NSObjectProtocol)
        
        // js exception handler
        context?.exceptionHandler = {(jsContext, exception) in
            print("js exception: \(String(describing: exception))")
        }
    }
    
    func setWKWebView() {
        
        let url = Bundle.main.url(forResource: "nmzJavaScriptCore_WKWebView", withExtension: "html", subdirectory: nil)
        
        // add Method name to be posted back from JavaScript
        wkWebView.configuration.userContentController.add(self, name: "wkCallNativeMethod")
        wkWebView.load(URLRequest(url: url!))
        
        wkWebView.uiDelegate = self
        wkWebView.isHidden = true
    }
    
    func setDivider() {
        line.backgroundColor = UIColor.gray
    }
    
    func setButton() {
        nativeTitle.text = "Native"
        nativeTitle.backgroundColor = UIColor.gray
        
        addParagraphButton.backgroundColor = UIColor.gray
        addParagraphButton.setTitle("Add Paragraph", for: .normal)
        addParagraphButton.setTitleColor(UIColor.black, for: .normal)
        addParagraphButton.addTarget(self, action: #selector(addParagraphButtonClicked), for: .touchUpInside)
    }
    
    override func viewWillLayoutSubviews() {
        // set Constraints at viewWillLayoutSubviews to get correct topLayoutGuide parameters
        setConstraints()
    }
    
    // MARK: - Set Constraints
    func setConstraints() {
        webViewTitle.snp.makeConstraints{(make) in
            make.top.equalTo(topLayoutGuide.length)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(30)
        }
        
        uiWebView.snp.makeConstraints{(make) in
            make.top.equalTo(webViewTitle.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(300)
        }
        
        wkWebView.snp.makeConstraints{(make) in
            make.top.equalTo(webViewTitle.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(300)
        }
        
        line.snp.makeConstraints{(make) in
            make.top.equalTo(uiWebView.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(3)
        }
        
        nativeTitle.snp.makeConstraints{(make) in
            make.top.equalTo(line.snp.bottom)
            make.leading.trailing.equalTo(view)
            make.height.equalTo(30)
        }
        
        addParagraphButton.snp.makeConstraints{(make) in
            make.top.equalTo(nativeTitle.snp.bottom).offset(50)
            make.leading.equalTo(view.snp.leading).offset(50)
            make.trailing.equalTo(view.snp.trailing).offset(-50)
            make.height.equalTo(20)
        }
        
    }
    
}

// MARK: - NMZJavaScriptExports
extension NMZJavaScriptCoreViewController: NMZJavaScriptExports {

    
    func uiNativeChangeColorToBlue() {
        DispatchQueue.main.async {
            self.addParagraphButton.backgroundColor = UIColor.blue
        }
    }
    func uiNativeChangeColorToRed() {
        DispatchQueue.main.async {
            self.addParagraphButton.backgroundColor = UIColor.red
        }
    }
}

// MARK: - WKScriptMessageHandler
/**
 * Receive message from JavaScript in WKWebView
 */
extension NMZJavaScriptCoreViewController: WKScriptMessageHandler {
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        
        let dict = message.body as? [String : String]
        let method = dict?["method"]
        let _ = dict?["param_1"]
        
        print("\(message.name) , \(message.body)")
        
        if let _method = method {
            
            if _method == "wkNativeChangeColorToBlue" {
                wkNativeChangeColorToBlue()
            } else if _method == "wkNativeChangeColorToRed" {
                wkNativeChangeColorToRed()
            }
        }
    }
    
    func wkNativeChangeColorToBlue() {
        DispatchQueue.main.async {
            self.addParagraphButton.backgroundColor = UIColor.blue
        }
    }
    
    func wkNativeChangeColorToRed() {
        DispatchQueue.main.async {
            self.addParagraphButton.backgroundColor = UIColor.red
        }
    }
}

// MARK: - WKUIDelegate
extension NMZJavaScriptCoreViewController: WKUIDelegate {
    
    // As alert doesn't show in the WKWebView, should call delegate method to get alert message and show it in Native side
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        print("\(message)")
        
        let alertController = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertController, animated: true, completion: nil)
        
        completionHandler()
    }
}

// MARK: - Actions
extension NMZJavaScriptCoreViewController {
    @objc func changeWebView() {
        
        switch webViewState {
        case .UIWebView:
            webViewState = .WKWebView
            webViewTitle.text = "WKWebView"
            
            uiWebView.isHidden = true
            wkWebView.isHidden = false

            line.snp.remakeConstraints{(make) in
                make.top.equalTo(wkWebView.snp.bottom)
                make.leading.trailing.equalTo(view)
                make.height.equalTo(3)
            }
            
            view.layoutIfNeeded()
            
            
        case .WKWebView:
            webViewState = .UIWebView
            webViewTitle.text = "UIWebView"
            
            uiWebView.isHidden = false
            wkWebView.isHidden = true
            
            line.snp.remakeConstraints{(make) in
                make.top.equalTo(uiWebView.snp.bottom)
                make.leading.trailing.equalTo(view)
                make.height.equalTo(3)
            }
            
            view.layoutIfNeeded()
        }

    }
    
    
    /**
     * Native call JS in webView
     */
    @objc func addParagraphButtonClicked() {
        switch webViewState {
        case .UIWebView:
            if let context = context {
                // There're two ways to call js from Native in UIWebView
                // way one
                let function: JSValue = context.objectForKeyedSubscript("uiAddParagraph")
                function.call(withArguments: nil)
                
                // way two
                // context.evaluateScript("uiAddParagraph()")
                
                print("addParagraphButtonClicked \(function)")
            }
        case .WKWebView:
            wkWebView.evaluateJavaScript("wkAddParagraph()", completionHandler: nil)
        }
        
        
    }
}

