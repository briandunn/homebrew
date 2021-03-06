require 'formula'

class Freetds < Formula
  url 'http://ibiblio.org/pub/Linux/ALPHA/freetds/stable/freetds-0.82.tar.gz'
  homepage 'http://www.freetds.org/'
  md5 '3df6b2e83fd420e90f1becbd1162990a'

  def install
    args = ["--prefix=#{prefix}", "--with-tdsver=8.0", "--enable-msdblib", "--mandir=#{man}"]
    args << (Formula.factory('unixodbc').installed? ? "--with-unixodbc=/usr/local" : "--with-iodbc=/usr")
    system "./configure", *args
    system 'make'
    system 'make install'
  end
end
