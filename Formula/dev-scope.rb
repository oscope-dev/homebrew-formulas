class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  homepage "https://github.com/oscope-dev/scope"
  version "2024.2.77"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.77/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "ce261c71de3244c64dc92f3b3729da06d84eece9fb7b3842bb9a3e4cc243cb2b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.77/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "4ffb9824d63830893fcd926a6899cf0fb442a04a52546952836ccccb3eaaed3a"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/oscope-dev/scope/releases/download/v2024.2.77/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "f6b4e2b86a5b365a644b2029f0e491952504ec3fe346676e6938239bbf93d241"
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
