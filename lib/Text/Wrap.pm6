
module Text::Wrap {
  sub wrap-text(
    Str $text,
    Int :$width where * > 0 = 80,
    Regex :$paragraph = rx/\n ** 2..*/,
    Bool :$hard-wrap = False,
  ) is export {
    my $result = '';

    for ($paragraph.defined ?? $text.split($paragraph) !! [$text]) -> $p {
      my $line = '';

      for $p.words -> $word {
        if $line.chars + 1 + $word.chars <= $width || (!$line.chars && $word.chars <= $width) {
            $line ~= $line ?? ' ' ~ $word !! $word;
        }
        else {
          $result = $result ~ $line ~ "\n";

          if $hard-wrap {
            my $copy = $word;

            while $copy.chars > $width {
              $result = $result ~ $copy.substr(0, $width) ~ "\n";
              $copy.=substr($width);
            }

            $line = $copy;
          }
          else {
            $line = $word;
          }
        }
      }

      $result ~= $line ?? $line ~ "\n\n" !! "\n";
    }

    return $result.trim;
  }
}
