class Skerry < Formula
  desc "Dual-frontend text editor for mixed-size workloads"
  homepage "https://github.com/sorenmat/skerry"
  url "https://github.com/sorenmat/skerry/releases/download/v0.1.7/Skerry-linux-x86_64.tar.gz"
  sha256 "cec1fc21cfb66300599a714d31cad8d1fc5996503bae9804ec0328ff372b7b84"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on arch: :x86_64
  depends_on :linux

  def install
    bin.install "Skerry-linux-x86_64/bin/skerry"
    bin.install "Skerry-linux-x86_64/bin/skerry-tui"
    bin.install_symlink "skerry" => "sky"
  end

  test do
    assert_predicate bin/"skerry", :executable?
    assert_predicate bin/"skerry-tui", :executable?
    assert_equal (bin/"skerry").realpath, (bin/"sky").realpath
  end
end
