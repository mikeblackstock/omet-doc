%% Generated by lilypond-book.py
%% Options: [exampleindent=10.16\mm,indent=0\mm,line-width=160\mm]
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
}

\layout {
  
}





% ****************************************************************
% ly snippet:
% ****************************************************************
\sourcefilename "printing-music-with-different-time-signatures.ly"
\sourcefileline 0
%% DO NOT EDIT this file manually; it is automatically
%% generated from LSR http://lsr.dsi.unimi.it
%% Make any changes in LSR itself, or in Documentation/snippets/new/ ,
%% and then run scripts/auxiliar/makelsr.py
%%
%% This file is in the public domain.
\version "2.17.11"

\header {
%% Translation of GIT committish: 56145dfed8f19bb34459d5b40cab388776d2ec49
  texidoces = "
En el siguiente fragmento de código, dos partes distintas tienen un
compás completamente diferente y sin embargo se mantienen
sincronizadas.  Las barras de compás ya no se pueden imprimir en el
nivel de @code{Score}; para permitir barras de compás independientes
en cada parte se trasladan los grabadores
@code{Default_barline_engraver} y @code{Timing_translator} desde el
contexto de partitura @code{Score} hasta el contexto de pentagrama
@code{Staff}.

Si son necesarios números de compás, el grabador de números de compás
@code{Bar_number_engraver} también debe trasladarse, ya que descansa
en propiedades fijadas por el @code{Timing_translator}; se puede usar
un bloque @code{\\with} para añadir números de compás al pentagrama
apropiado.

"
  doctitlees = "Imprimir música que tenga compases distintos en cada pentagrama"

%% Translation of GIT committish: 64d521c30b929ac9be37823df577b8f02c8cf0ee
  texidocfr = "
Bien qu'ayant des métriques bien différentes, les deux parties
ci-dessous présentées restent synchrones.  Les barres de mesure ne
peuvent plus être gérées au niveau du contexte @code{Score} ; les
@code{Default_barline_engraver} et @code{Timing_translator} doivent être
déplacés du contexte @code{Score} au contexte @code{Staff} afin de
permettre des barres de mesure individualisées.

Le @code{Bar_number_engraver} devra lui aussi être déplacé, puisqu'il
dépend de propriétés attachées au @code{Timing_translator}, afin de
numéroter les mesures.  L'utilisation d'un bloc @code{\\with} dans la
portée concernée permettra un affichage des numéros de mesure.

"
  doctitlefr = "Impression de musique aux métriques différentes"

  lsrtags = "contemporary-notation, percussion, real-music, really-cool, rhythms"

  texidoc = "
In the following snippet, two parts have a completely different time
signature, yet remain synchronized. The bar lines can no longer be
printed at the @code{Score} level; to allow independent bar lines in
each part, the @code{Default_barline_engraver} and
@code{Timing_translator} are moved from the @code{Score} context to the
@code{Staff} context.

If bar numbers are required, the @code{Bar_number_engraver} should also
be moved, since it relies on properties set by the
@code{Timing_translator}; a @code{\\with} block can be used to add bar
numbers to the relevant staff.



"
  doctitle = "Printing music with different time signatures"
} % begin verbatim

\paper {
  indent = #0
  ragged-right = ##t
}

global = { \time 3/4 { s2.*3 } \bar "" \break { s2.*3 } }

\layout {
  \context {
    \Score
    \remove "Timing_translator"
    \remove "Default_bar_line_engraver"
    \remove "Bar_number_engraver"
    \override SpacingSpanner.uniform-stretching = ##t
    \override SpacingSpanner.strict-note-spacing = ##t
    proportionalNotationDuration = #(ly:make-moment 1/64)
  }
  \context {
    \Staff
    \consists "Timing_translator"
    \consists "Default_bar_line_engraver"
  }
  \context {
    \Voice
    \remove "Forbid_line_break_engraver"
    tupletFullLength = ##t
  }
}

Bassklarinette = \new Staff \with {
  \consists "Bar_number_engraver"
  barNumberVisibility = #(every-nth-bar-number-visible 2)
  \override BarNumber.break-visibility = #end-of-line-invisible
} <<
  \global {
    \bar "|"
    \clef treble
    \time 3/8
    d''4.

    \bar "|"
    \time 3/4
    r8 des''2( c''8)

    \bar "|"
    \time 7/8
    r4. ees''2 ~

    \bar "|"
    \time 2/4
    \tupletUp
    \tuplet 3/2 { ees''4 r4 d''4 ~ }

    \bar "|"
    \time 3/8
    \tupletUp
    \tuplet 4/3 { d''4 r4 }

    \bar "|"
    \time 2/4
    e''2

    \bar "|"
    \time 3/8
    es''4.

    \bar "|"
    \time 3/4
    r8 d''2 r8
    \bar "|"
  }
>>

Perkussion = \new StaffGroup <<
  \new Staff <<
    \global {
      \bar "|"
      \clef percussion
      \time 3/4
      r4 c'2 ~

      \bar "|"
      c'2.

      \bar "|"
      R2.

      \bar "|"
      r2 g'4 ~

      \bar "|"
      g'2. ~

      \bar "|"
      g'2.
    }
  >>
  \new Staff <<
    \global {
      \bar "|"
      \clef percussion
      \time 3/4
      R2.

      \bar "|"
      g'2. ~

      \bar "|"
      g'2.

      \bar "|"
      r4 g'2 ~

      \bar "|"
      g'2 r4

      \bar "|"
      g'2.
    }
  >>
>>

\score {
  <<
    \Bassklarinette
    \Perkussion
  >>
}



% ****************************************************************
% end ly snippet
% ****************************************************************
