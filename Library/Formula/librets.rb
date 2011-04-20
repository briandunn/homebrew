require 'formula'

class Librets <Formula
  url 'http://www.crt.realtors.org/projects/rets/librets/files/librets-1.5.1.tar.gz'
  homepage 'http://www.crt.realtors.org/projects/rets/librets'
  md5 'f522b3d284b530a93a3c48c2883758be'

  depends_on 'curl'
  depends_on 'expat'
  depends_on 'boost'
  depends_on 'swig'

  def all_swig_languages
    %w[dotnet java perl php python ruby]
  end

  def enabled_swig_languages
    %w[ruby]
  end

  def swig_options
    ( all_swig_languages - enabled_swig_languages ).map do |lang|
      "--disable-#{lang}"
    end
  end

  def install
    system *(["./configure", "--disable-debug", "--disable-dependency-tracking", "--prefix=#{prefix}"] + swig_options)
    system "make install"
  end
end
