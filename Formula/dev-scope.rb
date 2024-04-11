class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.45"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.45/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "b7e782bfdfa187463f78817f7e5f8cd7b558d56c5a11dd5e17ead5a0c99ff70a"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.45/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "e120db07245d5ecdb030c75aee5b5253ccbc8dde5b8971ac4fde7d68aef876e7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.45/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "84e9d68871696daf183a0be46dcfe656d1c0b3a473ca6182816c34a1c3e87c1d"
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
