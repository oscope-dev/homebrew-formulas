class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  homepage "https://github.com/oscope-dev/scope"
  version "2024.2.69"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.69/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "dbd8e35b03cce033442875e87e30b9f2056de6f4d54a58ccd99312b47167670d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.69/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "52e6751b22dbecad94e312d38ebb97a86e951090e9f60a41b999bb73ad3bab66"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/oscope-dev/scope/releases/download/v2024.2.69/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "2835db0ffe540176eb57853ada59777865bb095cf86dc8fbc08bb0e3b37b326d"
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
