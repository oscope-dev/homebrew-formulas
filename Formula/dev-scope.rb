class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.59"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.59/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "23e901aa395bbec086e026d0ace66cec4ce1dca41c373ca0c0e57cfe03b97ddb"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.59/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "2115ec7c9b4f36dead13845911c1babdee8733ac672839f7b8172034d9d84273"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.59/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5b8f5f07974782558af7042b7aca83f4c5ee2bd230ac131e7898e0f116a36421"
    end
  end
  license "BSD-3-Clause"

  def install
    on_macos do
      on_arm do
        bin.install "scope", "scope-intercept"
      end
    end
    on_macos do
      on_intel do
        bin.install "scope", "scope-intercept"
      end
    end
    on_linux do
      on_intel do
        bin.install "scope", "scope-intercept"
      end
    end

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install *leftover_contents unless leftover_contents.empty?
  end
end
