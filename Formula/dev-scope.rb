class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.39"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.39/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "b205ae2aea53836c086c623eb1afeef08271dd83ec7ea90f88eb4f3beee7148f"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.39/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "b8ea8dab08cc0eb8ae8cdc52d6e61dc7fa26b9d970ebfb45cc4fd0a84c5963c8"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.39/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "97bbd5f8b24ddfbb69d4e2ab473ffe04362e65f452d494dbdd2205184b48304f"
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
