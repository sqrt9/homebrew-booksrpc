class Booksrpc < Formula
  desc "Discord rich presence for Apple Books"
  homepage "https://github.com/sqrt9/BooksRPC"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sqrt9/BooksRPC/releases/download/v1.0.0/booksrpc-aarch64"
      sha256 "b13a95a8e70960edd9028d2755776c04ccf867b0d93de80519efebca58f26817"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sqrt9/BooksRPC/releases/download/v1.0.0/booksrpc-x86_64"
      sha256 "c983f2b224713c3d5b471b97e7b162b615cf1080b0386cb3feaed1c7a9a7ed52"
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
    environment_variables PATH: std_service_path_env
    working_dir var/"booksrpc"
    error_log_path var/"booksrpc/booksrpc.log"
  end

end
