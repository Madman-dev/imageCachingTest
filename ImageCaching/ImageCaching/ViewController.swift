//
//  ViewController.swift
//  ImageCaching
//
//  Created by Jack Lee on 2023/12/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableview: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(TestCell.nib(), forCellReuseIdentifier: "TestCell")
        tableview.delegate = self
        tableview.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TestCell.identifier, for: indexPath) as! TestCell
        let testImage = UIImage(systemName: "person.fill")
        let secondImage = UIImage(systemName: "photo")
        
        cell.myLabel.text = "이렇게 바꿈"
        cell.myImageView.image = testImage
        cell.secondImage.image = secondImage
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    
}
