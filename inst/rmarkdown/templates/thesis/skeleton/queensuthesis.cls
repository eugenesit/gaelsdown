%******************************************************************************
% queensuthesis.cls by Eugene Sit June 2021
%******************************************************************************
%
% Notes:
% To make this template compatible with R markdown, sections of this
% template have been lifted from the reedthesis.cls version modified
% by Chester Ismay (CII); original reedthesis.cls created by Sam Noble (SN).
%
%******************************************************************************
% A modified version of quthesis.sty / quthesisDJ.sty
% Previous template authors:
% Dean Jin, modifications 24-Aug-2003
% Queen's University thesis style as changed by Bob Burke from...
% Stanford University PhD thesis style by Joseph Pallas, September 1988
%******************************************************************************

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{queensuthesis}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

\RequirePackage{fancyhdr}
% Added by CII to produce nice looking code in BeginVerbatimEnvironment
\RequirePackage{fancyvrb}

\usepackage{color}
\usepackage{framed}
\definecolor{shadecolor}{RGB}{248,248,248}

% Stolen from book.cls PBC 5/12/05
% Using this to actually show "Chapter 1" in TOC instead of "1"
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                         {\@chapapp\space\thechapter:\space#1}%
                       \else
                         \addcontentsline{toc}{chapter}{#1}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#1}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}
					
% Above lines from reedthesis.cls; below from quthesis.sty

% We need 1" margins except on the binding edge, where it is 1 1/2"
% Theses are single-sided, so we don't care about \evensidemargin

\oddsidemargin 0.5in \evensidemargin 0in
\marginparwidth 40pt \marginparsep 10pt
\topmargin 0pt \headsep .5in
\textheight 8.1in \textwidth 6in

% Fixes the less than 1 inch at the bottom of the page problem
\footskip 20pt

% Disallow page breaks at hyphens (this will give some underfull vbox's,
% so an alternative is to use \brokenpenalty=100 and manually search
% for and fix such page breaks)
\brokenpenalty=10000

% removes the unnecessary white space around figs
\renewcommand{\topfraction}{0.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.75}

%******************************************************************************
% TITLE
%******************************************************************************

% front matter defining macros (quthesis.sty with ESS modifications)
\def\title#1{\gdef\@title{#1}}
\def\@title{\@latex@warning@no@line{No \noexpand\title given}}
\def\author#1{\gdef\@author{#1}}
\def\@author{\@latex@warning@no@line{No \noexpand\author given}}
\def\degree#1{\gdef \@degree{#1}}
\def\@degree{\@latex@warning@no@line{No \noexpand\degree given}}
\def\institution#1{\gdef \@institution{#1}}
\def\@institution{\@latex@warning@no@line{No \noexpand\institution given}}
\def\dept#1{\gdef \@dept{#1}}
\def\@dept{\@latex@warning@no@line{No \noexpand\dept given}}
\def\submitdate#1{\gdef \@submitdate{#1}}
\def\@submitdate{\@latex@warning@no@line{No \noexpand\submitdate given}}
\def\copyrightyear#1{\gdef \@copyrightyear{#1}}
\def\@copyrightyear{\@latex@warning@no@line{No \noexpand\copyrightyear given}}

\renewcommand{\maketitle}{%
    \thispagestyle{empty}%
    \begin{center}
        {\Large\sc\@title}\\
        \mbox{}\\
        \mbox{}\\
        by\\
        \mbox{}\\
        \mbox{}\\
        {\large\sc\@author}\\
    \end{center}
    \mbox{}
    \begin{center}
        A thesis submitted to the\\
        \@dept\\
        in conformity with the requirements for\\
        the degree of \@degree\\
    \end{center}
    \mbox{}
    \begin{center}
        Queen's University\\
        Kingston, Ontario, Canada\\
        \@submitdate\\
    \end{center}
    \mbox{}
    \begin{center}
        Copyright \copyright\ \@author, \@copyrightyear
    \end{center}
	\clearpage
	}

%******************************************************************************
% SECTIONS
%******************************************************************************

% Defines three sections in template.tex, adopted from CII

\newcommand{\prefacesection}[2]{
    \chapter*{#1}
    #2
    \addcontentsline{toc}{chapter}{#1}
    \clearpage
    }

% This gives us rules below the headers (SN)

\AtBeginDocument{%
  \fancyhf{}
  \setlength{\headheight}{15pt}
  \renewcommand{\headrulewidth}{0.5pt}
  \renewcommand{\footrulewidth}{0pt}
%   Page numbering format (Arabic or Roman) based on \pagenumbering.
% Replace [R] with [LE,RO] if two-sided for left on even, right on odd.
  \fancyhead[R]{\thepage}
  \pagestyle{fancy}

% If using an alterantive citation package this may conflict; can be commented out
% Redefines the macro for bibliography to include a table of contents line
  \let\oldthebibliography=\thebibliography
  \let\endoldthebibliography=\endthebibliography
  \renewenvironment{thebibliography}[1]{
    \oldthebibliography{#1}
    \addcontentsline{toc}{chapter}{\bibname}
  }{\endoldthebibliography}
% end of things to comment out if using LaTeX citation package

% Redefines index to include a contents line
% Commented out by ESS as indices are not part of Queen's theses
%  \let\oldtheindex=\theindex
%  \let\endoldtheindex=\endtheindex
%  \renewenvironment{theindex}{
%    \oldtheindex
%    \addcontentsline{toc}{chapter}{\indexname}
%  }{\endoldtheindex}
}
