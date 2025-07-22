class DevScope < Formula
  desc "A tool to help diagnose errors, setup machines, and report bugs to authors."
  homepage "https://github.com/oscope-dev/scope"
  version "2024.2.90"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.90/dev-scope-aarch64-apple-darwin.tar.xz"
      sha256 "5ddf418aa7923ed38b3450840d80a7ebd8efff94fe3f61b596fbce879d325ad9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/oscope-dev/scope/releases/download/v2024.2.90/dev-scope-x86_64-apple-darwin.tar.xz"
      sha256 "ae0db0308274957e4e7d8940cebe2f6306473f90f8da705cbf9daf632bb423e3"
    end
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/oscope-dev/scope/releases/download/v2024.2.90/dev-scope-x86_64-unknown-linux-gnu.tar.xz"
    sha256 "d1bdf7d2145706aa3a32e4f3d37b81c397b116450964b146f336cd7d2df55fc8"
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
