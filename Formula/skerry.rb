class Skerry < Formula
  desc "Dual-frontend text editor for mixed-size workloads"
  homepage "https://github.com/sorenmat/skerry"
  url "https://github.com/sorenmat/skerry/releases/download/v0.1.9/Skerry-linux-x86_64.tar.gz"
  version "0.1.9"
  sha256 "d69b21361e5b9a2ac45ac150b222c03e024c2fbfb599f82a5d5a97181883fa0d"
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
