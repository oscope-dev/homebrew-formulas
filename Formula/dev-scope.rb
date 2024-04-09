class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  version "2024.2.42"
  on_macos do
    on_arm do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.42/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "553642c2952a8bf551270bf1fb71a3371f8afa21ecde7297e74618d08dfe9ac3"
    end
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.42/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "ddce3367d1dee175dd389d8e205a05ad81924036714d2c1bcb1acc00d2591a43"
    end
  end
  on_linux do
    on_intel do
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.42/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "3411adc1185a2a108baafcd7fb33a7d7a477187a4de2416fc775839bb1593699"
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
