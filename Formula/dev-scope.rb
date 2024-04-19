class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.47"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.47/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "56220c7ca464750a36671a278c1bc4c681a1037988013b8d219be23f230f1f39"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.47/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "3207df3fb707a144e9986251093960a2d077ed8e8767b7d125d16a2fc319821d"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.47/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "78e5b40aae6bd0652facd4e437ee665b2e243168784ec13469a3d051cefa9e94"
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
