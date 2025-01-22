# typed: false
# frozen_string_literal: true

cask "freelens" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.2"
  sha256 arm:   "de5dfda710dca0ed52c4e75446259049516919e93d97cba7762f7799d438c86b",
         intel: "4ff9ca732b1648082ee399569504606135f80aef901f38428f9a682aba30276b"

  url "https://github.com/freelensapp/freelens/releases/download/v#{version}/Freelens-#{version}-macos-#{arch}.dmg",
      verified: "github.com/freelensapp/freelens/"
  name "Freelens"
  desc "Free Open Source Kubernetes IDE"
  homepage "https://www.freelens.app"

  livecheck do
    url :url
    strategy :github_releases do |json, regex|
      json.map do |release|
        next if release["draft"] || release["prerelease"]

        match = release["tag_name"]&.match(regex)
        next if match.blank?

        match[1]
      end
    end
  end

  depends_on macos: ">= :high_sierra"

  app "Freelens.app"

  zap trash: [
    "~/Library/Application Support/Freelens",
    "~/Library/Logs/Freelens",
  ]
end
