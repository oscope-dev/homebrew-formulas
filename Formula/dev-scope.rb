class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.46"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.46/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "b1cd77690c1cc66e570304c24aec97916800fa681e44cc89f05149fd72d07a59"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.46/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "219381fe1521c5ea12a9793fabafc04eb2753f53a35262d8de773ff395faa384"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.46/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "46f14fab818bc15464f9a78a5e85aff27df2d2812281dbadd17dd603c289e012"
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
