class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.54"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.54/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "81c9c8e9307ae0f137e9fc6fe2b1033fa231ef29fb4ee13272e022f57b1e4d10"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.54/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "eb04947f99103489004ad8547fd9f4f4ceb5b0daa7606db29a8af9a2030f9d12"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.54/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "99bcb1dd2da75262e48e81c50c7bd46324f39b4acf4869f6f76b03fa9406a286"
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
