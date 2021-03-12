from __future__ import annotations

import os
import sys
from dataclasses import dataclass
from pathlib import Path

base = Path(__file__).parent


is_win = sys.platform == 'win32'


@dataclass
class Config:
    filename: str
    source: str
    target: Path
    disable: bool = False

    def install(self):
        if self.disable:
            return
        target_path = self.target / self.filename
        source_path = base / self.source / self.filename
        if target_path.exists():
            if target_path.is_symlink():
                target_path.unlink()
            else:
                target_path.rename(self.target / (self.filename + '.old'))
        target_path.symlink_to(source_path)


config_list = [
    Config(
        'Microsoft.PowerShell_profile.ps1',
        'powershell',
        Path.home() / 'Documents' / 'PowerShell',
        not is_win
    ),
    Config(
        'settings.json',
        'windows terminal',
        Path(os.getenv('LocalAppData') + r'\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState'),
        not is_win
    ),
    Config(
        'starship.toml',
        'starship',
        Path.home() / '.config'
    ),
    # Config(
    #     'settings.json',
    #     'vscode',
    #     Path(os.getenv('APPDATA') + r'\Code\User'),
    #     not is_win   # dont know the path in linux or mac
    # )
]

if __name__ == '__main__':
    for config in config_list:
        config.install()
