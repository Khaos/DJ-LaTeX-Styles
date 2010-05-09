%
% CUEDthesis v1.0
% By Harish Bhanderi <harish.bhanderi@cantab.net>
% Version 1.0 released 15/07/2002
%
% DJCUEDthesis v1.0
% By Dazhi Jiang <jiangdzh@gmail.com>
% Version 1.0 released 08/06/2009
% Inspired by CUEDthesis

%---------------------------------------------------------------
%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
%\ProvidesClass{CUEDthesisPSnPDF}[2003/01/11 v1.2 CUED thesis class]
\ProvidesClass{DJCUEDthesisPSnPDF}[2009/06/08 v1.0 DJ CUED thesis class]
%-------------------------- initial code -----------------------

%If you want to use a Report style document then uncomment the following 3 lines and comment the below 8 book style lines:
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%\ProcessOptions\relax
%%\LoadClass[a4paper]{report}
%\ifx\pdfoutput\undefined
%   \LoadClass[dvips, a4paper]{report}
%\else
%   \LoadClass[pdftex, a4paper]{report}
%\fi
%%Bibliography
%%uncomment next line to change bibliography name to references for Report document class
%\renewcommand{\refname}{References}

%If you want to use a Book style document then uncomment the following 3 lines and comment the above 8 report style lines:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips, a4paper]{book}
\else
   \LoadClass[pdftex, a4paper]{book}
\fi

\input{DJThesisIFP}


%\usepackage{amssymb}							% Math style, e.g., \mathbb
%\usepackage{graphics}							% Graphy style
%\usepackage{fancyhdr}							% Page header
%\usepackage{eucal}								% Euler math font
%\usepackage[english]{babel}					% Non-english font
%\usepackage[usenames, dvipsnames]{color}		% Color
%\usepackage[perpage]{footmisc}					% Footnote
%\usepackage[numbers, sort&compress]{natbib}	% Bibliography
%\usepackage{ifthen}							    % ifthen
%\usepackage{ifpdf}								% ifpdf
%\usepackage{titlesec}							% Titles of Chapter, section, subsection ...
%\usepackage{gensymb}

%\usepackage{titletoc}							% Titles of Chapter, section, subsection ...


%\newif \ifpdf
%    \ifx \pdfoutput \undefined
%        % for running latex
%        \pdffalse
%    \else
%        % for running pdflatex
%        \pdfoutput = 1    % positive value for a PDF output
%                          % otherwise a DVI
%        \pdftrue
%\fi


%define the page size including an offset for binding
%\setlength{\topmargin}{0.0in}
%\setlength{\oddsidemargin}{0in}
%\setlength{\evensidemargin}{0in}
%\setlength{\textheight}{700pt}
%\setlength{\textwidth}{500pt}


%A4 settings
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm}
   \setlength{\paperwidth}{210mm}
\fi


\newcommand{\submittedtext}{{A report submitted for ALSTOM}}
% Define the subtitle
\newcommand{\subtitle}{{}}
%
%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
\def\collegeordept#1{\gdef\@collegeordept{#1}}
% The name of your University
\def\university#1{\gdef\@university{#1}}
% The name of your supervisor
\def\supervisor#1{\gdef\@supervisor{#1}}
% The name of your supervisor
\def\award#1{\gdef\@award{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}


% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

%define title page layout
\renewcommand{\maketitle}{%
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
%  \null\vfill
  \begin{center}
\vspace*{\stretch{2}}
    { \LARGE {\bfseries {\@title}} \par}
{\large \vspace*{35mm} {{\@crest} \par} \vspace*{25mm}}
    {{\large \@author} \par}
    {{\large \@award} \par}
    {{\large \@degreedate} \par}
{\large \vspace*{1ex}
    {{Supervisor: \@supervisor}\par}
    {{\@collegeordept} \par}
    {{\@university} \par}}
\vspace*{20mm}
    {{\submittedtext} \par}
    {{\@degree}}
  \end{center}
  \null\vfill
\end{alwayssingle}}

%\makeatletter
%define my title page layout
\newcommand{\makemytitle}{%
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
%  \null\vfill
  \begin{center}
\vspace*{\stretch{2}}
    { \LARGE {\bfseries {\@title}} \par}
{\large \vspace*{35mm} {{\@crest} \par} \vspace*{25mm}}
    {{\large \@author} \par}
    {{\large \@award} \par}
    {{\large \@degreedate} \par}
{\large \vspace*{1ex}
    {{Supervisor: \@supervisor}\par}
    {{\@collegeordept} \par}
    {{\@university} \par}}
\vspace*{20mm}
    {{\submittedtext} \par}
    {{\@degree}}
  \end{center}
  \null\vfill
\end{alwayssingle}}

%\makeatother

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}

% CONFIDENTIAL
%

\newenvironment{confidential}
{\begin{alwayssingle}
  \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\pagestyle{plain}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\pagestyle{plain}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}\begin{quote}}
{\end{quote}\end{alwayssingle}}

%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstracts} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractslong} {\begin{alwayssingle} \pagestyle{plain}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm} }
{\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

%SUMMARY
%
%The summary environment puts a large, bold, centered "Summary" label at
%the top of the page. The summary itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{summary} {\begin{alwayssingle} \pagestyle{plain}
%  \begin{center}
  \vspace*{0.6cm}\noindent
  {\Large \bfseries  Summary}
%  \end{center}
  \vspace{0.5cm} }
{\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}



% Package
\input{DJThesisLoadAll}
