//
//  ProfileViewController.swift
//  ArthurFloresApp
//
//  Created by Arturo Flores on 07/03/18.
//  Copyright © 2018 ArthurFlores. All rights reserved.
//

import UIKit
import MessageUI
class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate, UIWebViewDelegate {
    
 

    var isWebViewShowing:Bool = false
    @IBOutlet weak var linkedInWebView: UIWebView!
    @IBOutlet weak var linkedInButton: UIButton!
    @IBOutlet var webViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var titleLabelProfile: UILabel!
    
    @IBOutlet weak var informationTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.webViewTopConstraint.isActive = false
        informationTableView.delegate = self
        informationTableView.dataSource = self
        informationTableView.register(UINib(nibName: "ProfileInformationCellTableViewCell", bundle: nil), forCellReuseIdentifier: "infoCell")

        loadWebViewContent()
        // Do any additional setup after loading the view.
    }
    
    func loadWebViewContent() {
        linkedInWebView.delegate = self
        if let url = URL(string: "http://linkedin.com/in/arturo-flores-7681b4a5") {
            let request = URLRequest(url: url)
            linkedInWebView.loadRequest(request)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = informationTableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! ProfileInformationCellTableViewCell
        cell.titleTxtLabel.text = "Nombre"
        cell.infoLabel.text = "alguna información lorem ipsum mas lorem mas impsum"
        
        
        return cell
    }
    

    
    // MARK: - ButtonActions

    @IBAction func callAction(_ sender: Any) {
        let url: NSURL = URL(string: "TEL://2281305975")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    
    
    @IBAction func mailActon(_ sender: Any) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(["arthisc@me.com"])
            mail.setMessageBody("<p>Tu mensaje va aqui</p>", isHTML: true)
            
            present(mail, animated: true)
        } else {
            // show failure alert
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("el correo se canceló")
            controller.dismiss(animated: true, completion: nil)
        case MFMailComposeResult.sent.rawValue:
            print("el correo se envió")
            controller.dismiss(animated: true, completion: nil)
        case MFMailComposeResult.failed.rawValue:
            print("el correo fallo")
            controller.dismiss(animated: true, completion: nil)
        case MFMailComposeResult.saved.rawValue:
            print("el correo se guardó")
            controller.dismiss(animated: true, completion: nil)
        default:
            print("_ entró al default de mail")
            controller.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func messageAction(_ sender: Any) {
        let messageVC = MFMessageComposeViewController()
        messageVC.body = "Hola, te contacto debido que "
        messageVC.recipients = ["2281305975"]
        messageVC.messageComposeDelegate = self
        
        present(messageVC, animated: true, completion: nil)
    }
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch result.rawValue {
        case MessageComposeResult.cancelled.rawValue :
            print("mensaje cancelado")
            
        case MessageComposeResult.failed.rawValue :
            print("mensaje fallido")
            
        case MessageComposeResult.sent.rawValue :
            print("mensaje enviado")
            
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func openLinkedIn(_ sender: Any) {
        if !isWebViewShowing {
            isWebViewShowing = true
            self.linkedInWebView.layer.opacity = 0
            
            linkedInButton.setImage(UIImage(named: "closeIcon"), for: .normal)
            UIView.animate(withDuration: 0.7, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.webViewTopConstraint.isActive = true
                self.linkedInWebView.layer.opacity = 1
                
            }, completion: nil)
        }else{
            isWebViewShowing = false
            linkedInButton.setImage(UIImage(named: "linkedin"), for: .normal)
            UIView.animate(withDuration: 0.7, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
                self.webViewTopConstraint.isActive = false
                self.linkedInWebView.layer.opacity = 0
                
            }, completion: nil)
        }
      
    }
    
    
    
}

