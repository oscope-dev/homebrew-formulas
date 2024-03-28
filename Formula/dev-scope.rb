class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.35"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.35/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "174d6ae66b4d9cda49473b78aa89b21cf455b18b6d9fc46278e22051f73e2efc"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.35/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "f4f14f3608616175116646b95870404a2d273e96c176781e74100267c133e243"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.35/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f1eb877e4902345e98f3e6317dbe47e20de3aada0a3a6a813f52ecbc86fc1ca8"
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
