% * select [german] or [english]
% * option "draft" is available, too

% You can define a new logo like this:
% \logo{\includegraphics[width=0.7\textwidth]{img/unilogo}}

\ProvidesClass{thesis}

\LoadClass[a4paper, twoside, openright, titlepage]{report}

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

\usepackage[a4paper,twoside,bindingoffset=1cm,top=1in,bottom=1in,right=1.5in,left=1.5in]{geometry}% http://ctan.org/pkg/geometry
\usepackage[\setdraft]{graphicx}
\usepackage[colorlinks=true, unicode=true]{hyperref}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{booktabs}
\usepackage{microtype}
\usepackage{lmodern}
\usepackage{xspace}
\usepackage{textcomp}

% Set some colors:
%  linkcolor: black (Should be obvious on what you can click)
%  urlcolor: black (URLs are recognized anyway)
%  citecolor: no change (I like the dark green)
%  filecolor: no change (Not shure what this is exactly :-))
\hypersetup{ colorlinks=true, linkcolor=black, urlcolor=black }

\date{\the\year}
\def\organization#1{\gdef\@organization{#1}}
\def\@organization{}
\def\department#1{\gdef\@department{#1}}
\def\@department{}
\def\thesistype#1{\gdef\@thesistype{#1}}
\def\@thesistype{Master's thesis}
\def\email#1{\gdef\@email{#1}}
\def\@email{}
\def\city#1{\gdef\@city{#1}}
\def\@city{}
\def\firstsupervisor#1{\gdef\@firstsupervisor{#1}}
\def\@firstsupervisor{}
\def\secondsupervisor#1{\gdef\@secondsupervisor{#1}}
\def\@secondsupervisor{}
\def\title#1{\gdef\@titlestr{#1}}

\def\logo#1{\gdef\@logo{#1}}
\def\@logo{
	\begingroup
	\vfill
		\bf \sc \Huge
		\@organization
	\endgroup
	\vspace{1em}
}

\def\@addtitlecode{}

\def\@author{}
\def\@titlestr{}
\def\@title{
	\begingroup
	\huge \@titlestr
	\endgroup

	\@addtitlecode
}

% Define title page
\renewcommand\maketitle{\begin{titlepage}%
	\newgeometry{margin=1in}%
	\let\footnotesize\small
	\let\footnoterule\relax
	\let \footnote \thanks
	\null
	\begin{center}%
		\@logo \par

		\begingroup
			\bf \sc \huge
			\vspace{1mm}
			\par
			\@department
		\endgroup \\
		
		\vfill

		\begingroup
			\Large
			\@thesistype
		\endgroup

		\hrulefill\\
		\LARGE \@title
		\vspace{-1ex}
		\hrulefill

		\vskip 3em%
		{\Large
			\begin{tabular}[t]{c}%
				\@author \\
				{\large \@email}
			\end{tabular}\par}%
		\vskip 1.5em%
		{\large \@city, \@date \par}%       % Set date in \large size.
	\end{center}\par
	\@thanks
	\vfill
	
	\hfil%
	\begin{tabular}[t]{rl}
		First supervisor  & \begin{tabular}[t]{@{}l} \@firstsupervisor \end{tabular} \\ \\
		Second supervisor & \begin{tabular}[t]{@{}l} \@secondsupervisor \end{tabular}
	\end{tabular}
	\end{titlepage}%
	\setcounter{footnote}{0}%
	\restoregeometry
}

%Define proclamation page for thesis
\newcommand{\proclamationpage}{
	\vspace*{\stretch{2}}
	\hfil{\bf Proclamation}
	\begin{quote}
		Hereby I confirm that I wrote this thesis independently and
		that I have not made use of any other resources or means than
		those indicated.
	  
	  \vskip3em
		\hfill\begin{tabular}{p{4cm}}\toprule
			\hfil \@author
		\end{tabular}
	\end{quote}
	\vspace*{\stretch{1}}
}

% Correct spacing and breaks
\newcommand\ie{i.e\@ifnextchar.{}{.\@\xspace}}
\newcommand\etc{etc\@ifnextchar.{}{.\@\xspace}}
\newcommand\eg{e.g\@ifnextchar.{}{.\@\xspace}}
\newcommand\emdash{{\hskip0pt}---{\hskip0pt}}


\typeout{*********************************************************************}
\typeout{    Using thesis class 2013-01-07 by Lars Kiesow <lkiesow@uos.de>}
\typeout{*********************************************************************}
