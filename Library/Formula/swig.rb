require 'formula'

class Swig <Formula
  url 'http://prdownloads.sourceforge.net/swig/swig-2.0.1.tar.gz'
  homepage 'http://www.swig.org/'
  md5 'df4465a62ccc5f0120fee0890ea1a31f'

 depends_on 'pcre'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make" 
    system "make install"
  end
end
