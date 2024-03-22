class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.29"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.29/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "fc05eb4d95711709d75dfd27a1db5ac8f971fd70a04cb045fb5a8a679c9035e2"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.29/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "dd2556c99a28f6d2ba50c1626f52bfad89fee54b0ecd1259bc89a840a38b3928"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.29/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "28fbb326d2dc04b534664e76006b8d3baae7d956600f81ef35f4d38205cd7c65"
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
