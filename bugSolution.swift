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
        // Improved error handling to recursively extract nested errors
        print("Error: ", getRootError(error))
    }
}

// Helper function to recursively extract the root error
func getRootError(_ error: Error) -> String {
    if let unwrappedError = error as? CustomNSError {
        if let nestedError = unwrappedError.userInfo["NSUnderlyingError"] as? Error {
            return getRootError(nestedError) 
        } else {
            return error.localizedDescription
        }
    } else {
        return error.localizedDescription
    }
}

//Example custom error for demonstration
struct NetworkError: Error, CustomNSError {
    let underlyingError: Error?
    var errorCode: Int {
        return 1000
    }

    var errorUserInfo: [String : Any] {
        return [NSUnderlyingErrorKey: underlyingError ?? NSError(domain: "NetworkError", code: 1, userInfo: nil)]
    }
} 