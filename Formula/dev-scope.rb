class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.41"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.41/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "696fe2d767aec782bd131124f2461c3748ce8e579159b972c4f130461d03b45f"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.41/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "16b2c45fe70ab54d70ad4ddfdbf14d4adfb49b52de0775705521a19a658866d9"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.41/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "6c5c147514037caf55c8fa221c12580e1eb95501f9a75e48f29df9f93f44f299"
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
