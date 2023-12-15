// RUN: %target-swift-frontend -emit-sil -strict-concurrency=complete -enable-experimental-feature RegionBasedIsolation -disable-availability-checking %s -o /dev/null -import-objc-header %S/Inputs/transfernonsendable_crashers_objc.h

// REQUIRES: objc_interop

import Foundation

extension MyNotificationCenter {
  static var value = MyNotificationCenter()
}

public func handleFile(at location: URL) throws {
//  createDownloadDirectoryIfRequired()
  let movedFileLocation = try moveTheme(from: location)
  let unzippedFileLocation = try unzipFile(at: movedFileLocation)
  MyNotificationCenter.value!.post()
}

private func moveTheme(from location: URL) throws -> URL { fatalError() }
private func unzipFile(at location: URL) throws -> URL { fatalError() }
