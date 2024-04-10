class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.44"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.44/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "95e7efc516b92d32c7312966839a9a246c9990685bcfcf34263aca75ae634893"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.44/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "d31306c821ebbe9a50a03ee19eed712dc6d1ba2d4b1be54c861de7c5ced854a7"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.44/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7295bc57cb3ff227aa33e99ce0a34a8d69f92dd6565bb8e3d1c49ac6d68dc637"
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
