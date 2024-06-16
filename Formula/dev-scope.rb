class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.58"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.58/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "ffbbc2fa3b8a96eb1c5cf285b1835d34cedb5169aa89f2aa15b20b6e306fd7ba"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.58/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "4b91a916bf65e2c6790819efaa2d1f2cd770826be4ba40e62c552f0a8799d095"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.58/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "605780099a3607550fe12cae93e353bab7a3486ede69442a815f9e294e418dea"
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
