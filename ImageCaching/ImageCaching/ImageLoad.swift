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
        
        guard let url = URL(string: "https://picsum.photos/1000") else { return }
        
        // url을 데이터로 변환
        guard let data = try? Data(contentsOf: url) else { return }
        
        // loading actual size of the image
        // memory usage = 30.8mb
        imageView.image = UIImage(data: data)
    }
    
    
}
