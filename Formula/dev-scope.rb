class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.33"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.33/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "0e427566154aa4a0fc953b373c4ad46a278ed14016ed7fbedebb6ad12108962d"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.33/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "bd94feeaedd260a2bfe11bab021e3f5037fcfa17f52773db53f9a6adb8278154"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.33/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ccfb104e10b5a676e49ad84fc12003666d8b00529533aa13548568977a2cf111"
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
