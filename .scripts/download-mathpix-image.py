"""
script to convert file like this:

    ![](https://cdn.mathpix.com/cropped/2024_01_15_6d97689bf6280eb33919g-25.jpg?height=772&width=1027&top_left_y=964&top_left_x=533)

into the file pointed by the url
"""
import os
import sys
from pathlib import Path
import urllib.request
from typing import Iterable, Iterator


def safe_read(file: Path) -> str | None:
    assert file.exists()
    if file.stat().st_size > 1_000_000:
        return None
    return file.read_text().strip()


def mathpix_url(text: str) -> str | None:
    if text.startswith("![](https://cdn.mathpix.com/") and text.endswith(")"):
        return text[4:-1]


def latex_convert(text: str) -> str | None:
    def interspersed(iterator: Iterator[str], start: str, end: str) -> Iterator[str]:
        first = next(iterator, None)
        second = next(iterator, None)
        while first is not None and second is not None:
            yield from [first, start, second, end]
            first = next(iterator, None)
            second = next(iterator, None)
        if first is not None:
            yield first

    split = text.split("$$")
    text = "".join(interspersed(iter(split), "\\[", "\\]"))
    split = text.split("$")
    text = "".join(interspersed(iter(split), "\\(", "\\)"))
    return text


if __name__ == "__main__":
    path = Path(os.environ["CLIPBOARD_FILE"])
    if not (text := safe_read(path)):
        sys.exit(1)
    if url := mathpix_url(text):
        os.remove(path)
        # save to same path
        urllib.request.urlretrieve(url, path)
        sys.exit(0)
    if converted := latex_convert(text):
        path.write_text(converted)
    sys.exit(1)
