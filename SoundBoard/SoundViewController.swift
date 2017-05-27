//
//  SoundViewController.swift
//  SoundBoard
//
//  Created by JuanJ on 5/26/17.
//  Copyright © 2017 JJB. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var nameTextField: UITextField!
    
    var audioRecorder : AVAudioRecorder?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        func setupRecorder() {
            
            do {
                
                // Create an audio session , need for error handling
                
                
                let session = AVAudioSession.sharedInstance()
                try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
                try session.overrideOutputAudioPort(.speaker)
                try session.setActive(true)
                
                // Create URL for audio file
                // basePath da un array , sale del primer elemento un string que es el que lleva al document directory
                
                let basePath : String = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
                
                // give name to file and attach it to directory
                
                let pathComponents =  [basePath, "audio.m4a"]
                let audioURL = NSURL.fileURL(withPathComponents: pathComponents)!
                
                //Create setting for audio Recorder
                
                var settings : [String:AnyObject] =  [:]
                settings[AVFormatIDKey] = Int(kAudioFormatMPEG4AAC) as AnyObject
                settings[AVSampleRateKey] = 44100.0 as AnyObject
                settings[AVNumberOfChannelsKey] = 2 as AnyObject
                
                // Create audioRecorder object
                // Url = Where do you want to save recording
                
                audioRecorder = try AVAudioRecorder(url: audioURL, settings: settings)
                audioRecorder!.prepareToRecord()
            } catch  let error as NSError {
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func recordTapped(_ sender: Any) {
    }
    
    @IBAction func playTapped(_ sender: Any) {
    }
    
    @IBAction func addTapped(_ sender: Any) {
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
