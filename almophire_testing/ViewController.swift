//
//  ViewController.swift
//  almophire_testing
//
//  Created by Zignuts Technolab on 08/04/24.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    var apiResult = [Model]()

    @IBOutlet weak var apiDatatableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIHandler.sharedInstance.fetchingAPIData{ apiData in
            // Mark : Data Assigning
            self.apiResult = apiData
            
            DispatchQueue.main.async {
                self.apiDatatableView.reloadData()
            }
            
        }
        }

    }

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiResult.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else{ return UITableViewCell()}
        cell.textLabel?.text = apiResult[indexPath.row].title
        return cell
    }
}


