class Booksrpc < Formula
  desc "Discord rich presence for Apple Books"
  homepage "https://github.com/sqrt9/BooksRPC"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/sqrt9/BooksRPC/releases/download/v1.0.1/booksrpc-aarch64"
      sha256 "4f793e2ac9b6bb3b12aed53b027c7a3d06553fb7588f83f3c77dcdff66b48971"
    end
    if Hardware::CPU.intel?
      url "https://github.com/sqrt9/BooksRPC/releases/download/v1.0.1/booksrpc-x86_64"
      sha256 "e0b3ec11bd1232a7f25244db50f0efa274841f25c3070e9c896651f6f5dd16c0"
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
