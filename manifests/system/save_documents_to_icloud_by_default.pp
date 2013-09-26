class osx::system::save_documents_to_icloud_by_default($ensure = 'present') {

  validate_re($ensure, '^(present|absent)$', "osx::system::save_documents_to_icloud_by_default([ensure] must be present or absent, is ${ensure}")

  $enabled = $ensure ? {
    present => true,
    default => false
  }

  boxen::osx_defaults { 'Toggle Whether to Save New Documents to iCloud by Default':
    user   => $::boxen_user,
    domain => 'NSGlobalDomain',
    key    => 'NSDocumentSaveNewDocumentsToCloud',
    value  => $enabled,
  }
}
