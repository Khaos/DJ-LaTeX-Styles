%%
%%    File : DJcsmemo.cls    (LaTeX2e class file)
%%  Author : Dazhi Jiang, Original Version Author: Martin Reddy (mxr@dcs.ed.ac.uk) 
%% Version : 1.0
%%
%% Updates : 1.0 [05/6/2008] - initial release.
%%
%% Updates : 1.1 [19/3/2009] - Use \href{}{} to generate the email address.
%%           				 - Update the office phone number.

%
%
% 2010-05-09	Refine this file using my Macbook Pro
%
%

%%
%% This file contains a class definition, DJcsmemo, for the LaTeX2e
%% system which defines the layout of an internal memorandum style
%% used by the Dept of Computer Science at the University of Edinburgh.
%%
%% For information on this package, please refer to "texdoc csmemo"
%%
%% To Do List:
%%    . font problems with cm option. option currently not documented
%%

\NeedsTeXFormat{LaTeX2e}[1994/12/01]
\ProvidesClass{DJcsmemo}[2009/03/19 v1.1 ACSE memo - DJ]

%%
%%  --- Options ---
%%

\DeclareOption{times}{\def\memo@fontfamily{ptm}} %% font family used for 
\DeclareOption{cm}{\def\memo@fontfamily{cmr}}    %% titles
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ExecuteOptions{times}
\ProcessOptions

%\LoadClass[a4paper,12pt]{article}
\LoadClass[a4paper]{article}

%%
%% --- Package Loading ---
%%

\RequirePackage{ifthen}
\RequirePackage{graphics}
\RequirePackage{array}
\RequirePackage{ifpdf}
\RequirePackage{titlesec}

%%
\ifpdf
%-->
%--> Google.com search "hyperref options"
%--> 
%--> http://www.ai.mit.edu/lab/sysadmin/latex/documentation/latex/hyperref/manual.pdf
%--> http://www.chemie.unibas.ch/~vogtp/LaTeX2PDFLaTeX.pdf 
%--> http://www.uni-giessen.de/partosch/eurotex99/ oberdiek/print/sli4a4col.pdf
%--> http://me.in-berlin.de/~miwie/tex-refs/html/latex-packages.html
%-->
    \RequirePackage[ pdftex, plainpages = false, pdfpagelabels, 
                 pdfpagelayout = useoutlines,
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 colorlinks = true,
                 linkcolor = blue,
                 urlcolor  = blue,
                 citecolor = blue,
                 anchorcolor = green,
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref} 
    \DeclareGraphicsExtensions{.png, .jpg, .pdf}
    \RequirePackage[pdftex]{graphicx}
    %\pdfcompresslevel=9
    %\graphicspath{{ThesisFigs/PNG/}{ThesisFigs/PDF/}{ThesisFigs/}}
\else
    \RequirePackage[ dvips, 
                 bookmarks,
                 bookmarksopen = true,
                 bookmarksnumbered = true,
                 breaklinks = true,
                 linktocpage,
                 colorlinks = true,
                 linkcolor = blue,%black
                 urlcolor  = blue,%black
                 citecolor = blue,%black
                 anchorcolor = green, %black
                 hyperindex = true,
                 hyperfigures
                 ]{hyperref}
    \DeclareGraphicsExtensions{.eps, .ps}
    \RequirePackage{epsfig}
    \RequirePackage{graphicx}
    %\graphicspath{{ThesisFigs/EPS/}{ThesisFigs/}}
\fi

%%
%% --- Main Code ---
%%

%%
%% Set up the memo page margins
%%

\addtolength{\voffset}{-2.5cm}
\addtolength{\textheight}{4.2cm}
\addtolength{\footskip}{0cm}

\addtolength{\hoffset}{-1.8cm}
\addtolength{\textwidth}{3.5cm}

%% 
%% Set up the fonts (so that the text doesn't change if the
%% document itself is 10pt, 11pt or 12pt).
%%

\def\memo@perpetuafontfamily{mpp}

\DeclareFixedFont{\memo@AddressFont}%
  {\encodingdefault}{\memo@perpetuafontfamily}{m}{n}{12pt}

\DeclareFixedFont{\memo@AddressSmallFont}%
  {\encodingdefault}{\memo@perpetuafontfamily}{m}{n}{10pt}

\DeclareFixedFont{\memo@AddressItalicFont}%
  {\encodingdefault}{\memo@perpetuafontfamily}{m}{it}{12pt}

\DeclareFixedFont{\memo@MainTextFont}%
  {\encodingdefault}{\memo@fontfamily}{m}{n}{12pt}

