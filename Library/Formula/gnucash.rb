require 'formula'

class Gnucash <Formula
  url 'http://downloads.sourceforge.net/sourceforge/gnucash/gnucash-2.2.9.tar.bz2'
  homepage 'http://www.gnucash.org/'
  md5 '1d814de8673b4760045bf51b72924d04'
=begin
aqbanking
gconf2
glib2
gtk+2
guile
libart2
libglade2
libgnomeprint2.2
libgnomeui2
[lib]goffice
libgsf1
[lib]gtkhtml3
libofx
libxml2
pango
swig
=end
  depends_on 'gettext'
  def install
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    # system "cmake . #{std_cmake_parameters}"
    system "make install"
  end
end
