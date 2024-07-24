//
//  LearnViperTests.swift
//  LearnViperTests
//
//  Created by Afaq Ahmad on 22/07/2024.
//

import XCTest
@testable import LearnViper


// MARK: - Mock Presenter
class MockDetailPresenter: DetailInteractorOutput {
    var fetchedImage: UIImage?
    var fetchImageExpectation: XCTestExpectation?
    
    func didFetchImage(_ image: UIImage?) {
        fetchedImage = image
        fetchImageExpectation?.fulfill()
    }
}

final class DetailInteractorTests: XCTestCase {
    var interactor: DetailInteractorImpl!
    var mockPresenter: MockDetailPresenter!

    override func setUp() {
        super.setUp()
        interactor = DetailInteractorImpl()
        mockPresenter = MockDetailPresenter()
        interactor.presenter = mockPresenter
    }

    override func tearDown() {
        interactor = nil
        mockPresenter = nil
        super.tearDown()
    }

    func testFetchImage_WithCachedImage() {
        // Given
        let url = URL(string: "https://example.com/image.jpg")!
        let image = UIImage()
        interactor.imageCache.setObject(image, forKey: url as NSURL)
        
        // When
        let expectation = XCTestExpectation(description: "Fetch image from cache")
        mockPresenter.fetchImageExpectation = expectation
        
        interactor.fetchImage(from: url)
        
        // Then
        wait(for: [expectation], timeout: 1.0)
        XCTAssertEqual(mockPresenter.fetchedImage, image)
    }

    func testFetchImage_WithValidURL() {
        // Given
        let url = URL(string: "https://via.placeholder.com/150")!
        
        // When
        let expectation = XCTestExpectation(description: "Fetch image from URL")
        mockPresenter.fetchImageExpectation = expectation
        
        interactor.fetchImage(from: url)
        
        // Then
        wait(for: [expectation], timeout: 30.0)
        XCTAssertNotNil(mockPresenter.fetchedImage)
    }

    func testFetchImage_WithInvalidURL() {
        // Given
        let url = URL(string: "https://invalid.url/image.jpg")!
        
        // When
        let expectation = XCTestExpectation(description: "Fetch image from invalid URL")
        mockPresenter.fetchImageExpectation = expectation
        
        interactor.fetchImage(from: url)
        
        // Then
        wait(for: [expectation], timeout: 5.0)
        XCTAssertNil(mockPresenter.fetchedImage)
    }
}
