class Booksrpc < Formula
  desc "Discord rich presence for Apple Books"
  homepage "https://github.com/sqrt9/BooksRPC"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sqrt9/BooksRPC/releases/download/v0.2.0/booksrpc-aarch64"
      sha256 "c58418c1519b404dfc8e2dfefbebdeee214c661ec63b57c5f001c113add804c3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sqrt9/BooksRPC/releases/download/v0.2.0/booksrpc-x86_64"
      sha256 "5c8438499486db25fbb6aa0599590b3fdf842c490dfd6ff3b6a515efd65b223e"
    end
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
    process_type "Background"
  end

end
