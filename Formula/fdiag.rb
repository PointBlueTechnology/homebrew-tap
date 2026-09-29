class Fdiag < Formula
  desc "Flow and sequence diagram CLI and MCP server (.flow, .msd, Mermaid)"
  homepage "https://github.com/PointBlueTechnology/homebrew-tap"
  url "https://github.com/PointBlueTechnology/homebrew-tap/releases/download/fdiag-v0.2.0/fdiag-0.2.0-macos.tar.gz"
  sha256 "592e920edea6c56fc8dfa735f8a0c814a902396a3a37458703e1e7ef938228ad"

  depends_on macos: :tahoe

  def install
    bin.install "fdiag"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/fdiag --version")
    (testpath/"t.flow").write "flowdiagram 1\nsequence s\n    a -> b: hi @hello\n"
    assert_match ": ok", shell_output("#{bin}/fdiag validate #{testpath}/t.flow")
    assert_match "@hello", shell_output("#{bin}/fdiag outline #{testpath}/t.flow")
  end
end
