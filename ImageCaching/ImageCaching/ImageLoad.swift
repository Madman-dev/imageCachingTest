//
//  ImageLoad.swift
//  ImageCaching
//
//  Created by Jack Lee on 2023/12/17.
//

import UIKit

class ImageLoad: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func fetchImageTapped(_ sender: UIButton) {
        guard let url = URL(string: "https://picsum.photos/1000") else { return }
        
        UIView.animate(withDuration: 2) {
            self.imageView.transform = CGAffineTransform(rotationAngle: .pi)    // when trying to rotate newly loaded image, delay occurs. Need to download new image - locks UI in place.
        }
        
        DispatchQueue.global().async {  // enables locked UI to continue loading along with the animation
            // 1. url을 데이터로 변환
            guard let data = try? Data(contentsOf: url) else { return }
            
            //MARK: - loading actual size of the image
            /*
             Before loading image - memory usage = 24.8mb
             Actual image size being 1000 * 1000 - memory usage = 30.8mb
             */
            
            // imageView.image = UIImage(data: data)
            
            //MARK: - loading image using smaller image
            /*
             currently loaded image size 300 * 300 - memory usage = 28.6 ~ 7mb
             currently loaded image size 100 * 100 - memory usage = 28.1
             */
            
            let image = UIImage(data: data)
            
            image?.prepareThumbnail(of: CGSize(width: 100, height: 100),
                                    completionHandler: { image in
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            })
        }
    }
}
