class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.48"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.48/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "827551640e2c6844d39bb5236763322cfc61769aa708491e5af35d9060b54f47"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.48/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "1ce09a9547e163105bebbcb439d79de1e9804724b4e922d6fc4676c532b60f68"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.48/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "457d8a958a2a5954823fe7ac2bf81116594d02d8393a9e79147f18b60ac6d267"
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
