%
%%% Options:
%
% [german,english]              - Select the language you want to use.
% [draft]                       - Enable draft mode.
% [bars]                        - Draw bars at the top and bottom of the title page
% [classic,red,yellow,gray]     - Define the logo.
% [edgelogo]                    - Place the logo at the top left edge of the page.
% [yellowbars,redbars,graybars] - Define bar color.
% 
% You can define a new logo like this:
% \logo{\includegraphics[width=0.7\textwidth]{img/unilogo}}

\ProvidesClass{uosexpose}

% Process options

% Bars at top/bottom
\newcounter{bars}
\setcounter{bars}{0}
\DeclareOption{bars}{\setcounter{bars}{1}}

\newcounter{edgelogo}
\setcounter{edgelogo}{0}
\DeclareOption{edgelogo}{\setcounter{edgelogo}{1}}

\newcounter{logo}
\setcounter{logo}{0} % classic logo
\newcounter{barcolor}
\setcounter{barcolor}{1} % classic logo

\DeclareOption{classic}{\setcounter{logo}{0} }
\DeclareOption{yellow} {\setcounter{logo}{1} \setcounter{barcolor}{1}}
\DeclareOption{red}    {\setcounter{logo}{2} \setcounter{barcolor}{2}}
\DeclareOption{gray}   {\setcounter{logo}{3} \setcounter{barcolor}{3}}

\DeclareOption{yellowbars}{\setcounter{barcolor}{1}}
\DeclareOption{redbars}   {\setcounter{barcolor}{2}}
\DeclareOption{graybars}  {\setcounter{barcolor}{3}}

\newcounter{padding}
\setcounter{padding}{0}
\DeclareOption{padding}{\setcounter{padding}{1}}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{expose}}

\ProcessOptions\relax

\LoadClass{expose}


\RequirePackage{uoslogo}

\ifthenelse{\value{edgelogo} = 0} {
	\ifthenelse{\value{logo} = 0} { % classic logo
		\logo{%
			\noindent\resizebox{0.7\textwidth}{!}{%
				\uoslogotext{uos-red}{black}%
			}%
		}
	}{\ifthenelse{\value{logo} = 1} { % logo on yellow background
		\logo{%
			\noindent\resizebox{0.7\textwidth}{!}{%
				\uoslogofull{uos-yellow}{uos-red}{black}%
			}%
		}
	}{\ifthenelse{\value{logo} = 2} { % logo on red background
		\logo{%
			\noindent\resizebox{0.7\textwidth}{!}{%
				\uoslogofull{uos-red}{uos-yellow}{white}%
			}%
		}
	}{\ifthenelse{\value{logo} = 3} { % logo on gray background
		\logo{%
			\noindent\resizebox{0.7\textwidth}{!}{%
				\uoslogofull{uos-gray}{uos-red}{black}%
			}%
		}
	}{}}}}
}{
	\ifthenelse{\value{logo} = 0} { % classic logo
		% there is no classic edge logo
	}{\ifthenelse{\value{logo} = 1} { % logo on yellow background
		\logo{%
			\uoslogoedge{uos-yellow}{uos-red}{black}%
			\vspace*{3cm}
		}
	}{\ifthenelse{\value{logo} = 2} { % logo on red background
		\logo{%
			\uoslogoedge{uos-red}{uos-yellow}{white}%
			\vspace*{3cm}
		}
	}{\ifthenelse{\value{logo} = 3} { % logo on gray background
		\logo{%
			\uoslogoedge{uos-gray}{uos-red}{black}%
			\vspace*{3cm}
		}
	}{}}}}
}


\RequirePackage{ifthen}

\ifthenelse{\value{bars} = 1} {
	\ifthenelse{\value{edgelogo} = 0} {
		\ifthenelse{\value{barcolor} = 2} {
			\def\@addtitlecode{\uosbottombar[uos-red]\uostopbar[uos-red]}
		}{\ifthenelse{\value{barcolor} = 3} {
			\def\@addtitlecode{\uosbottombar[uos-gray]\uostopbar[uos-gray]}
		}{
			\def\@addtitlecode{\uosbottombar[uos-yellow]\uostopbar[uos-yellow]}
		}}
	}{
		\ifthenelse{\value{barcolor} = 2} {
			\def\@addtitlecode{\uosbottombar[uos-red]}
		}{\ifthenelse{\value{barcolor} = 3} {
			\def\@addtitlecode{\uosbottombar[uos-gray]}
		}{
			\def\@addtitlecode{\uosbottombar[uos-yellow]}
		}}
	}
}{}
\def\usebars{\gdef\@addtitlecode{\uosbottombar\uostopbar}}
