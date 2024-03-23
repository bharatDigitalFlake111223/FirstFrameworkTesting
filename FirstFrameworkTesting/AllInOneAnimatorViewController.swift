//
//  AllInOneAnimatorViewController.swift
//  FirstFrameworkTesting
//
//  Created by Bharat Shilavat on 23/03/24.
//

import UIKit
import AllInOneAnimatorView

class AllInOneAnimatorViewController: UIViewController {
    
    @IBOutlet weak var allContentTableView: UITableView!
    
    let contentTypes: [ContentType] = [.remoteImage("https://as2.ftcdn.net/v2/jpg/04/18/14/07/1000_F_418140711_17MABqvsHliakAlXlZy0vFnZkUBZos6g.jpg"),
                                       .localImage("LoginPageImg"),
                                       .localAnimation("animationVedio"),
                                       .remoteAnimation("http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4"),
                                       .localAnimation("vedioSong"),
                                       .localLottie("hourglass (3)"),
                                       .remoteLottie("https://assets7.lottiefiles.com/packages/lf20_zjWtZvOKH8.json"),
                                       .localGif("sun-6751"),
                                       .remoteGif("https://gifbin.com/bin/4802swswsw04.gif")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "ContentViewTableViewCell", bundle: nil)
        allContentTableView.register(nib, forCellReuseIdentifier: "ContentViewTableViewCell")
        allContentTableView.dataSource = self
        allContentTableView.delegate = self
    }
}
extension AllInOneAnimatorViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentTypes.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentViewTableViewCell", for: indexPath) as! ContentViewTableViewCell
        let contentType = contentTypes[indexPath.row]
        let contentViewTypes = convertToContentViewTypes(from: contentType)
        cell.configureCell(with: contentViewTypes)
        cell.contentNameLabelk?.text = contentType.description
        return cell
    }
    private func convertToContentViewTypes(from contentType: ContentType) -> [ContentViewType] {
        switch contentType {
        case .remoteImage(let url):
            return [.withInfo(fileOrUrlName: url, fileType: .jpg)]
        case .localImage(let name):
            return [.withInfo(fileOrUrlName: name, fileType: .jpg)]
        case .localAnimation(let name):
            return [.withInfo(fileOrUrlName: name, fileType: .mp4,isMuted: false)]
        case .remoteAnimation(let url):
            return [.withInfo(fileOrUrlName: url, fileType: .mp4,isMuted: false)]
        case .localLottie(let name):
            return [.withInfo(fileOrUrlName: name, fileType: .json)]
        case .remoteLottie(let url):
            return [.withInfo(fileOrUrlName: url, fileType: .json)]
        case .localGif(let name):
            return [.withInfo(fileOrUrlName: name, fileType: .gif)]
        case .remoteGif(let url):
            return [.withInfo(fileOrUrlName: url, fileType: .gif)]
        }
    }
}

extension AllInOneAnimatorViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contentType = contentTypes[indexPath.row]
        // Handle selecting content type
        print("Selected content type: \(contentType)")
    }
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let contentViewCell = cell as? ContentViewTableViewCell else { return }
        contentViewCell.conView.stopPlayer()
    }
}
enum ContentType {
    case remoteImage(String)
    case localImage(String)
    case localAnimation(String)
    case remoteAnimation(String)
    case localLottie(String)
    case remoteLottie(String)
    case localGif(String)
    case remoteGif(String)
    
    var description: String {
        switch self {
        case .remoteImage(let url):
            return "Remote Image: \(url)"
        case .localImage(let name):
            return "Local Image: \(name)"
        case .localAnimation(let name):
            return "Local Animation: \(name)"
        case .remoteAnimation(let url):
            return "Remote Animation: \(url)"
        case .localLottie(let name):
            return "Local Lottie: \(name)"
        case .remoteLottie(let url):
            return "Remote Lottie: \(url)"
        case .localGif(let name):
            return "Local Gif: \(name)"
        case .remoteGif(let url):
            return "Remote Gif: \(url)"
        }
    }
}
