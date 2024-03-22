class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.28"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.28/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "e3f8dff59cf7568caa2c59b33977a90dfb724271ab9c53809e0d9e7babae064e"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.28/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "d75bcc8dc654da7a06504ccb3daf1953dc3bd4d9a4a32fd8b81d7ce7d155072b"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.28/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a24b98aaf132f1681e077bff2bd253d3acc3cef2576b3d41e06360879e4d8eee"
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
