\ProvidesClass{StandardTemplate}

\LoadClass[12pt]{article}


\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{float}
\usepackage{graphicx}
\usepackage{amsmath}
\usepackage{amssymb, amsthm}
\usepackage{subfloat}
\usepackage{parskip}
\usepackage{fancyhdr}


% configures geometry of pages
\usepackage[top=1.7cm, bottom=1.7cm, outer=1.5cm, inner=1.5cm, heightrounded, marginparwidth=3.2cm, marginparsep=0.5cm]{geometry}

% proof trees
\usepackage{bussproofs}
% cat diagrams
\usepackage{tikz-cd}
% mathmode text in sans serif
\usepackage{sfmath}
% needed for some symbols, like \xhookrightarrow{}
\usepackage{mathtools}
% some random symbols, like musical notes
\usepackage{wasysym}
% dedukti box
\definecolor{darkblue}{RGB}{0,60,220}
\definecolor{mygreen}{RGB}{0, 120, 30}
\newcommand{\ctb}[1]{\textcolor{darkblue}{#1}}
\newcommand{\ctg}[1]{\textcolor{mygreen}{#1}}
\usepackage[many]{tcolorbox}
\tcbuselibrary{skins}
\newcommand{\dedukti}[1]{\begin{center}\begin{tcolorbox}[blanker,left=3mm,right=3mm,
  borderline vertical={2pt}{0pt}{black}, text width=180mm]
\abovedisplayskip=0pt
  \begin{flalign*}
    #1
  \end{flalign*}
\end{tcolorbox}\end{center}}
% defines my dark red color
\definecolor{darkred}{RGB}{120, 29, 29} 
% configures font of sections, subsections, etc
\usepackage{sectsty}
\chapterfont{\color{blue} }  % sets colour of chapters
\sectionfont{\color{darkred} \sffamily}  % sets colour of sections
\subsectionfont{\color{darkred} \sffamily}  % sets colour of sections
\subsubsectionfont{\color{darkred} \sffamily}  % sets colour of sections
% footnotes at the end of the document
\usepackage{enotez}
\setenotez{backref=true, list-name=, mark-format=\greensup}
\DeclareInstance{enotez-list}{custom}{paragraph}
{
  heading   = ,
  format    = \normalfont          ,
  number    = \color{mygreen}{\textsuperscript{#1}},
}
\definecolor{mygreen}{RGB}{0, 140, 0}
\newcommand{\greensup}[1]{\color{mygreen}{\textsuperscript{#1}}}

% to use appendices
\usepackage[title]{appendix}

% remove name of references (useful when making it an appendix)
%\usepackage{etoolbox}
%\patchcmd{\thebibliography}{\section*{\refname}}{}{}{}

% for semantic bracket
\usepackage{stmaryrd}

% margin note
\newcommand{\margincom}[1]{% a simple margin note
        \refstepcounter{margincount}% step counter
        \textsuperscript{\themargincount}% the number (superscript) in text preceded by m
        \marginpar{\vspace{-2em}\footnotesize \textsuperscript{\themargincount}\gray{#1}}}
\newcounter{margincount}


% macros
\newcommand{\Type}{\textbf{Type}}
\newcommand{\Kind}{\textbf{Kind}}
\newcommand{\Set}{\textbf{Set}}
\newcommand{\Agda}{\textsc{Agda}}
\newcommand{\AgdaDedukti}{\textsc{Agda2Dedukti}}
\newcommand{\Dedukti}{\textsc{Dedukti}}
\newcommand{\Lambdapi}{\textsc{Lambdapi}}
\newcommand{\Prop}{\textbf{Prop}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\red}{\xhookrightarrow{\quad}}



% -- CONFIGURES THE FONT --
\usepackage{tgpagella}



% -- DEFINES THEOREMS, DEFS, ETC --

\newtheoremstyle{mystyle}%                       % Name
  {4pt}%                                         % Space above
  {4pt}%                                         % Space below
  {\itshape}%                                    % Body font
  {}%                                            % Indent amount
  {\bfseries \sffamily \color{darkred}}%         % Theorem head font
  {}%                                            % Punctuation after theorem head
  {.5em}%                                        % Space after theorem head, ' ', or \newline
  {\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}%  % Theorem head spec (can be left empty, meaning `normal')
\theoremstyle{mystyle}


\newtheorem{thm}{Theorem}[section]
\newtheorem{prop}{Proposition}[section]
\newtheorem{lem}{Lemma}[section]
\newtheorem{cor}{Corollary}[section]
\renewcommand{\qedsymbol}{$\blacksquare$}

\newtheoremstyle{definition}%                % Name
  {4pt}%                                     % Space above
  {4pt}%                                     % Space below
  {\it}
  {}%                                     % Indent amount
  {\bfseries \sffamily \color{darkred}}%                            % Theorem head font
  {}%                                    % Punctuation after theorem head
  {.5em}%                                    % Space after theorem head, ' ', or \newline
  {\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}}%                                     % Theorem head spec (can be left empty, meaning `normal')

\theoremstyle{definition}
\newtheorem{definition}{Definition}[section]

% -- DEFINES THE TITLE FORMAT --

\makeatletter         
\def\@maketitle{
{\raggedright % Note the extra {
  \begin{center}
\vspace{12cm} \ \\   
{\LARGE  \bfseries \textsf{\color{darkred} \@title} }\\[2ex] 
{\large   \textsf{\@author}}\\[1.5cm] 
\end{center}
}} % Note the extra }
\makeatother

% -- CONFIGURES LINK COLORS --

\usepackage{hyperref}
\hypersetup{
    colorlinks,
    citecolor=green,
    filecolor=black,
    linkcolor=blue,
    urlcolor=cyan
}

\author{Thiago Felicissimo}
