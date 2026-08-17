class Skerry < Formula
  desc "Dual-frontend text editor for mixed-size workloads"
  homepage "https://github.com/sorenmat/skerry"
  url "https://github.com/sorenmat/skerry/releases/download/v0.1.8/Skerry-linux-x86_64.tar.gz"
  version "0.1.8"
  sha256 "d311bd4e0f7f813731f84e97343502d680b4e60f8f51be4c9bf4914a520d048a"
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
