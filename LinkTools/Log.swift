import os.log
import Foundation

public struct Log {
  private static let log = OSLog(subsystem: "io.github.halo.LinkLiar", category: "logger")

  public static func debug(_ message: String) {
    os_log("%{public}@", log: log, type: .debug, message)
    appendToLogfile(message, prefix: "DEBUG")
  }

  public static func info(_ message: String) {
    os_log("%{public}@", log: log, type: .info, message)
    appendToLogfile(message, prefix: "INFO ")
  }

  public static func error(_ message: String) {
    os_log("%{public}@", log: log, type: .error, message)
    appendToLogfile(message, prefix: "ERROR")
  }

  private static func appendToLogfile(_ message: String, prefix: String) {
    let data = "\(prefix) \(message)\n".data(using: .utf8)!

    if let fileHandle = FileHandle(forWritingAtPath: Paths.debugLogFile) {
      defer {
        fileHandle.closeFile()
      }
      fileHandle.seekToEndOfFile()
      fileHandle.write(data)
    } else {
      /*
      #if DEBUG
        do {
          try data.write(to: Paths.debugLogFileURL)
        } catch {}
        // There is no logfile, which means the end-user does not want file logging
      #endif
      */
    }
  }

}
