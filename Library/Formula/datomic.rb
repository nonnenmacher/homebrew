require 'formula'

class Datomic < Formula
  homepage 'http://www.datomic.com/'
  url 'https://my.datomic.com/downloads/free/0.8.4260'
  sha1 'a334173e40415f7489530c94bd4c1c7a5dbf0a5f'
  version '0.8.4260'

  def write_libexec_alias *script_names
    script_names.each do |script_name|
      alias_name = script_name == 'datomic' ? 'datomic' : "datomic-#{script_name}"
      (bin + alias_name).write <<-EOS.undent
        #!/bin/bash
        cd #{libexec} && exec "bin/#{script_name}" "$@"
      EOS
    end
  end

  def install
    libexec.install Dir['*']
    write_libexec_alias 'datomic', 'transactor', 'repl', 'repl-jline', 'rest', 'shell'
  end

  def caveats
    <<-EOS.undent
      You may need to set JAVA_HOME:
        export JAVA_HOME="$(/usr/libexec/java_home)"
      All commands have been installed with the prefix 'datomic-'.

      We agreed to the Datomic Free Edition License for you:
        http://www.datomic.com/datomic-free-edition-license.html
      If this is unacceptable you should uninstall.
    EOS
  end
end
