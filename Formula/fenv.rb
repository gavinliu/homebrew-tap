class Fenv < Formula
  desc "Flutter SDK version manager for upstream and OpenHarmony releases"
  homepage "https://github.com/gavinliu/fenv"
  url "https://github.com/gavinliu/fenv.git",
      tag:      "v0.1.0",
      revision: "98747292ad89ef65125c7daf95f68737469764be"

  def install
    libexec.install "bin", "completions", "libexec", "share", "shims"
    bin.write_exec_script libexec/"bin/fenv", libexec/"bin/flutter-build"
  end

  test do
    assert_equal "fenv #{version}", shell_output("#{bin}/fenv --version").strip
    assert_match(/^3\.29\.3\tFlutter$/, shell_output("#{bin}/fenv install --list --source flutter"))
    assert_match(/^3\.41\.10-ohos-1\.0\.1\tCPF-Flutter$/, shell_output("#{bin}/fenv install --list --source ohos"))
  end
end
