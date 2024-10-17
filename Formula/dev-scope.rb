class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.61"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.61/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "7020750c7c588942abcc1143b900f2defa9eb82de81847040fa1c93a25dffb66"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.61/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "a918bb0c2e54bbbac6ffd8a8a37dad46a39b3dee3ffb101786f835ba06294da6"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.61/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "590e90094b9b9421a70daf4227999637e8bd616f4aa5202a3656ebb85b047dc5"
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
