//
//  ZCRootVC0.swift
//  ZCSwiftKit
//
//  Created by zjy on 2022/12/16.
//

import UIKit

class ZCRootCell: UITableViewCell {
    
    let doneBtn: UIButton = {
        let btn = UIButton.init(type: .custom)
        btn.frame = .init(x: 250, y: 0, width: 100, height: 50)
        btn.backgroundColor = .yellow
        return btn
    }()
    let leftLab: UILabel = {
        let lab = UILabel.init(frame: .init(x: 0, y: 0, width: 100, height: 52))
        lab.font = .boldSystemFont(ofSize: 20)
        lab.textAlignment = .left
        lab.textColor = .blue
        return lab
    }()
    var rightLab: UILabel? = nil
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .lightGray
        selectionStyle = .none
        initUI()
    }
    
    func initUI() {
        rightLab = .init(frame: .init(x: 120, y: 0, width: 100, height: 52))
        rightLab?.font = .systemFont(ofSize: 20)
        rightLab?.textAlignment = .right
        rightLab?.textColor = .red
        doneBtn.addTarget(self, action: #selector(onTouch(sender:)), for: .touchUpInside)
        
        contentView.addSubview(leftLab)
        contentView.addSubview(rightLab!)
        contentView.addSubview(doneBtn)
    }
    
    func loadCID(_ data: Dictionary<String, String>) {
        leftLab.text = "  " + (data["title"] ?? "")
        rightLab?.text = "desc: \(data["desc"]!)"
    }
    
    @objc func onTouch(sender: UIButton) {
        print(#function)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ZCRootVC0: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let listView = UITableView.init(frame: UIScreen.main.bounds, style: .grouped)
    var datas = [[String: String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        structureUI()
    }

    func structureUI() {
        self.title = "Search"
        self.view.backgroundColor = UIColor.white
        
        self.datas.append(["title": "哈哈", "desc": "描述"])
        self.initialTableView()
        
        self.view.addSubview(listView)
        
        
        
        
        
        let f: Substring = "null"
        //let x = ["x":f]
        let a = String.valid(f)
        print("xxxxxxxxx->\(a)")
    }
    
    //MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.datas.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        64
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        .init(frame: .init(x: 0, y: 0, width: tableView.frame.size.width, height: 30))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        52
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ZCRootCell
        if cell == nil { cell = ZCRootCell.init(style: .default, reuseIdentifier: "cell") }
        cell?.loadCID(self.datas[indexPath.row])
        return cell!
    }
    
    //MARK: Private
    func initialTableView() {
        listView.dataSource = self
        listView.delegate = self
        listView.contentInsetAdjustmentBehavior = .never
        listView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        listView.tableHeaderView = UIView.init(frame: .init(x: 0, y: 0, width: 0, height: 0.01))
        listView.tableFooterView = UIView.init(frame: .init(x: 0, y: 0, width: 0, height: 0.01))
        
        listView.estimatedSectionFooterHeight = 0
        listView.estimatedSectionHeaderHeight = 0
        listView.estimatedRowHeight = 0
        listView.sectionHeaderHeight = 0
        listView.sectionFooterHeight = 0
        listView.rowHeight = UITableView.automaticDimension
        listView.showsHorizontalScrollIndicator = false
        listView.showsVerticalScrollIndicator = true
        listView.isDirectionalLockEnabled = true
        listView.backgroundColor = .clear
        listView.separatorStyle = .none
        listView.separatorInset = .zero
        listView.bounces = true
    }

}

