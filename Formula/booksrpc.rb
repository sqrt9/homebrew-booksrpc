class Booksrpc < Formula
  desc "Discord rich presence for Apple Books"
  homepage "https://github.com/sqrt9/BooksRPC"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sqrt9/BooksRPC/releases/download/v0.1.2/booksrpc-aarch64"
      sha256 "442080fe3fa04dd5675f314274434f38ed213734869c9fed79747d2b923a0561"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sqrt9/BooksRPC/releases/download/v0.1.2/booksrpc-x86_64"
      sha256 "b731b3d1e2a4d9a9d80182fa48468d463ecd72fe9f311e4345d09d76ba0e29cc"
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
  end

  test do
    system "#{bin}/booksrpc", "--version"
  end
end
