# ebook-convert-action

![Ebook convert test](https://github.com/jensvog/ebook-convert-action/workflows/Ebook%20convert%20test/badge.svg)

GitHub Action for converting ebooks in several formats. The action is based on [Calibre's](https://calibre-ebook.com) converting function `ebook-convert`. For more information about the supported formats, available options and practical hints, please refer to the [documentation](https://manual.calibre-ebook.com/generated/en/ebook-convert.html). The GitHub action sets up a Docker image with Calibre installed in which the document gets converted.

# Supported formats

The action supports conversions between many file types i.e.:

DOCX, EPUB, HTML, PDF, RTF, TXT...

For the full list see the [documentation](https://manual.calibre-ebook.com/generated/en/ebook-convert.html).

# Usage

In order to use the action, it must be integrated to the workflow:

```yaml
- uses: jensvog/ebook-convert-action@v1
  with:
    in: <in-file>
    out: <out-file>
    args: <arguments>
```

| Parameter | Information |
| --------  | ----------- |
| in | File to be converted, i.e. `your-pdf.pdf` or `book/your-pdf.pdf`. Relative to your repository. |
| out | Output file, i.e. `your-epub.epub`. It can also contain path information `book/your-epub.epub`. If the directory does not exist, it will be created. |
| args | (optional) Additional arguments according to [documentation](https://manual.calibre-ebook.com/generated/en/ebook-convert.html) |

The output file format is guessed based on the output file extension.

# Example

This example take a PDF document from a repository and converts it to an EPUB file. Afterwards this file is stored as an artifact.

```yaml
name: EBook conversion
on: [push]
jobs:
  convert:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v2
      - name: Convert ebook
        uses: jensvog/ebook-convert-action@v1
        with:
          in: book.pdf
          out: book.epub
      - name: Upload
        uses: actions/upload-artifact@master
        with:
          name: Book
          path: book.epub
```

# License

MIT: See `LICENSE` for detailed license information.
