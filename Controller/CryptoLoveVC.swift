//
//  CryptoLoveVC.swift
//

import UIKit

class CryptoLoveVC: BaseVC {
    
    @IBOutlet weak var messageLbl: UILabel!
    @IBOutlet weak var btcLbl: UILabel!
    @IBOutlet weak var ltcLbl: UILabel!
    @IBOutlet weak var ethLbl: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = darkSky

        btcLbl.text = "Learning application source code"
        ltcLbl.text = "Make suggestions for improvement"
        ethLbl.text = "Follow the author"
//        btcLbl.text = BTC_ADDRESS
//        ltcLbl.text = LTC_ADDRESS
//        ethLbl.text = ETH_ADDRESS
        
        messageLbl.text = "TpCoin is a free app that tracks cryptocurrencies. \n\nSincerely hope you can like it."
        
    }

    
    @IBAction func copyBTC(_ sender: Any) {
        guard let url = URL(string: sourcecodeURL) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        UIPasteboard.general.string = BTC_ADDRESS
//        showAlertWith(title: "Copied", message: "BTC address \"\(BTC_ADDRESS)\" copied to clipboard")
    }
    
    
    @IBAction func copyLTC(_ sender: Any) {
        guard let url = URL(string: feedbackURL) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        UIPasteboard.general.string = LTC_ADDRESS
//        showAlertWith(title: "Copied", message: "LTC address \"\(LTC_ADDRESS)\" copied to clipboard")
    }
    
    @IBAction func copyETH(_ sender: Any) {
        guard let url = URL(string: authorURL) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
//        UIPasteboard.general.string = ETH_ADDRESS
//        showAlertWith(title: "Copied", message: "ETH address \"\(ETH_ADDRESS)\" copied to clipboard")
    }
    
    
    
    @IBAction func rateApp(_ sender: Any) {
       
        guard let url = URL(string: appStoreURL) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
        
    }
    

}
