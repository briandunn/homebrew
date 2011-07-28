require 'formula'

<<<<<<< HEAD
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
=======
class Librets < Formula
  url 'http://www.crt.realtors.org/projects/rets/librets/files/librets-1.5.2.tar.gz'
  homepage 'http://code.crt.realtors.org/projects/librets'
  md5 '74bcea0eb11f3c66cde5dc3ecea05224'

  depends_on 'boost'

  def install
    # Allow compilation against boost 1.46.0
    inreplace "project/librets/src/RetsExceptionContext.cpp",
      "#include <boost/filesystem/path.hpp>",
      "#define BOOST_FILESYSTEM_VERSION 2\n#include <boost/filesystem/path.hpp>"

    # Snow Leopard's SWIG is detected as too old,
    # so disable language bindings.
    system "./configure", "--disable-debug",
                          "--enable-shared_dependencies",
                          "--prefix=#{prefix}",
                          "--disable-dotnet",
                          "--disable-java",
                          "--disable-perl",
                          "--disable-php",
                          "--disable-python"
>>>>>>> 188ed78939a51ea4a7c9d855b16002b267bee7c8
    system "make install"
  end
end
