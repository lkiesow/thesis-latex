% * use options "utf8" or "latin1" to select inputencoding
\ProvidesClass{andless}

\LoadClass{article}
%\LoadClass{book}

\newcounter{language}
\DeclareOption{german}{  \setcounter{language}{1} }
\DeclareOption{english}{ \setcounter{language}{2} }

\newcounter{size}
\setcounter{size}{4}
\DeclareOption{4inch}{ \setcounter{size}{4} }
\DeclareOption{7inch}{ \setcounter{size}{7} }

\ProcessOptions

\RequirePackage{ifthen}

\RequirePackage[8pt]{extsizes}
\newdimen\screenheight
\ifthenelse{\value{size} = 4} { % 4 inch display
	\RequirePackage[paperwidth=53mm, paperheight=500cm, top=1mm, bottom=1mm, left=2mm, right=2mm]{geometry}
	\screenheight=93mm
}{ \ifthenelse{\value{size} = 7} { % 7 inch display
	\RequirePackage[paperwidth=85mm, paperheight=500cm, top=1mm, bottom=1mm, left=2mm, right=2mm]{geometry}
	\screenheight=140mm
}{}}

\ifthenelse{\value{language} = 1} {
	\RequirePackage[ngerman]{babel}
}{
	\RequirePackage[english]{babel}
}

\usepackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}


% TeX Gyre Bonum
% http://www.tug.dk/FontCatalogue/tgbonum/
\usepackage{tgbonum}

\RequirePackage{graphicx}
\RequirePackage[colorlinks=true, linkcolor=red]{hyperref}
\RequirePackage{booktabs}
\RequirePackage[final]{microtype}

\RequirePackage[raggedright]{titlesec}

\setlength{\tolerance}{300}
\setlength{\emergencystretch}{2mm}

\RequirePackage{setspace}
\setstretch{1.1}

\RequirePackage{tocloft}
\renewcommand{\@pnumwidth}{2.8em}          % More space for numbers on right side as they tend to get high
\renewcommand{\@tocrmarg}{2.55em plus1fil} % Ragged right TOC
\addtolength{\cftsecnumwidth}{.2em}

% No paragraph indention
\setlength\parindent{0pt}

%\RequirePackage[active,tightpage]{preview}
%\renewcommand{\PreviewBorder}{2mm}
%\newcommand{\Newpage}{\end{preview}\begin{preview}}

%\RequirePackage{everypage}
%\AddEverypageHook{ \end{preview} \begin{preview} }

%\PreviewEnvironment{itemize}

\pagestyle{empty} %get rid of header/footer for toc page (This does not affect the first page…)
\addtocontents{toc}{\protect\thispagestyle{empty}} % …but this does

\let\oldpar=\par
\def\par{\pagebreak\oldpar}
\let\@@oldpar=\@@par
\def\@@par{\pagebreak\@@oldpar}

% Keep titlepage as one
\renewenvironment{titlepage}{
	\def\par{\oldpar}
	\def\@@par{\@@oldpar}
	\begin{minipage}[t][\screenheight]{\textwidth}
		\vfill
}{
	\vfill\vfill
	\end{minipage}
	\def\par{\pagebreak\oldpar}
	\def\@@par{\pagebreak\@@oldpar}
}

\RequirePackage{everyshi}

\EveryShipout{%
	\pdfpageheight=\pagetotal
	\advance\pdfpageheight by 2in
	\advance\pdfpageheight by \topmargin
	\advance\pdfpageheight by \textheight % This and next allow for footnotes
	\advance\pdfpageheight by -\pagegoal
	\advance\pdfpageheight by -\footskip
}

\let\oldenditemize=\enditemize
\let\olditemize=\itemize
\renewenvironment{itemize}{\olditemize}{\oldenditemize\def\par{\pagebreak\oldpar}}
%\def\enditemize={\oldenditemize\def\par{\pagebreak\oldpar}}

% This will make sure that there is a new page for every paragraph. Ugly it is,
% but it works ;P
%\parskip = 50cm 
%\everypar=\expandafter{\end{preview}\vspace{50cm}\begin{preview}}
%\def\par{\expandafter{\end{preview}\begin{preview}}}
%\def\par{\expandafter{some text}}

%\renewcommand{\chapter}{%
%\global \@topnum \z@ \@afterindentfalse \secdef \@chapter \@schapter 
%}

%\renewcommand{\section}{%
%\@startsection {section}{1}{\z@ }{-3.5ex \@plus -1ex \@minus -.2ex}{2.3ex \@plus .2ex}{\normalfont \Large \bfseries }
%}

\typeout{*******************************}
\typeout{ Using andless class 2013-11-03}
\typeout{*******************************}
