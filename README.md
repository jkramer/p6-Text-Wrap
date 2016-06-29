# Text::Wrap

Wrap text.

```perl6
print wrap-text(
  $some-long-text,

  # Number of characters before wrapping line (default: 80).
  :width(80),

  # Regex for splitting paragraphs (default: 2 or more consecutive linebreaks).
  # Use Regex:U if you want to discard paragraphs in the source text.
  :paragraph(rx/\n ** 2..*/),

  # Wrap lines in the middle of words, if a single word is longer than the max.
  # line lenghts (see :width). Default is False, so lines may actually be
  # longer than the specified length.
  :hard-wrap(False),
);
```
