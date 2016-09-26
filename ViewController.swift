//
//  ViewController.swift
//  HariAd
//
//  Created by Anil Kumar on 05/09/16.
//  Copyright © 2016 Atti. All rights reserved.
//

import UIKit
import GoogleMobileAds
import FTPopOverMenu
class ViewController: UIViewController,GADBannerViewDelegate
{
    let gradientLayer = CAGradientLayer()
    @IBOutlet var bannerview: GADBannerView!
    var adLoader = GADAdLoader()
    
    
    override func viewDidLoad()
    {
         self.view.backgroundColor = UIColor.greenColor()
        // 2
        gradientLayer.frame = self.view.bounds
        // 3
        let color1 = UIColor.yellowColor().CGColor as CGColorRef
        let color2 = UIColor(red: 1.0, green: 0, blue: 0, alpha: 1.0).CGColor as CGColorRef
        let color3 = UIColor.clearColor().CGColor as CGColorRef
        let color4 = UIColor(white: 0.0, alpha: 0.7).CGColor as CGColorRef
        gradientLayer.colors = [color1, color2, color3, color4]
        // 4
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        // 5
        self.view.layer.addSublayer(gradientLayer)
        let request = GADRequest()
        bannerview.hidden = true
        request.testDevices = [kGADSimulatorID]
        bannerview.delegate = self
        bannerview.adUnitID = "ca-app-pub-5075337075127340/2796493315"
        bannerview.rootViewController = self
        bannerview.loadRequest(request)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func BarButton(sender: UIBarButtonItem)
    {
        
        
    }
    @IBAction func buttonnew(sender: UIButton) {
        
        FTPopOverMenu.showForSender(sender , withMenu: ["ChangeAd", "DeleteAd"], imageNameArray: ["setting_icon", "setting_icon"], doneBlock:
            {
                (selectedIndex: Int) -> Void in
                if selectedIndex == 0 {
                    let alert = UIAlertView()
                    alert.title = "Alert"
                    alert.message = "Changed"
                    alert.addButtonWithTitle("Understod")
                    alert.show()
                    
                }
                else
                {
                    let alert = UIAlertView()
                    alert.title = "Alert"
                    alert.message = "Deleted"
                    alert.addButtonWithTitle("Understod")
                    alert.show()
                }
                print("done block. do something. selectedIndex : \(Int(selectedIndex))")
                
            }
            
            , dismissBlock: {() -> Void in
                print("user canceled. do nothing.")
            }
        )

    }
    
    
    @IBAction func btn(sender: UIButton)
   
    {
        FTPopOverMenu.showForSender(sender, withMenu: ["ChangeAd", "DeleteAd"], imageNameArray: ["setting_icon", "setting_icon"], doneBlock:
            {
                            (selectedIndex: Int) -> Void in
                if selectedIndex == 0 {
                    let alert = UIAlertView()
                    alert.title = "Alert"
                    alert.message = "Changed"
                    alert.addButtonWithTitle("Understod")
                    alert.show()

                } else if selectedIndex == 1
                {
                    let alert = UIAlertView()
                    alert.title = "Alert"
                    alert.message = "Deleted"
                    alert.addButtonWithTitle("Understod")
                    alert.show()
                } else {
                    /* If condition is false then print the following */
                    print("None of the values is matching");
                }
          print("done block. do something. selectedIndex : \(Int(selectedIndex))")
            
            }
            
            , dismissBlock: {() -> Void in
                print("user canceled. do nothing.")
        }
         )
        
    }
    
    @IBOutlet var SwitchOutlet: UISwitch!
    
    
    @IBAction func SwitchButton(sender: UISwitch)
    
    {
        let alert = UIAlertController(title: "Notice", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Hide the Ad", style: UIAlertActionStyle.Default, handler:  { action in
            // do something like...
            self.launchMissile()
            
        }))

        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: { action in
            // do something like...
            self.launchMissile()
            
        }))
        
        alert.addAction(UIAlertAction(title: "Launch the Missile", style: UIAlertActionStyle.Destructive, handler: { action in
            // do something like...
            self.launchMissile()
        }))
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        if SwitchOutlet.on {
            bannerview.hidden = false

        } else
        {
            bannerview.hidden = true
        }
    }
    //
    func launchMissile()
        
    {
        self.view.backgroundColor = UIColor.greenColor()
    gradientLayer.frame = self.view.bounds
        
        // 3
        let color1 = UIColor.blueColor().CGColor as CGColorRef
        let color2 = UIColor.purpleColor()
        let color3 = UIColor.redColor().CGColor as CGColorRef
        let color4 = UIColor(white: 0.0, alpha: 0.7).CGColor as CGColorRef
        gradientLayer.colors = [color1,
color2, color3, color4]
                // 4
        gradientLayer.locations = [0.0, 0.25, 0.75, 1.0]
        
        // 5
        self.view.layer.addSublayer(gradientLayer)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func adViewDidReceiveAd(bannerView: GADBannerView!) {
        bannerview.hidden  = false
    }


}

