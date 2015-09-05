//
//  ViewController.swift
//  TesteMeusPedidos
//
//  Created by Erick de Miranda Oliveira on 02/09/15.
//  Copyright (c) 2015 7Setts. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var nomeText: UITextField!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var alertLabel: UILabel!
    
    let cand:candidato = candidato()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeText.delegate = self;
        emailText.delegate = self;
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submit(sender: AnyObject) {
        if(emailText.text.isEmail()){
            
            cand.nome = nomeText.text
            cand.email = emailText.text
            
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let conhecimentosViewController = storyBoard.instantiateViewControllerWithIdentifier("conhecimentos") as! ConhecimentosViewController
            conhecimentosViewController.candReceived = cand
            self.presentViewController(conhecimentosViewController, animated:true, completion:nil)
            

            
        }
        else{
            alertLabel.hidden = false
            alertLabel.text = "Email informado inválido."
            
            
        }
        
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        textField.resignFirstResponder()
        return true;
    }
    
    
    
/*
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if(emailText.text.isEmail()){
        
        if (segue.identifier == "mySegue") {
            var svc = segue!.destinationViewController as! ConhecimentosViewController;
            cand.nome = nomeText.text
            cand.email = emailText.text
            println(cand.email)
            println(cand.nome)
            svc.candReceived = cand
            
        }
        
    }
    else{
        alertLabel.text = "Email informado inválido."
        
        
    }

    }
    */
}
    
extension String {
    func isEmail() -> Bool {
        let regex = NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .CaseInsensitive, error: nil)
        return regex?.firstMatchInString(self, options: nil, range: NSMakeRange(0, count(self))) != nil
    }
}
