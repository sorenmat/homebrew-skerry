class Skerry < Formula
  desc "Dual-frontend text editor for mixed-size workloads"
  homepage "https://github.com/sorenmat/skerry"
  url "https://github.com/sorenmat/skerry/releases/download/v0.1.6/Skerry-linux-x86_64.tar.gz"
  sha256 "df4eda898912ca9bc6b419b5c753c572f3e8173fac6db9d9ec239207704364b5"
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
