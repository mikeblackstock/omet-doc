%% Generated by lilypond-book.py
%% Options: [exampleindent=10.16\mm,indent=0\mm,line-width=160\mm,quote,ragged-right]
\include "lilypond-book-preamble.ly"


% ****************************************************************
% Start cut-&-pastable-section
% ****************************************************************



\paper {
  indent = 0\mm
  line-width = 160\mm
  % offset the left padding, also add 1mm as lilypond creates cropped
  % images with a little space on the right
  line-width = #(- line-width (* mm  3.000000) (* mm 1))
  line-width = 160\mm - 2.0 * 10.16\mm
  % offset the left padding, also add 1mm as lilypond creates cropped
  % images with a little space on the right
  line-width = #(- line-width (* mm  3.000000) (* mm 1))
  ragged-right = ##t
}

\layout {
  
}





% ****************************************************************
% ly snippet:
% ****************************************************************
\sourcefileline 842
\new Staff \relative c'' {
  \key aes \major
  <<
    {  % Voice one
      \voiceOneStyle
      c2 aes4. bes8
    }
  \\  % Voice two
    { \voiceTwoStyle
      % Ignore these for now - they are explained in Ch 4
      \once \override NoteColumn.ignore-collision = ##t
      <ees, c>2
      \once \override NoteColumn.force-hshift = #0.5
      des2
    }
  \\  % No Voice three (we want stems down)
  \\  % Voice four
    { \voiceThreeStyle
      \override NoteColumn.force-hshift = #0
      aes'2 f4 fes
    }
  >> |
  <c ees aes c>1 |
}



% ****************************************************************
% end ly snippet
% ****************************************************************
