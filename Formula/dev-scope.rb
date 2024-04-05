class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.40"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.40/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "7bab6fbf6e92f04bf1f7f6605716073cf93a2d10a29b66d193820ce5b59ea2e3"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.40/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "c064c5f6ecee66ab4895e2b183a75c2fc3f23705e4b09644edf193fe01a76a3e"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.40/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "52566fa6678f553af52d8036ea6fe98fe87e1de0f972013f70cc7c98a0cb1785"
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
