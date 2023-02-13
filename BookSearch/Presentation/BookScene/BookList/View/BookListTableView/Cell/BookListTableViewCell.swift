//
//  BookListTableViewCell.swift
//  BookSearch
//
//  Created by ChangMin on 2023/02/12.
//

import UIKit

import SnapKit

final class BookListTableViewCell: UITableViewCell {
    static let identifier = String(describing: BookListTableViewCell.self)
    static let height = CGFloat(200)
    
    private lazy var bookTitle: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .boldSystemFont(ofSize: 16)
        return label
    }()
    
    private lazy var bookAuthor: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var bookPublisher: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var bookPubDate: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    
    private lazy var bookDescription: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 5
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        setupViewLayout()
    }
    
    required init?(coder: NSCoder) { fatalError() }
}

extension BookListTableViewCell {
    func setupView(book: Book) {
        bookTitle.text = book.title
        bookAuthor.text = book.author
        bookPublisher.text = book.publisher
        bookPubDate.text = book.publishDate
        bookDescription.text = book.description
    }
    
    private func setupViewLayout() {
        [bookTitle, bookAuthor, bookPublisher, bookPubDate, bookDescription]
            .forEach { contentView.addSubview($0) }
                
        bookTitle.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(16)
        }
        
        bookAuthor.snp.makeConstraints {
            $0.leading.equalTo(bookTitle)
            $0.top.equalTo(bookTitle.snp.bottom).offset(8)
        }
        
        bookPublisher.snp.makeConstraints {
            $0.leading.equalTo(bookTitle)
            $0.top.equalTo(bookAuthor.snp.bottom).offset(8)
        }
        
        bookPubDate.snp.makeConstraints {
            $0.leading.equalTo(bookPublisher.snp.trailing).offset(8)
            $0.centerY.equalTo(bookPublisher)
        }
        
        bookDescription.snp.makeConstraints {
            $0.leading.trailing.equalTo(bookTitle)
            $0.top.equalTo(bookPublisher.snp.bottom).offset(8)
            $0.bottom.equalToSuperview().inset(16).priority(.low)
        }
    }
}
