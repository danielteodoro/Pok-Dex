import Foundation
import Network

// USAGE:
// let networkPerformer = NetworkOperationPerformer()
//
//    Task {
//        // Test case: Attempt a network operation with a 5-second timeout.
//        await networkPerformer.performNetworkOperation(using: {
//            print("Network operation executed!")
//        }, withinSeconds: 0.00000001)
//    }

/// A singleton actor that monitors the network status using `NWPathMonitor`.
actor NetworkMonitor {
    private let monitor = NWPathMonitor()
    private var currentPathStatus: NWPath.Status = .requiresConnection
    private var listeners = [CheckedContinuation<Bool, Never>]()

    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            Task { await self?.handlePathUpdate(path) }
        }
        monitor.start(queue: DispatchQueue.global())
    }

    /// Handles changes to the network path and notifies waiting listeners.
    private func handlePathUpdate(_ path: NWPath) async {
        currentPathStatus = path.status
        let isConnected = currentPathStatus == .satisfied

        // Notify all waiting listeners if the network status changes to connected.
        if isConnected {
            listeners.forEach { $0.resume(returning: true) }
            listeners.removeAll()
        }
    }

    /// Checks if there is an active internet connection.
    func hasInternetConnection() -> Bool {
        return currentPathStatus == .satisfied
    }

    /// Waits for the network to become available asynchronously.
    func waitForInternetConnection() async -> Bool {
        if hasInternetConnection() {
            return true
        }

        // Suspend and wait for the network connection to become available.
        return await withCheckedContinuation { continuation in
            listeners.append(continuation)
        }
    }
}

public actor NetworkOperationPerformer {
    private let networkMonitor = NetworkMonitor()

    /// Attempts to perform a network operation within a specified timeout duration.
    /// - Parameters:
    ///   - closure: The operation to perform if the network is available.
    ///   - timeoutDuration: The maximum time to wait for a network connection.
    public func performNetworkOperation(
        using closure: @escaping () -> Void,
        withinSeconds timeoutDuration: TimeInterval
    ) async {
        if await networkMonitor.hasInternetConnection() {
            closure()
        } else {
            // Wait for network connection with a timeout
            let didConnect = await withTaskGroup(of: Bool.self, returning: Bool.self) { group in
                group.addTask { await self.networkMonitor.waitForInternetConnection() }
                group.addTask {
                    try? await Task.sleep(nanoseconds: UInt64(timeoutDuration * 1_000_000_000))
                    return false
                }

                // Return true if the network becomes available, otherwise false after the timeout.
                for await result in group where result {
                    return true
                }
                return false
            }

            if didConnect {
                closure()
            }
        }
    }
}
