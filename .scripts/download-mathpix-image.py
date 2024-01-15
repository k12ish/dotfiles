"""
script to convert file like this:

    ![](https://cdn.mathpix.com/cropped/2024_01_15_6d97689bf6280eb33919g-25.jpg?height=772&width=1027&top_left_y=964&top_left_x=533)

into the file pointed by the url
"""
import os
import sys
from pathlib import Path
import urllib.request


def mathpix_url(file: Path) -> str | None:
    assert file.exists()
    if file.stat().st_size > 100_000:
        return None
    text = file.read_text().strip()
    if text.startswith("![](https://cdn.mathpix.com/") and text.endswith(")"):
        return text[4:-1]


if __name__ == "__main__":
    file = Path(os.environ["CLIPBOARD_FILE"])
    if url := mathpix_url(file):
        os.remove(file)
        # save to same path
        urllib.request.urlretrieve(url, file)
        sys.exit(0)
    sys.exit(1)
