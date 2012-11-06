% * select [german] or [english]
% * option "draft" is available, too

% You can define a new logo like this:
% \logo{\includegraphics[width=0.7\textwidth]{img/unilogo}}

\ProvidesClass{expose}

\LoadClass[a4paper, twocolumn]{article}

\newcommand{\setdraft}{}
\DeclareOption{draft}{\renewcommand{\setdraft}{draft}}

\newcounter{language}
\setcounter{language}{1} % Default language is enslish.
\DeclareOption{german}{ \setcounter{language}{2} }

\ProcessOptions

\RequirePackage{ifthen}

\ifthenelse{\value{language} = 2} {
	\RequirePackage[ngerman]{babel}
}{
	\RequirePackage[english]{babel}
}

\usepackage[\setdraft]{graphicx}
\usepackage[colorlinks=true, unicode=true]{hyperref}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{booktabs}
\usepackage{microtype}
\usepackage{lmodern}
\usepackage{xspace}
\usepackage{textcomp}
\usepackage{uoscolor}
\usepackage{uoslogo}

\def\department#1{\gdef\@department{#1}}
\def\@department{virtUOS}
\def\title#1{\gdef\@titlestr{#1}}

\def\logo#1{\gdef\@logo{#1}}
\def\@logo{
	\vspace*{3cm}
}

\def\@addtitlecode{}

\def\@author{}
\def\@titlestr{}
\def\@title{
	\vspace*{-3cm}
	\@logo \par
	\begingroup
	\bf \sc \huge
	\@department
	\endgroup \\
	\vspace{.5cm}
	\@titlestr
	\@addtitlecode
}

% Prenote for bibliography

\def\bibliographyprenote#1{\gdef\@bibliographyprenote{#1}}
\def\@bibliographyprenote{}

\renewenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \@bibliographyprenote
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

% Correct spacing and breaks
\newcommand\ie{i.e\@ifnextchar.{}{.\@\xspace}}
\newcommand\etc{etc\@ifnextchar.{}{.\@\xspace}}
\newcommand\emdash{{\hskip0pt}---{\hskip0pt}}


\typeout{*********************************************************************}
\typeout{    Using expose class 2012-10-16 by Lars Kiesow <lkiesow@uos.de>}
\typeout{*********************************************************************}
