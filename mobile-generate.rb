class MobileGenerate < Formula
  desc "This is tool for generate mobile for Darwin"
  homepage ""
  url "https://github.com/DatUET/mobile-generate/archive/refs/tags/v0.0.9.tar.gz"
  # url "file:///Users/datpham/Desktop/test/mobile-generate/dmg.tar.gz"
  sha256 "1dee8a596f7bf580cf5ec6a5238cc6fb1ba8b4e2bd113dc60a2f3caf8d4b4efa"
  license ""
  version "0.0.9"
  depends_on "go" => :build
  depends_on "unzip"
  depends_on "bash"
  
  def fg_color(string, rgb_values)
    "\e[38;2;#{rgb_values}m#{string}\e[0m"
  end

  def install
    puts fg_color("Enter install pasword: ", "139;233;253")
    system ("bash dmg_install.sh")
    bin.install Dir["bin/*"]
    system ("go version")
    system ("go mod init mobile_generate") if !File.exist?("go.mod") # Khởi tạo module Go
    system ("go mod tidy") # Cài đặt dependencies
    system ("go build -o dmg main.go") # Build binary
    bin.install "dmg" => "dmg"
  end

  test do
    expected_version = "0.0.5"
    actual_version = shell_output("#{bin}/dmg --version").strip
    assert_match expected_version, actual_version
  end
end
