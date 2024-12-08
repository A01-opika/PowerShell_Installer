class PowershellInstaller < Formula
  desc "PowerShell installation script"
  homepage "https://github.com/yourusername/homebrew-powershell-installer"
  url "https://raw.githubusercontent.com/A01-opika/Powershell_Installer/main/Powershell_Installer_bash.sh"
  version "1.0.0"
  sha256 "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" # 替换为脚本的SHA256

  def install
    bin.install "powershell_installer.sh" => "powershell_installer"
  end

  test do
    system "#{bin}/powershell_installer", "--version"
  end
end