\DeclareFixedFont{\memo@MainItalicsFont}%
  {\encodingdefault}{\memo@fontfamily}{m}{it}{12pt}

\DeclareFixedFont{\memo@MainBoldFont}%
  {\encodingdefault}{\memo@fontfamily}{b}{n}{12pt}

\DeclareFixedFont{\memo@DescFont}%
  {\encodingdefault}{\memo@fontfamily}{m}{it}{12pt}

\DeclareFixedFont{\memo@TitleFont}%
  {\encodingdefault}{\memo@fontfamily}{b}{n}{16pt}

\DeclareFixedFont{\memo@SectionFont}%
  {\encodingdefault}{\memo@fontfamily}{b}{n}{12pt}

%%
%% Now do the reading in of information
%%

\newcommand{\@memoto}{}
\newcommand{\@memofrom}{}
\newcommand{\@memocc}{}
\newcommand{\@memosubject}{}
\newcommand{\@memodate}{\@date}
\newcommand{\@memospecial@header}{}
\newcommand{\@memospecial@text}{}
\newcommand{\@addressname}{}
\newcommand{\@addresstitle}{}
\newcommand{\@addressalttitle}{}
\newcommand{\@addressemail}{}
\newcommand{\@addressext}{}

%%
% new commands defined by Khaos
\newcommand{\@memokeywords}{}

