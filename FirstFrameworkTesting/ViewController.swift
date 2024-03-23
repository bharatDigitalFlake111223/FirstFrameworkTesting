//
//  ViewController.swift
//  FirstFrameworkTesting
//
//  Created by Bharat Shilavat on 20/03/24.
//

import UIKit
import AllInOneAnimatorView

class ViewController: UIViewController {
    
    let contentView = ContentView()
    
    @IBOutlet weak private var contentV: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .cyan
        
        //MARK: - Image  Example -
        //Example 1: Remote ImageView Image (any Type Image)-
        contentV.addSubview(contentView)
        contentView.frame = contentV.bounds
       
        
        //Example 1: Remote ImageView Image (any Type Image)-
//        let imgUrl = "https://as2.ftcdn.net/v2/jpg/04/18/14/07/1000_F_418140711_17MABqvsHliakAlXlZy0vFnZkUBZos6g.jpg"
//        contentView.setup(with: .withInfo(fileOrUrlName: imgUrl, fileType: .jpg, viewContentMode: .scaleAspectFill))


        //Example 2: Local ImageView Image (any Type Image)-
//        let imgUrl = "LoginPageImg"
//        contentView.setup(with: .withInfo(fileOrUrlName: imgUrl, fileType: .jpg))
////
        //MARK: - Animation View MP4 Example -
        //Example 3: Local AminationVedio Support Offline (MP4) -
//        let animationVedioName = "animationVedio"
//        contentView.setup(with: .withInfo(fileOrUrlName: animationVedioName, fileType: .mp4))

      //  Example 4: Remote AminationVedio Support Online (MP4) -
//        let animationVedioName = "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"
//        contentView.setup(with: .withInfo(fileOrUrlName: animationVedioName, fileType: .mp4))
        
//        Example 5: Local AminationVedio Support offline (MP4) -
        let vedioSong = "vedioSong"
        contentView.setup(with: .withInfo(fileOrUrlName: vedioSong, fileType: .mp4,isMuted: true))

        
        //MARK: - Lotties Example -
      //  Example 6: Local Lottie json file '
//        let lottieLocalFile = "hourglass (3)"
//        contentView.setup(with: .withInfo(fileOrUrlName: lottieLocalFile, fileType: .json))
        
//       //  Example 7: Remote Lottie json file'
//        let lottieUrlRemote = "https://assets7.lottiefiles.com/packages/lf20_zjWtZvOKH8.json"
//        contentView.setup(with: .withInfo(fileOrUrlName: lottieUrlRemote, fileType: .json,viewContentMode: .bottomLeft))
                
        
        //MARK: - Gif Example -
//        //Example 8: Local Gif File play
//        let gifLocalFile = "sun-6751"
//        contentView.setup(with: .withInfo(fileOrUrlName: gifLocalFile, fileType: .gif,viewContentMode: .center))
//        
//        //Example 9: Remote Gif File play - Going out of Bound -
//        let remoteGifFile = "https://gifbin.com/bin/4802swswsw04.gif"
//        contentView.setup(with: .withInfo(fileOrUrlName: remoteGifFile, fileType: .gif,viewContentMode: .center))
    }
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           contentView.stopPlayer()
       }
}
