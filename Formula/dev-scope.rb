class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.37"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.37/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "51aec015e4e7a38a0a6bfd8e799037cfa234d6db7a14d30261660767164fe877"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.37/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "42982dd66bf6abe18256333968429a1aaa9944eea135f07da4f27cd9b1aace14"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.37/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "502ccb968bcb8a050555dc4a0cbd1d1560ee956145a8ed76d0520dfd683ec9c6"
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
