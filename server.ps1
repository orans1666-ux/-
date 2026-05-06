$port = 8096
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Host "Sixth Stars Rebuild running at http://localhost:$port/"

while ($listener.IsListening) {
  $context = $listener.GetContext()
  $path = [System.Uri]::UnescapeDataString($context.Request.Url.AbsolutePath.TrimStart("/"))
  if ([string]::IsNullOrWhiteSpace($path)) { $path = "index.html" }
  $file = Join-Path $root $path
  $resolved = $null
  try { $resolved = (Resolve-Path -LiteralPath $file -ErrorAction Stop).Path } catch {}

  if ($resolved -and $resolved.StartsWith($root)) {
    $bytes = [System.IO.File]::ReadAllBytes($resolved)
    $extension = [System.IO.Path]::GetExtension($resolved).ToLowerInvariant()
    $contentType = switch ($extension) {
      ".html" { "text/html; charset=utf-8" }
      ".css" { "text/css; charset=utf-8" }
      ".js" { "application/javascript; charset=utf-8" }
      ".svg" { "image/svg+xml" }
      default { "application/octet-stream" }
    }
    $context.Response.ContentType = $contentType
    $context.Response.StatusCode = 200
    $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
  } else {
    $message = [System.Text.Encoding]::UTF8.GetBytes("Not found")
    $context.Response.StatusCode = 404
    $context.Response.OutputStream.Write($message, 0, $message.Length)
  }
  $context.Response.Close()
}
