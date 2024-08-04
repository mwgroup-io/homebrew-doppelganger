cask "doppelganger_assistant" do
    version "latest"
    sha256 :no_check
  
    if Hardware::CPU.intel?
      url "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_amd64.dmg"
    elsif Hardware::CPU.arm?
      url "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_arm64.dmg"
    end
  
    name "Doppelganger Assistant"
    desc "Doppelganger Assistant"
    homepage "https://github.com/tweathers-sec/doppelganger_assistant"
  
    app "doppelganger_assistant.app"
  
    zap trash: [
      "~/Library/Application Support/DoppelgangerAssistant",
      "~/Library/Preferences/com.doppelganger_assistant.plist",
      "~/Library/Saved Application State/com.doppelganger_assistant.savedState",
    ]
  end