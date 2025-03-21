class MobileGenerate < Formula
  desc "This is tool for generate mobile for Darwin"
  homepage ""
  url "https://github.com/DatUET/mobile-generate/archive/refs/tags/v0.1.6.tar.gz"
  # url "file:///Users/datpham/Desktop/test/dmg/mobile-generate/dmg.tar.gz"
  sha256 "20a7144143189e85e133f072fee2734c7c0a30332dc3dbb162d34614266abb12"
  license ""
  version "0.1.6"
  depends_on "go" => :build
  depends_on "git"

  
  def fg_color(string, rgb_values)
    "\e[38;2;#{rgb_values}m#{string}\e[0m"
  end

  def install
    system ("git clone git@gitlab.com:DatUET/mobile_generate_script.git bin")
    bin.install Dir["bin/*"]
    system ("go version")
    system ("go mod init mobile_generate") if !File.exist?("go.mod")
    system ("go mod tidy")
    system ("go build -o dmg main.go")
    bin.install "dmg" => "dmg"
  end

  test do
    expected_version = "0.1.6"
    actual_version = shell_output("#{bin}/dmg --version").strip
    assert_match expected_version, actual_version
  end
end
