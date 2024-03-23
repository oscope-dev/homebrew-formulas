class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.30"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.30/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "a70d564f36ad9edee276329af471d6dec2a511e0e54dbc4a8e28676989f0a20c"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.30/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "b7ef9de0ae2ae53b0b080241b7326b2b40e6b2b0a6a7f098cfacc32c3f8b0b54"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.30/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "7d901634bf75bb714dfbd4215773eedf01a3af6c98715f0f17df4b5bc60ee5b5"
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
