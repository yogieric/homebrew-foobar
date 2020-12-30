class Gothanks < Formula
  desc "Automatically stars Go's official repository"
  homepage "https://github.com/psampaz/gothanks"
  url "https://github.com/psampaz/gothanks/archive/v0.3.0.tar.gz"
  sha256 "ce5440334b3eac2e058724faa4c6e4478ca1d81ea087e55ccca33f1996752aad"
  license "MIT"

  bottle do
    root_url "https://github.com/yogieric/homebrew-foobar/releases/download/gothanks-0.3.0"
    cellar :any_skip_relocation
    sha256 "f9992c7538d1260c7e79a42007515e630dd7b0567b077455bd13950b4cb7a380" => :catalina
    sha256 "74658a03a117deb7f970850839aebe76fd1f85c7bd17f1a58b76bcf8ef28e3ab" => :x86_64_linux
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    ENV.delete "GITHUB_TOKEN"
    assert_match "no Github token found", shell_output(bin/"gothanks", 255)
  end
end
