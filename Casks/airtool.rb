cask 'airtool' do
  version '1.7.5'
  sha256 '2b06192e1afc4fe92f3b5c73f5416bd8cdcb64b8d9e357d2dbef463236edc010'

  url "https://www.adriangranados.com/downloads/Airtool_#{version}.pkg"
  appcast 'https://updates.devmate.com/com.adriangranados.Airtool.xml'
  name 'Airtool'
  homepage 'https://www.adriangranados.com/apps/airtool'

  pkg "airtool_#{version}.pkg"

  uninstall_preflight do
    set_ownership '/Library/Application Support/Airtool'
  end

  uninstall pkgutil:    [
                          'com.adriangranados.airtool.airtool-bpf.*',
                          'com.adriangranados.airtool.Airtool.pkg',
                        ],
            launchctl:  'com.adriangranados.airtool.airtool-bpf',
            login_item: 'Airtool',
            delete:     '/Library/Application Support/Airtool'

  zap trash: '~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.adriangranados.airtool.sfl*'
end
