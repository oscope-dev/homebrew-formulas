class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.32"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.32/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "7aed161a2de561f44e17a7b2371b51d9ce045b154845b5ccd71a6699bd3add23"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.32/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "39b70f70a9ea04d90dc680e728c9e924a22e7e14695f6f7b3149dbe4a1b217ed"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.32/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ea3175bde2aa5439fcd2ebaa1fb90896c68e12b770fa224477ca62ba28b74ee0"
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
