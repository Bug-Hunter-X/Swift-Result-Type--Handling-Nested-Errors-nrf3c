func fetchData(completion: @escaping (Result<[Data], Error>) -> Void) {
    // ... some asynchronous network operation ...
    if let error = someError {
        completion(.failure(error))
    } else {
        completion(.success(someData))
    }
}

fetchData { result in
    switch result {
    case .success(let data):
        // Process the data
    case .failure(let error):
        print("Error: "
              + error.localizedDescription) // This only prints the top-level error
    }
}