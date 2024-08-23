class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.60"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.60/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "46f3d5dfe4c3b85e00981e8690cb5d7ca17534553624baf3ad36ea57962432a2"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.60/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "b3d59fd36f904b5bad12c42c1e2f525b3a8223bd9f22f3375e661cea6fb30a4c"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.60/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "bf8d19a1473a523f0f82723f783b9ea09fb100cf0d3563eef7da88e455a4b0f0"
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
