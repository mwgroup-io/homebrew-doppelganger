class DoppelgangerAssistant < Formula
  desc "Doppelganger Assistant"
  homepage "https://github.com/tweathers-sec/doppelganger_assistant"
  if Hardware::CPU.intel?
    url "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_amd64.tar.xz"
    sha256 "fb04a153a351730ce8e658083f3405b908f48679bea4ec773f93c8351b74f08e"
    resource "dmg_installer" do
      url "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_amd64.dmg"
      sha256 "4359b9232c3663c0e12bc8aef826966a658cd1ffd99e827cd39180698b009ea1"
    end
  elsif Hardware::CPU.arm?
    url "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_arm64.tar.xz"
    sha256 "9ba387358eed3850650fabc79849489744b76b2aba1a4dda2b7371f512d185c4"
    resource "dmg_installer" do
      url "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_arm64.dmg"
      sha256 "abc83bc62e13930a383850010c68053807e6ed49d67aed11baf5298878a540a1"
    end
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

    # Install the dmg
    resource("dmg_installer").stage do
      # Debug: List the contents of the current directory
      system "pwd"
      system "ls", "-la"

      dmg_path = Dir["*.dmg"].first
      # Debug: Print the dmg_path
      puts "DMG path: #{dmg_path}"
      odie "DMG file not found" if dmg_path.nil?
      system "hdiutil", "attach", dmg_path
      system "cp", "-r", "/Volumes/DoppelgangerAssistant/DoppelgangerAssistant.app", "#{prefix}/DoppelgangerAssistant.app"
      system "hdiutil", "detach", "/Volumes/DoppelgangerAssistant"
    end
  end

  test do
    system "#{bin}/doppelganger_assistant", "--version"
  end
end