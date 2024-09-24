
import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//   var  hardness = ""
//    //    let softTime: Int = 5
//    //    let mediumTime: Int = 5
//    //    let hardTime: Int = 5
//    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 12]
//
//    @IBAction func hardnessSelected(_ sender: UIButton) {
//        //        print(sender.currentTitle!)
//        //        let hardnessTime = sender.currentTitle
//        //        print(hardness)
//        //-------------------
//        hardness = sender.currentTitle!
//        printHardnessTime()
//        //-----------------------
//        let result = eggTimes[hardness]!
//        print(result)
//
//
//    }  // end Button 1
//    func printHardnessTime(){
//        // ----------if-----------------
//
//        //                if hardness == "Soft" {
//        //                    print(softTime)
//        //                }else if hardness == "Medium" {
//        //                    print(mediumTime)
//        //                }else{
//        //                    print(hardTime)
//        //                }
//        // ----------switch-----------------
//
//        switch hardness {
//        case "Soft":
//            print(eggTimes["Soft"]!)
//        case "Medium":
//            print(eggTimes["Medium"]!)
//        case "Hard":
//            print(eggTimes["Hard"]!)
//        default:
//            print("nil")
//        }
//    } // end func
    
    //----------timerOfEggs-------------------------
    let eggTimes2 = ["Soft": 4, "Medium": 480, "Hard": 720]
    var totalSecondes = 0
    var secondsPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer?
    
    @IBAction func startTimer(_ sender: UIButton) {
//        Timer.invalidate()  // error >> solution creat var timer && = Timer()
        timer.invalidate()  // DONE
       let hardness2 = sender.currentTitle!
        let totalSecondes = eggTimes2[hardness2]!
        
        barProgress.progress = 0.0
        secondsPassed = 0
        self.titleLabel.text = hardness2
        //-----------------------
//        print("softTime: \(totalSecondes) minutes = \(totalSecondes*60) seconds ")
        //        secondsRemaining = eggTimes2[hardness2]!*60
        //        print("softTime = \(secondsRemaining) seconds ")
        //---------timer and play sound---------------
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
            updateTimer()
            func updateTimer() {
                if self.secondsPassed < totalSecondes {
                    self.secondsPassed += 1
                    self.barProgress.progress = Float(self.secondsPassed) / Float(totalSecondes)
                    print(Float(self.secondsPassed) / Float(totalSecondes))
                    //                print ("\(self.totalSecondes) seconds")
                }
                else{
                    self.timer.invalidate()
                    self.titleLabel.text = "DONE!"
                    
                    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
                    self.player = try! AVAudioPlayer(contentsOf: url!)
                    self.player?.play()
                }
                
            }
        // -----------------------------------------------
                //    func playSound() {
                //        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
                //            return }
                //        let url = URL(fileURLWithPath: path)
                //
                //        do {
                //            player = try AVAudioPlayer(contentsOf: url)
                //            player?.play()
                //
                //        } catch let error {
                //            print(error.localizedDescription)
                //        }
                //    }
            
        }

    } // end Button 2
    
    
    @IBOutlet weak var titleLabel: UILabel!

    
    @IBOutlet weak var barProgress: UIProgressView!
    
    
    
}
