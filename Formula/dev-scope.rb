class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  homepage "https://github.com/oscope-dev/scope"
  version "2024.2.71"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.71/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "b09b1aaa675af3cceb9b49552b5019309c87fdf2737689acf560346c4ae9866d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.71/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "41543a0fcb72311efe29c5b913a2ab833ef782fa42cdebf7bc8c34cc7694487e"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/oscope-dev/scope/releases/download/v2024.2.71/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "2e841a71601fb25a063c7a2b9d734ad57452c4c2eba966028b235e5859f07aef"
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
