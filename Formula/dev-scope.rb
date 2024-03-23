class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.31"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.31/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "513cb49d0fcfae9e4e2606c2101a89fa92c6091e75f29eeb4142dc7cebd54bd6"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.31/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "b8887eb9f170094a3cc7becde089ecdcfa7d39c55e78f374ec45cc208b071cf0"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.31/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "836a0d687d949d521a70516d81b5eb38280fcbccd7c92522b4600060032a36af"
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
