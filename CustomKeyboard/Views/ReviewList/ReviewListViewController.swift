//
//  ViewController.swift
//  CustomKeyboard
//

import UIKit

class ReviewListViewController: UIViewController {

    private let repo = Repository()
    private var dataList = ModelData()
    
    private var reviewTableView: UITableView = {
        let reviewTableView = UITableView()
        reviewTableView.register(ReviewTableViewCell.self, forCellReuseIdentifier: "Cell")
        reviewTableView.register(ReviewListHeaderView.self, forHeaderFooterViewReuseIdentifier: "headerCell")
        return reviewTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        
        getData()
    }
    
    private func setLayout() {
        view.backgroundColor = .white
        view.addSubview(reviewTableView)
        reviewTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            reviewTableView.topAnchor.constraint(equalTo: view.topAnchor),
            reviewTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            reviewTableView.widthAnchor.constraint(equalTo: view.widthAnchor),
            reviewTableView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
    }
    private func getData() {
        repo.reviewData { result in
            switch result {
            case .success(let data):
                self.dataList = data
                self.reviewTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ReviewListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ReviewTableViewCell
        let reviewData = dataList.data[indexPath.row]
        cell.fetchDataFromTableView(data: reviewData)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "headerCell") as! ReviewListHeaderView
        headerCell.delegate = self
        return headerCell
    }
}

extension ReviewListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
}

extension ReviewListViewController: PresentButtonSelectable {
    func presentButtonStatus() {
        let createReviewVC = CreateReviewViewController()
        createReviewVC.modalPresentationStyle = .fullScreen
        self.present(createReviewVC, animated: true)
    }
}
