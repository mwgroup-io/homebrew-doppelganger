class DoppelgangerAssistantCli < Formula
    desc "Doppelganger Assistant CLI"
    homepage "https://github.com/tweathers-sec/doppelganger_assistant"
    if Hardware::CPU.intel?
      url "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_amd64.tar.xz"
      sha256 "fb04a153a351730ce8e658083f3405b908f48679bea4ec773f93c8351b74f08e"
    elsif Hardware::CPU.arm?
      url "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_arm64.tar.xz"
      sha256 "9ba387358eed3850650fabc79849489744b76b2aba1a4dda2b7371f512d185c4"
    end
  
    license "MIT"
    depends_on "rfidresearchgroup/proxmark3/proxmark3"
  
    def install
      # Extract the archive to the buildpath
      system "tar", "-xvf", cached_download, "-C", buildpath
  
      if Hardware::CPU.intel?
        bin.install "fyne-cross/bin/darwin-amd64/doppelganger_assistant"
      elsif Hardware::CPU.arm?
        bin.install "fyne-cross/bin/darwin-arm64/doppelganger_assistant"
      end
    end
  
    test do
      system "#{bin}/doppelganger_assistant", "--version"
    end
  end