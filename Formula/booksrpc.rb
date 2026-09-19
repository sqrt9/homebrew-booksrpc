class Booksrpc < Formula
  desc "Discord rich presence for Apple Books"
  homepage "https://github.com/sqrt9/BooksRPC"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sqrt9/BooksRPC/releases/download/v0.3.0/booksrpc-aarch64"
      sha256 "e415cc8284e54ee13c469e2d8493aa1e65c174569d903922a4d9d4475fefc037"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sqrt9/BooksRPC/releases/download/v0.3.0/booksrpc-x86_64"
      sha256 "6b904b7b17b928a8a4f51b125e70b6ee121e0f36790245a625af12fa9776c038"
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

  post_install do
    (var/"booksrpc").mkpath
  end

end
