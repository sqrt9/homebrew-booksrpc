class Booksrpc < Formula
  desc "Discord rich presence for Apple Books"
  homepage "https://github.com/sqrt9/BooksRPC"
  version "0.1.1"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm? do
      url "https://github.com/sqrt9/BooksRPC/releases/download/v0.1.1/booksrpc-aarch64"
      sha256 "1cff486484366d9fbc3ed8d24801c05a80292a00b8d0453668aabbe9b3e2ee3c"
    end
    if Hardware::CPU.intel? do
      url "https://github.com/sqrt9/BooksRPC/releases/download/v0.1.1/booksrpc-x86_64"
      sha256 "d6bfed6b3725030f706baef8158c3d0fdfea8660b4a1ac61d077b9d84c0e1d09"
    end

  def install
    if Hardware::CPU.arm?
      bin.install "booksrpc-aarch64" => "booksrpc"
    else
      bin.install "booksrpc-x86_64" => "booksrpc"
    end
  end

  service do
    run opt_bin/"booksrpc"
    keep_alive true
  end

  test do
    system "#{bin}/booksrpc", "--version"
  end

end