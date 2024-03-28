class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.36"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.36/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "d3ef2cbc03eabe361d98967531a1de8dd9ee440320cd2471f92dd6fca7eb6e1c"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.36/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "143a37b797249d4f3c76c4a1c414a9faeb7db63e818bd7f071288d0a6d6bca3d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.36/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3e019d9bc469c9cd88150ec27a71a65245e3b9a94f4b875ba53f34f40ebb4825"
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
