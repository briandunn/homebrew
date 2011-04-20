require 'formula'

class Units <Formula
  url 'http://ftp.gnu.org/gnu/units/units-1.88.tar.gz'
  homepage 'http://www.gnu.org/software/units/'
  md5 '9b2ee6e7e0e9c62741944cf33fc8a656'

  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
