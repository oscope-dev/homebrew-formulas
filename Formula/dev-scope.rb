class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.50"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.50/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "6d9e4d9b0713259c9f49b662341b826ff0b5b771c6b45874a3dae0e2bb667bec"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.50/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "52255ca8c4b9cc74cdef02d05d76a20a1d46aa580aa235307e86e9538404cfea"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.50/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "a3632a58c729454cde5020d8b7ef6fb4d7b0340c663516aa4886c0618b0e4d84"
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
