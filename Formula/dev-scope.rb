class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.51"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.51/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "acf314b40cb8b9c0c350b63cd86f348ec08365bc85219e97f321dad635bdf8dc"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.51/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "c07b103ddcd845efcfc36454f198eb9286c01bc2ea14a9e68f2e8f9d7b476b98"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.51/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "17f43deba8e93c47ef3618a80b635df18edb6ff247205676eb63117c02809f98"
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
