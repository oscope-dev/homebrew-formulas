class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.38"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.38/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "86f5b0a074244b0d0623996549760afec451ebc1f109df4aff6cd215554c1d40"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.38/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "4b8b2a6915e1a3ece89f85cfffb3e58c2563856ee11e020fdc8423a55d000bef"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.38/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "76f51506ac2fe2059531370a7ac0e2e552aa7567031712cf58ea01f6df7ec8b3"
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
