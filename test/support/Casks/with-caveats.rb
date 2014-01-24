class WithCaveats < TestCask
  url TestHelper.local_binary('caffeine.zip')
  homepage 'http://example.com/local-caffeine'
  version '1.2.3'
  sha1 'd2fbdad1619934313026fc831e6c6e3dd97ac030'
  link 'Caffeine.app'
  # simple string is evaluated at compile-time
  caveats <<-EOS.undent
    Here are some things you might want to know.
    EOS
  # do block is evaluated at install-time
  caveats do
    "Cask title: #{title}"
  end
  # a do block may print and use a DSL
  caveats do
    puts 'Custom text via puts followed by DSL-generated text:'
    manual_installer('Installer.app')
  end
  caveats do
    # since both valid arches are specified, no output should be
    # generated here during the test
    arch_only('intel-32', 'intel-64')
  end
end
