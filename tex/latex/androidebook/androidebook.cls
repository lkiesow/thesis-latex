% * use options "utf8" or "latin1" to select inputencoding
\ProvidesClass{androidebook}

\LoadClass{article}

\newcounter{language}
\DeclareOption{german}{
	\setcounter{language}{1}
}
\DeclareOption{english}{
	\setcounter{language}{2}
}

\newcounter{encoding}
\setcounter{encoding}{0}
\DeclareOption{latin1}{
	\setcounter{encoding}{1}
}
\DeclareOption{utf8}{
	\setcounter{encoding}{2}
}

\ProcessOptions

\RequirePackage{ifthen}

\ifthenelse{\value{encoding} = 1} { % encoding is latin1
	\usepackage[latin1]{inputenc}

}{ % encoding is utf-8
	\usepackage[utf8]{inputenc}
}

\ifthenelse{\value{language} = 1} {
	\RequirePackage[ngerman]{babel}
}{
	\RequirePackage[english]{babel}
}

\RequirePackage[T1]{fontenc}


% TeX Gyre Bonum
% http://www.tug.dk/FontCatalogue/tgbonum/
\usepackage{tgbonum}

\RequirePackage[8pt]{extsizes}
\RequirePackage{graphicx}
\RequirePackage[colorlinks=true, linkcolor=red]{hyperref}
\RequirePackage{booktabs}
\RequirePackage[final]{microtype}

\RequirePackage[raggedright]{titlesec}

\RequirePackage[paperwidth=53mm, paperheight=93mm, top=2mm, bottom=2mm, left=2mm, right=2mm]{geometry}
\setlength{\tolerance}{300}
\setlength{\emergencystretch}{2mm}

\RequirePackage{setspace}
\setstretch{1.1}

\RequirePackage{tocloft}
\renewcommand{\@pnumwidth}{2.8em}          % More space for numbers on right side as they tend to get high
\renewcommand{\@tocrmarg}{2.55em plus1fil} % Ragged right TOC
\addtolength{\cftsecnumwidth}{.2em}


\RequirePackage[active,tightpage]{preview}
\renewcommand{\PreviewBorder}{2mm}
\newcommand{\Newpage}{\end{preview}\begin{preview}}

\pagestyle{empty} %get rid of header/footer for toc page (This does not affect the first page…)
\addtocontents{toc}{\protect\thispagestyle{empty}} % …but this does

\typeout{^^J*************************************^^J Using androidebook class 2012-09-05^^J*************************************^^J}

\typeout{*************************************}
\typeout{ Using androidebook class 2012-09-05}
\typeout{*************************************}
