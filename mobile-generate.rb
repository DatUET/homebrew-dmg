class MobileGenerate < Formula
  desc "This is tool for generate mobile for Darwin"
  homepage ""
  url "https://github.com/DatUET/mobile-generate/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "6888ead8f8604740466073b6cc48fc39f6e0c5f8ac6f52a6f87f8f3d176bb8c7"
  license ""

  def install
    bin.install "dmg.sh" => "dmg"
  end

  test do
    expected_version = "0.0.4"
    actual_version = shell_output("#{bin}/dmg --version").strip
    assert_match expected_version, actual_version
  end
end
