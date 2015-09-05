//
//  ConhecimentosViewController.swift
//  TesteMeusPedidos
//
//  Created by Erick de Miranda Oliveira on 02/09/15.
//  Copyright (c) 2015 7Setts. All rights reserved.
//

import UIKit
import MessageUI


class ConhecimentosViewController: UIViewController, MFMailComposeViewControllerDelegate {
    
    var candReceived:candidato!
    var email:mail!
    
    @IBOutlet var htmlLabel: UILabel!
    @IBOutlet var cssLabel: UILabel!
    @IBOutlet var jsLabel: UILabel!
    @IBOutlet var phytonLabel: UILabel!
    @IBOutlet var djangoLabel: UILabel!
    @IBOutlet var iOSLabel: UILabel!
    @IBOutlet var androidLabel: UILabel!
    
    
    
    
    @IBAction func submit(sender: AnyObject) {
  
        email.assunto = "Obrigado por se candidatar"
        
        //atualizar cand
        if (candReceived.html > 6 && candReceived.css > 6 && candReceived.javascript > 6) {
            email.corpoEmail = "Obrigado por se candidatar, assim que tivermos uma vaga disponível para programador Front-End entraremos em contato."
        }
        else if (candReceived.python > 6 && candReceived.django > 6) {
            email.corpoEmail = "Obrigado por se candidatar, assim que tivermos uma vaga disponível para programador Back-End entraremos em contato."
        }
        else if (candReceived.devAndroid > 6 || candReceived.devIos > 6){
            email.corpoEmail = "Obrigado por se candidatar, assim que tivermos uma vaga disponível para programador Mobile entraremos em contato."
        }else {
            email.corpoEmail = "Obrigado por se candidatar, assim que tivermos uma vaga disponível para programador entraremos em contato."
        }
        //validarParaEmail()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func htmlStepper(sender: UIStepper) {
        htmlLabel.text = Int(sender.value).description
        candReceived.html = htmlLabel.text?.toInt()
        
    }
    
    @IBAction func cssStepper(sender: UIStepper) {
        cssLabel.text = Int(sender.value).description
        candReceived.css = cssLabel.text?.toInt()
        
    }
    
    
    @IBAction func jsStepper(sender: UIStepper) {
        jsLabel.text = Int(sender.value).description
        candReceived.javascript = jsLabel.text?.toInt()
        
    }
    
    
    @IBAction func phytonStepper(sender: UIStepper) {
        phytonLabel.text = Int(sender.value).description
        candReceived.python = phytonLabel.text?.toInt()
    }
    
    
    @IBAction func djangoStepper(sender: UIStepper) {
        djangoLabel.text = Int(sender.value).description
        candReceived.django = djangoLabel.text?.toInt()
        
    }
    
    @IBAction func iOSStepper(sender: UIStepper) {
        iOSLabel.text = Int(sender.value).description
        candReceived.devIos = iOSLabel.text?.toInt()
        
    }
    
    
    @IBAction func androidStepper(sender: UIStepper) {
        androidLabel.text = Int(sender.value).description
        candReceived.devAndroid = androidLabel.text?.toInt()
        
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController{
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        
        //mailComposerVC.setBccRecipients(<#bccRecipients: [AnyObject]!#>)
        
        
        return mailComposerVC
    }
    
}
