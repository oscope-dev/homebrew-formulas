class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.34"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.34/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "36b4fa50d5f3e07c2007f800c355033b21378b32c5a2b2d28b824c1d238c2f9d"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.34/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "fa5f00020350bdbaa405ae50bf90a5eb240dd5c48311361d360942559c0fb68a"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.34/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "af0d732ace1f5a0dea129ab4707faf3e3993c54cc037f5a26b1d8561c1c85ac2"
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
