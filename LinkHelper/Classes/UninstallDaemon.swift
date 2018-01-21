/*
 * Copyright (C) 2012-2018 halo https://io.github.com/halo/LinkLiar
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files
 * (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify,
 * merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
 * LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

import Foundation

struct UninstallDaemon {

  static func perform() {
    removePlist()
    removeDirectory()
  }

  private static func removePlist() {
    do {
      try FileManager.default.removeItem(atPath: Paths.daemonPlistFile)
    } catch let error as NSError {
      Log.error("Could not delete Daemon plist at \(Paths.daemonPlistFile) is it there? \(error.localizedDescription)")
    }
  }

  private static func removeDirectory() {
    do {
      try FileManager.default.removeItem(atPath: Paths.daemonDirectory)
    } catch let error as NSError {
      Log.info("Could not delete Daemon directory at \(Paths.daemonDirectory) is it there? \(error.localizedDescription)")
    }
  }

}
