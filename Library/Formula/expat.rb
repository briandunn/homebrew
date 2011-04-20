require 'formula'

class Expat <Formula
  url 'http://downloads.sourceforge.net/project/expat/expat/2.0.1/expat-2.0.1.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fexpat%2Ffiles%2F&ts=1296248798&use_mirror=softlayer'
  version '2.0.1'
  homepage 'http://expat.sourceforge.net/'
  md5 'ee8b492592568805593f81f8cdf2a04c'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}",
                          "--mandir=#{man}"
    system "make install"
  end

  def caveats
    "Note that OS X has Expat 1.5 installed in /usr already."
  end
end
