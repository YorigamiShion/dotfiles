Import-Module posh-git
Invoke-Expression (&starship init powershell)
Import-Module PSReadLine

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+d" -Function Complete
Set-PSReadLineKeyHandler -Key "Ctrl+z" -Function Undo
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -HistoryNoDuplicates

Set-PSReadLineOption -Colors @{
  ContinuationPrompt = [ConsoleColor]::White
  Emphasis           = [ConsoleColor]::Cyan
  Error              = [ConsoleColor]::Red
  Selection          = [ConsoleColor]::White
  Default            = [ConsoleColor]::White
  Comment            = [ConsoleColor]::DarkGreen
  Keyword            = [ConsoleColor]::Green
  String             = [ConsoleColor]::Yellow
  Operator           = [ConsoleColor]::DarkGray
  Variable           = [ConsoleColor]::Red
  Command            = [ConsoleColor]::Green
  Parameter          = [ConsoleColor]::Cyan
  Type               = [ConsoleColor]::White
  Number             = [ConsoleColor]::DarkYellow
  Member             = [ConsoleColor]::White
  InlinePrediction = [ConsoleColor]::DarkGray
}


$env:LC_ALL='C.UTF-8'
$env:PYTHONIOENCODING="utf-8"
# [Console]::OutputEncoding = [System.Text.Encoding]::UTF8
iex "$(thefuck --alias)"

Invoke-Expression (& { (lua $home/.z.lua/z.lua --init powershell) -join "`n" })
