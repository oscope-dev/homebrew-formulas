class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.43"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.43/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "4365e97f079cee8cc744cb532c7d5f5516135db5d85bd3eecf3c952ed3dc9306"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.43/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "05bd7e12aaa9cf3d16f043e509543d5e70cb9964b5d331940b830d49129bfc11"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.43/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "5e06c7f897aa7cb148624ffdf73242c041eaac5c6598ff2a52cbb295dbd05c02"
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