\newcommand{\MemoTo}[1]{\renewcommand{\@memoto}{#1}}
\newcommand{\MemoFrom}[1]{\renewcommand{\@memofrom}{#1}}
\newcommand{\MemoCC}[1]{\renewcommand{\@memocc}{#1}}
\newcommand{\MemoSubject}[1]{\renewcommand{\@memosubject}{#1}}
\newcommand{\MemoDate}[1]{\renewcommand{\@memodate}{#1}}
\newcommand{\MemoSpecial}[2]{\renewcommand{\@memospecial@header}{#1}%
                             \renewcommand{\@memospecial@text}{#2}}
\newcommand{\AddressName}[1]{\renewcommand{\@addressname}{#1}}
\newcommand{\AddressTitle}[1]{\renewcommand{\@addresstitle}{#1}}
\newcommand{\AddressAltTitle}[1]{\renewcommand{\@addressalttitle}{#1}}
\newcommand{\AddressEmail}[1]{\renewcommand{\@addressemail}{#1}}
\newcommand{\AddressExt}[1]{\renewcommand{\@addressext}{#1}}

%%
% new commands defined by Khaos
\newcommand{\MemoKeywords}[1]{\renewcommand{\@memokeywords}{#1}}


%%
%% Sundry lengths and commands used by the \makefax command
%%

\newlength{\memo@infolen}
\setlength{\memo@infolen}{\textwidth}
\addtolength{\memo@infolen}{-1.1in}

%%
% Command for phone number
\newcommand{\memo@ob}{\raisebox{1pt}{(}}
\newcommand{\memo@cb}{\raisebox{1pt}{)}}
\newcommand{\memo@plus}{\raisebox{0pt}{+}}%
% Your local code (phone number)
\newcommand{\memo@code}{\memo@ob\memo@plus44\memo@cb\ \memo@ob0\memo@cb114\ }

%%
%% The bit which inserts a University crest - ripped from euletr.cls
%%

%\def\@dvips{dvips.def}
%\def\@oztex{oztex.def}
%\def\@pdflatex{pdflatex.def}
\ifpdf
       \newcommand{\@eushield}{%
          \includegraphics{Sheffield.pdf}
       }%
\else
       \newcommand{\@eushield}{%
         \scalebox{1}{\includegraphics{Sheffield.eps}}
       }%
\fi
%%
% Line from the original style, I have changed them. See previous lines
%\ifx\Gin@driver\@dvips
%        %%% Do the PS image stuff for the DVIPS driver
%        \newcommand{\@eushield}{%
%          \scalebox{1}{\includegraphics{Sheffield.eps}}
%        }%
%\else
%\ifx\Gin@driver\@pdflatex
%        %%% Do the PS image stuff for OzTeX
%        \newcommand{\@eushield}{%
%           \includegraphics[30mm]{Sheffield.pdf}
%        }%
%\fi
%\fi


%%
\renewcommand\thepart {}
\@addtoreset{section}{part}
\titleformat{\part}[hang]%
	{\memo@TitleFont}%	title format
	{\thepart}%				label
	{0em}%						sep
	{}%							before-code
	{}%							after-code
\titlespacing*{\part}%
	{0ex}%							left
	{*-2.8}%							before
	{*-3.3}%							after
	[1pc]%							right

%%
%% Now draw the actual memo cover page using the information we have
%%

\renewcommand{\maketitle}{%
  {\parindent=0pt\parskip=0pt\newpage\thispagestyle{empty}%
	%\hypertarget{titleplace.0}{}
	%\pdfbookmark[0]{\@memodate}{titleplace}%
    \hfill \vbox to 0mm {\vss \hbox to 0pt {\hss \@eushield \hss} \vss}
    \vspace*{1cm}
    \begin{flushright}\memo@AddressFont
      DEPARTMENT {\memo@AddressItalicFont of} AUTOMATIC CONTROL \& SYSTEMS ENGINEERING\vspace*{1.8ex}\\%
      \ifthenelse{\equal{\@addressname}{}}{}{\@addressname \\}%
      \ifthenelse{\equal{\@addresstitle}{}}{}{\@addresstitle \\}%
      \ifthenelse{\equal{\@addressalttitle}{}}{}{\@addressalttitle \\}%
%      The University of Edinburgh \\
%      Department of Automatic Control \& Systems Engineering \\
%      The University of Sheffield \\
	  Amy Johnson Building \\
      Mappin Street \\
      Sheffield,\,\ S1 3JD,\,\ U.K.\vspace*{0.8ex} \\
      \memo@AddressSmallFont
      Tel No: \memo@code 222
      \ifthenelse{\equal{\@addressext}{}}{5129}{\@addressext}%\\%
%		Do not leave any blank line here, because there is an error if so.	  
%		If you have a fax No., please uncomment the following two lines and change the number.	
	  %\\
      %Fax No: \memo@code 222 5129
      \ifthenelse{\equal{\@addressemail}{}}{}%
         {\\ \vskip 1ex Email: {\href{mailto:\@addressemail}{\tt\@addressemail}}}%
    \end{flushright}%
    
    \vspace{1.6ex}%
	\begin{flushleft}
    {%\memo@TitleFont MEMORANDUM}%
	%\memo@TitleFont \hypertarget{titleplace}{MEMORANDUM}}%
	%\memo@TitleFont \hypertarget{titleplace}{MEMORANDUM}}%
	%\hypertarget{titleplace.0}{}
	\part{\texorpdfstring{MEMORANDUM}{\@memokeywords (\@memodate)}}}%
	%\pdfbookmark[1]{\@memodate}{part}}%
    \end{flushleft}%
	\vspace*{-3ex}\rule{\textwidth}{0.9mm}\par%
    \vskip 10pt
    \begin{tabular}{lp{\memo@infolen}}
    \bfseries To:      & \@memoto \\
    \bfseries From:    & \@memofrom \\%
    \ifthenelse{\equal{\@memocc}{}}{}{\bfseries CC: & \@memocc \\}%
    \ifthenelse{\equal{\@memospecial@header}{}}{}%
       {\bfseries \@memospecial@header: & \@memospecial@text \\}%
    \bfseries Date:    & \@memodate \\
    \bfseries Subject: & \@memosubject
    \end{tabular}
	\par\vskip 8pt%
	%\noindent
	\rule{\textwidth}{0.5mm}\par%
	\vskip 10pt
    %\par\vskip 8pt\noindent\hrulefill\vskip 10pt
  }
  %
  % Uncomment the following two line to give a noindent style.
  %\parindent=0pt
  %\parskip=\baselineskip
}

%%
% New command to add new memo
\newcommand{\makenewmemo}{}

%\newcounter{djmemo}
%\renewcommand\thedjmemo {}
%\@addtoreset{section}{djmemo}
% \@addtoreset{section}{part}
% \renewcommand\thepart {\memo@TitleFont}
\renewcommand{\makenewmemo}{%
	%\hypertarget{titleplace.0}{}
	%\pdfbookmark[0]{\@memodate}{titleplace}
	% \maketitle have to be put at the first line, then reset everything.
	\maketitle
	%\phantomsection
	% Reset section counter
	%\part[aaa]{}
	%\setcounter{part}{0}%
	%\djmemo[aaa]{}
	%\phantomsection
	\stepcounter{part}
	%\pdfbookmark[0]{\@memodate}{titleplace}
	% Reset page number
	\pagenumbering{arabic}
	% Note that the value of section counter is 0 than 1.
	%\newpage
	%\maketitle
	}
%%
%% EOF: DJcsmemo.cls
%%