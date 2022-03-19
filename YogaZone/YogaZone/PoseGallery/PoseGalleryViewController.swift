//
//  PoseGalleryViewController.swift
//  YogaZone
//
//  Created by Philippe Muniz Gomes on 12/03/22.
//

import UIKit

class PoseGalleryViewController: UIViewController {
    var poses: [Pose] = []
    
    @IBOutlet weak var poseLabel: UILabel!
    @IBOutlet weak var posesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupTableView()
        setupUI()
    }
}

// MARK: UI
extension PoseGalleryViewController {
    func setupUI() {
        
    }
    
    func setupTableView() {
        self.posesTableView.delegate = self
        self.posesTableView.dataSource = self
        self.posesTableView.register(PoseCell.getNib(), forCellReuseIdentifier: PoseCell.identifier)
        self.posesTableView.separatorStyle = .none
    }
}


// MARK: Data
extension PoseGalleryViewController {
    func setupData() {
        for n in 1...13 {
            var pose = Pose(id: n, name: poseNames[n] ?? "1", categories: [])
            
            pose.categories = [
                PoseCategory(id: 12, name: "Good", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Hard", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Impossible", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Math", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Geometrics", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Painful", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Annoying", description: "GitHub is united with the people of Ukraine and the international community."),
                PoseCategory(id: 12, name: "Nice", description: "GitHub is united with the people of Ukraine and the international community.")
            ]
            
            poses.append(pose)
        }
    }
}


// MARK: TableViewDelegate
extension PoseGalleryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.posesTableView.dequeueReusableCell(withIdentifier: PoseCell.identifier, for: indexPath) as? PoseCell
        let pose = poses[indexPath.section]
        
        cell?.setupCell(pose)
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedPose = poses[indexPath.section]
        let vc = PoseDetailViewController()
        vc.selectedPose = selectedPose
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: TableViewDataSource
extension PoseGalleryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return poses.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 4
    }
}
