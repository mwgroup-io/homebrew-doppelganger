require 'open-uri'
require 'digest'

# Define the URLs
urls = {
  intel_tar: "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_amd64.tar.xz",
  intel_dmg: "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_amd64.dmg",
  arm_tar: "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_arm64.tar.xz",
  arm_dmg: "https://github.com/tweathers-sec/doppelganger_assistant/releases/download/latest/doppelganger_assistant_darwin_arm64.dmg"
}

# Function to download and compute SHA256
def compute_sha256(url)
  file_content = URI.open(url).read
  Digest::SHA256.hexdigest(file_content)
end

# Compute and print the SHA256 checksums
urls.each do |key, url|
  sha256 = compute_sha256(url)
  puts "#{key}: #{sha256}"
end