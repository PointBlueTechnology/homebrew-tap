class Fdiag < Formula
  desc "Flow and sequence diagram CLI and MCP server (.flow, .msd, Mermaid)"
  homepage "https://github.com/PointBlueTechnology/homebrew-tap"
  url "https://github.com/PointBlueTechnology/homebrew-tap/releases/download/fdiag-v0.3.0/fdiag-0.3.0-macos.tar.gz"
  sha256 "73021a405ecf540577462603b40814a9bfce35eb5dfe3f7b59a9d7836ca8b64e"

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
