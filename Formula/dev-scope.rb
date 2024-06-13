class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.57"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.57/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "87303db4c6b44dd301c3f7d89d562d01bd4a5de9e10d0da2c9143ca471ebf1cf"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.57/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "8218666f0411aa352aa88889f998e50ad8012c509f1a5a7573eb3887d12f67c5"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.57/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7f3325122dab7a0e144fbe4e968c1b756979d57646d0869446750f2ffbd047bb"
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
