class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.55"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.55/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "ae3fe00951b27185a7bae1f53728c3ea1016c2916c57e5b7a973998110f88743"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.55/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "aec80563c58565263356657c14d05e50c92745cebcb286e9c7177b89c31b6fce"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.55/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3769e0c19081d71bb1ed8918ecba5ce84753efbff4abd9fd40e28b2b0150d313"
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
