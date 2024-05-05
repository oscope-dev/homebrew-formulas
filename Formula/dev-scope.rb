class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.52"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.52/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "ee749ae1a3ba0249f533b279dd2ec113782dfee2ba3e4ec30428a10fcc5e7259"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.52/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "7d6770888e62baf8b35bc796960b76437056266d4c0abcb9c26415cb1440c487"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.52/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "17ad9554fc288fd2b7d2b5ae30b1cf50896f3277deb7b4901e2252c6ba01919b"
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
