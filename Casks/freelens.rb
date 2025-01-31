cask "freelens" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.3.1"
  name "Freelens"
  desc "Kubernetes IDE"
  homepage "https://freelens.app/"

  def install
    odie "This formula has been moved to Homebrew Cask. Please migrate from this private tap using:\n\nbrew untap --force freelensapp/tap\nbrew install --cask freelens"
  end

  depends_on macos: ">= :high_sierra"

  app "Freelens.app"

  zap trash: [
    "~/Library/Application Support/Freelens",
    "~/Library/Logs/Freelens",
  ]
end
