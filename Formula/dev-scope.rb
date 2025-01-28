class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  homepage "https://github.com/oscope-dev/scope"
  version "2024.2.67"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.67/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "f820cf0f21a0b53ed5129d166ddb2b384ad339cef2071617942406b3dc9ed2dc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.67/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "5f8a3415b1ce03697efcc0ea2b30c71d9541aa716353dd86b0e274a47e6748bb"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/oscope-dev/scope/releases/download/v2024.2.67/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "6b837f2328d015f44268ca55e5d93eeba8de84b8e0988e5aef8496e2d4e788ed"
  end
  license "BSD-3-Clause"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":              {},
    "x86_64-apple-darwin":               {},
    "x86_64-unknown-linux-gnu":          {},
    "x86_64-unknown-linux-musl-dynamic": {},
    "x86_64-unknown-linux-musl-static":  {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    bin.install "scope", "scope-intercept" if OS.mac? && Hardware::CPU.arm?
    bin.install "scope", "scope-intercept" if OS.mac? && Hardware::CPU.intel?
    bin.install "scope", "scope-intercept" if OS.linux? && Hardware::CPU.intel?

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
