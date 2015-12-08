\version "2.18.2"
\language "english"
exerciseNumber = "20."
\header {
    composer	        =       "Czerny, C."
    mutopiacomposer     =       "CzernyC"

    title	            =	"160 Eight-Measure Exercises"
    mutopiatitle        = 	"160 Eight-Measure Exercises, No. 20"

    opus	            =	"Op. 821"
    mutopiaopus         = 	"Op. 821, No. 20"
    
    source        	    =	"IMLSP; Leipzig: Edition Peters, n.d.1888. Plate 6990-6993."
    style             	=	"Technique"
    license          	=	"Public Domain"
    maintainer	        =	"Manuel Castejon Limas"
    maintainerWeb       =	"https://github.com/mcasl/Czerny"
    mutopiainstrument   =       "Piano"

 footer = "Mutopia-2015/11/15-2069"
 copyright =  \markup { \override #'(baseline-skip . 0 ) \right-column { \sans \bold \with-url #"http://www.MutopiaProject.org" { \abs-fontsize #9  "Mutopia " \concat { \abs-fontsize #12 \with-color #white \char ##x01C0 \abs-fontsize #9 "Project " } } } \override #'(baseline-skip . 0 ) \center-column { \abs-fontsize #11.9 \with-color #grey \bold { \char ##x01C0 \char ##x01C0 } } \override #'(baseline-skip . 0 ) \column { \abs-fontsize #8 \sans \concat { " Typeset using " \with-url #"http://www.lilypond.org" "LilyPond" " by " \maintainer " " \char ##x2014 " " \footer } \concat { \concat { \abs-fontsize #8 \sans{ " Placed in the " \with-url #"http://creativecommons.org/licenses/publicdomain" "public domain" " by the typesetter " \char ##x2014 " free to distribute, modify, and perform" } } \abs-fontsize #13 \with-color #white \char ##x01C0 } } }
 tagline = ##f
}

%--------Definitions
global = {
  \key d \major
  \time 4/4
}


mbreak = {   }


upperStaff =   {
  \clef "treble"
r8     a'4(   a'' g'' fs''8 ~        | % 1

fs''8  e''4   d'' cs''^2 d''8     | % 2

e''8   a'4    g'' fs''8^3 e'' d'' ~  | % 3
 
d''8   cs''^2 e'' cs'' a') r r4  | % 4

d''8(  d'''4  cs''' b'' a''8 ~     | % 5

a''8   g''4   fs''^4 e'' ds''8 ~ | % 6
ds''   e''8^1   g''^3 b'') r a'( fs''^4 e'' | % 7

d''8)  r r4 r2  | % 8
\bar "|."
}


lowerStaff =  {
\clef "bass"
<d'_2 fs'_1>4( <cs'_3 e'_1> <b_4 d'_2> <a_5 cs'_3>4  | % 1

<g_2 b_1> <fs_3 a_1> <e_4 g_2> <d_5 fs_3>    | % 2

<< { r4 a2 gs4 a}
   \\
   { <cs_4 e_2>2)( d4_3 b,_4 a,)}
>>

r r8
\clef "treble" cs'8_5( e'_4 g'!_2              | % 4
\slurDown
<fs'^3 a'^1>4) ( <e'^4 g'^2> <d'^5 fs'^3>4 <cs'^2 e'^1>  | % 5

\clef "bass" <b_3 d'_1> <a_4 cs'_2> <g_5 b_3>
  <fs_4 a_2 c'_1>4                          | % 6
\slurNeutral  
<g_3 b_1>2) \set fingeringOrientations = #'(left) <a cs'!-3 g'>(                     | % 7
  
<d'_2 fs'_1>8 ) d'_1( a fs d) r r4              | % 8
\bar "|."
}
plegato =\markup{\dynamic p \italic legato }
 
dynamics = { 
  <>-\plegato s1 | %1
  s1             | %2
  s1             | %3
  s1             | %4
  <>-\f s8 s4 
  s4 s4 \dim s8  | % 5
  s1              | %6
  s1\p       | %7
  s1       | %8 
}

pedal = {
}

\score {
  \new PianoStaff = "PianoStaff_pf" <<
    \set PianoStaff.instrumentName = \markup \huge \bold \exerciseNumber 
    \new Staff    = "Staff_pfUpper" << \global \upperStaff >>
    \new Dynamics = "Dynamics_pf" \dynamics
    \new Staff    = "Staff_pfLower" << \global \lowerStaff >>
    \new Dynamics = "pedal" \pedal
  >>
  \layout { }
}

\score {
  \new PianoStaff = "PianoStaff_pf" <<
    \set PianoStaff.midiInstrument = "acoustic grand"
    \new Staff = "Staff_pfUpper" << \global \upperStaff \dynamics \pedal >>
    \new Staff = "Staff_pfLower" << \global \lowerStaff \dynamics \pedal >>
  >>
  \midi { \tempo 4 = 110 }
}



