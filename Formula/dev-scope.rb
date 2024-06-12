class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.56"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.56/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "92f9dd3a4bc0462d3d07e8c1af1118908a2034258f8fdbad6a3e2ee258b75548"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.56/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "67f8ec9fc639ac072d805a01712ef3c7f2cdc30043e9acf9c973f29192c78475"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.56/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "700e61982cd5809633294457c053add357f2129d766cba65739ec28ec5154706"
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
