class Skerry < Formula
  desc "Dual-frontend text editor for mixed-size workloads"
  homepage "https://github.com/sorenmat/skerry"
  url "https://github.com/sorenmat/skerry/releases/download/v0.1.10/Skerry-linux-x86_64.tar.gz"
  version "0.1.10"
  sha256 "5cac18f843199bc9da6d0a2fae7cf25a202d8a476d8a7f1e7dac5c9779af2f54"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on arch: :x86_64
  depends_on :linux

  def install
    bin.install "bin/skerry"
    bin.install "bin/skerry-tui"
    bin.install_symlink "skerry" => "sky"
  end

  test do
    assert_predicate bin/"skerry", :executable?
    assert_predicate bin/"skerry-tui", :executable?
    assert_equal (bin/"skerry").realpath, (bin/"sky").realpath
  end
end
