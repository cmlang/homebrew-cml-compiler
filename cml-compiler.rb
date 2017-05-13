require "formula"

class CmlCompiler < Formula
  VERSION = "1.0"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-compiler-#{VERSION}.zip"
  sha256 "3df6bd07cc90f6ed43647e71e29a1abe7a2eba82cd80e4ff98c139ceeb1b32c1"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}/libexec"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
