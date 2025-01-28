# typed: false
# frozen_string_literal: true

cask "freelens" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.3"
  sha256 arm:   "a60ab1700dae51eccfd2dc007fba2431a1f34d83e312630ff889074467b8c9fe",
         intel: "56251b6496d2145b4b3fa5001c00866a66398bad65a149ce4dcc61fd6d6f073d"

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
