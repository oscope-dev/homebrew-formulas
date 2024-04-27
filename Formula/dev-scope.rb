class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.49"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.49/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "cf7beb6fc8c6e9c81a6994528077a97fd84e9c530118fe66b2d0ab3cf92925d7"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.49/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "487d655c20a717e2f85f4411440bbe0cc75cf7f5d4d4d0d660d3fb3ea8d78540"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.49/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ea0e5266012bb2c8ff6fe4a3be047a23ad87009d085bd6806abf03127c92e64f"
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
