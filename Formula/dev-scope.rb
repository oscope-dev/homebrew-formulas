class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.53"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.53/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "81101cc631300771afd29c0434f75d4440b4576d6571dc007e1b132f80508a5b"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.53/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "7c68ff9022474b66a08084c9f6fcc8d4c99bdcceb2cde58d1a89acac09e2d3e1"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.53/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "425717cc75baace405a2e6fd6a6c03d8d8ef995190bf64fbd731db03d7c5cba4"
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
