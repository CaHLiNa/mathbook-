\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mathbook}[2025/04/17 mathbook class]

\newcommand\@fontset{fandol} %定义字体集
\DeclareOption{fandol}{\renewcommand\@fontset{fandol}}
\DeclareOption{windows}{\renewcommand\@fontset{windows}}
\DeclareOption{mac}{\renewcommand\@fontset{mac}}

\newcommand\@showanswer{show} % 定义答案环境
\DeclareOption{show}{\renewcommand\@showanswer{show}}
\DeclareOption{noshow}{\renewcommand\@showanswer{noshow}}

% 定义条件变量
\newif\ifusecustomthm
\usecustomthmfalse % 默认使用自定义定理环境
% 定义选项处理
\DeclareOption{custom}{\usecustomthmtrue}
\DeclareOption{plain}{\usecustomthmfalse}
% 定义默认页面格式
\def\@pageformat{standard}
\newcommand{\mathPageFormat}{0}
\DeclareOption{standard}{\def\@pageformat{standard}\def\mathPageFormat{0}} 
\DeclareOption{padl}{\def\@pageformat{padl}\def\mathPageFormat{1}}  

% 加载基础类
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\LoadClass{book}

\RequirePackage[fontset = \@fontset, punct=kaiming,zihao=-4,heading=true]{ctex}
%punct=kaiming 标点占半个字符宽度，避免出现在行首
%zihao=-4 字号小四
\RequirePackage{kvoptions}
\RequirePackage{tabularx, ifthen} % 排选项用
\RequirePackage{xcolor,graphicx,caption} % 彩色、图片、图释
\RequirePackage{geometry,fancyhdr} % 纸张、边距、页眉、页脚
\RequirePackage{etoolbox} 
\RequirePackage{amsmath,amsmath,amssymb,amsthm} % ams数学相关
\RequirePackage{mathdots,mathrsfs}
\RequirePackage{fourier}  %用于更改数学字体为Fourier字体
\RequirePackage{pifont} % 带圈数字\ding
\RequirePackage{bbding} % 图案
\RequirePackage{romannum} % 罗马数字
\RequirePackage{enumitem}
\RequirePackage{listings} % 代码
\RequirePackage{tikz} % 绘图
\RequirePackage{titletoc} % 目录
\RequirePackage{titlesec} % 标题
\RequirePackage{hyperref}
\RequirePackage{afterpage} 
\RequirePackage{zhnumber} 
\RequirePackage{fontspec} 
\RequirePackage{lastpage} 
\RequirePackage{titling} 
\RequirePackage{adjustbox} 
\RequirePackage{fontawesome5} 
\RequirePackage{multicol} 
\RequirePackage{bm} 
\RequirePackage{pgffor}    % 用于循环
\RequirePackage{xkeyval}
\RequirePackage{pgfmath} % 导入随机数生成包
\RequirePackage{truncate}
\RequirePackage{pgfkeys}
\RequirePackage{zref-abspage}    % 绝对页面定位
\RequirePackage{calc}            % 长度计算
\RequirePackage{tcolorbox}
\RequirePackage{needspace}% 添加空间检测宏包


\usetikzlibrary{shapes.geometric,decorations.pathmorphing,positioning,calc,fadings}

\hypersetup {colorlinks=true,linkcolor=black, urlcolor=themeColor, citecolor=red,pdfencoding=auto}
\setmainfont{Times New Roman} % 设置全局英文字体为 Times New Roman

\renewcommand\arraystretch{1.3}  % 表格行高（选择题选项间距）
\renewcommand{\baselinestretch}{1.3} % 设置行间距

% 正常字体设置
\RequirePackage{microtype}  % 优化字体

% 标点替换的可靠方法
\catcode`，=\active \def，{,}
\catcode`。=\active \def。{.}
\catcode`：=\active \def：{:}
\catcode`（=\active \def（{(}
\catcode`）=\active \def）{)}

%%%%%%%%颜色定义%%%%%%%%%%%
% 设置颜色变量
\newcommand{\blue}{blue}
\newcommand{\green}{green}
\newcommand{\purple}{purple}
\newcommand{\orange}{orange}
\newcommand{\infj}{infj}
\newcommand{\enfp}{enfp}
\newcommand{\infp}{infp}
\newcommand{\esfp}{esfp}
\newcommand{\intj}{intj}
\newcommand{\entp}{entp}
\newcommand{\isfj}{isfj}
\newcommand{\enfj}{enfj}
 
% 设置颜色命令
\newcommand{\setThemeColor}[1]{%
    \ifx#1\blue
    \definecolor{themeColor}{HTML}{015697} % 自定义颜色 蓝色
    \else
    \ifx#1\green
    \definecolor{themeColor}{HTML}{01847c} % 自定义颜色 绿色
    \else
    \ifx#1\purple
    \definecolor{themeColor}{HTML}{61589b} % 自定义颜色 紫色
    \else
    \ifx#1\orange
    \definecolor{themeColor}{HTML}{EA4C0E} % 自定义颜色 橙色
    \else
    \ifx#1\infj
    \definecolor{themeColor}{HTML}{3b4676} % 自定义颜色 infj
    \else
    \ifx#1\enfp
    \definecolor{themeColor}{HTML}{d58a05} % 自定义颜色 enfp
    \else
    \ifx#1\infp
    \definecolor{themeColor}{HTML}{3b6079} % 自定义颜色 infp
    \else
    \ifx#1\esfp
    \definecolor{themeColor}{HTML}{d86b09} % 自定义颜色 esfp
    \else
    \ifx#1\intj
    \definecolor{themeColor}{HTML}{38558f} % 自定义颜色 intj
    \else
    \ifx#1\entp
    \definecolor{themeColor}{HTML}{8c2b2b} % 自定义颜色 entp
    \else
    \ifx#1\isfj
    \definecolor{themeColor}{HTML}{4d417e} % 自定义颜色 isfj
    \else
    \ifx#1\enfj
    \definecolor{themeColor}{HTML}{e15715} % 自定义颜色 enfj
    \else
    \definecolor{themeColor}{HTML}{015697} % 自定义颜色 蓝色
    \fi
    \fi
    \fi
    \fi
    \fi
    \fi
    \fi
    \fi
    \fi
    \fi
    \fi
    \fi
}
\definecolor{maincolor}{HTML}{015697} % 自定义颜色 蓝色
\definecolor{secondcolor}{HTML}{3b4676}% 定义标题颜色
\definecolor{thirdcolor}{HTML}{8c2b2b}% 定义标题颜色
\definecolor{themeColor}{RGB}{0,0,0}% 定义标题颜色

% 封面设置
\def\mathbook@value@Title{\heiti 此处填写主标题}
\def\mathbook@value@Subtitle{\textbf{此处填写副标题}}
\def\mathbook@value@TypeOne{\textbf{A4标准版}}
\def\mathbook@value@TypeTwo{\textbf{iPad横版}}
\def\mathbook@value@motto{ Success in mathematics requires dedication and perseverance}
\def\mathbook@value@Creator{\textbf{Math173SR}}
\def\mathbook@value@UpdateTime{\textbf{最后更新时间：\today}}
\def\mathbook@value@Lhead{\leftmark}
\def\mathbook@value@Chead{}
\def\mathbook@value@Rhead{\rightmark}
\def\mathbook@value@LheadC{Math173SR}

\newcommand\Title[1]{\def\mathbook@value@Title{\heiti \textbf{#1}}} 
\newcommand\Subtitle[1]{\def\mathbook@value@Subtitle{\textbf{#1}}}
\newcommand\TypeOne[1]{\def\mathbook@value@TypeOne{\textbf{#1}}}
\newcommand\TypeTwo[1]{\def\mathbook@value@TypeTwo{\textbf{#1}}}
\newcommand\motto[1]{\def\mathbook@value@motto{\itshape #1}}
\newcommand\Creator[1]{\def\mathbook@value@Creator{\textbf{#1}}}
\newcommand\UpdateTime[1]{\def\mathbook@value@UpdateTime{\textbf{最后更新时间：#1}}}
\newcommand\Lhead[1]{\def\mathbook@value@Lhead{\textbf{#1}}}
\newcommand\Chead[1]{\def\mathbook@value@Chead{\textbf{#1}}}
\newcommand\Rhead[1]{\def\mathbook@value@Rhead{\textbf{#1}}}
\newcommand\LheadC[1]{\def\mathbook@value@LheadC{\textbf{#1}}}


\newcommand{\explain}[1]{\textcolor{themeColor}{\selectfont \ding{226} 此部分答案见原书P#1}}
\newcommand{\emptybox}{(\hspace{1.5em})} % 空括号
\newcommand{\emptyline}{\underline{\hspace{3em}}} % 空白下划线
%\newcommand{\noreftitle}[1]{\par \textbf{#1} \par} % 无索引标题

% 定义一个只隐藏当前页的页眉和页脚的命令
\newcommand{\hideheaderfooter}{
  \fancypagestyle{emptyheaderfooter}{
    \fancyhf{}  % 清空页眉和页脚
  }
  \thispagestyle{emptyheaderfooter}  %将新定义的样式应用于当前页面，不影响其他页面的默认页眉页脚设置
}

% 定义页码切换命令
\newcommand{\useromanpagenumbering}{%
    \pagenumbering{roman}%
    \pagestyle{plain}%
}

\newcommand{\usearabicpagenumbering}{%
    \pagenumbering{arabic}%
    \setcounter{page}{1}% 重置页码计数
    \pagestyle{fancy}% 恢复自定义页眉页脚
}

% 自动应用页码设置
\AtBeginDocument{%
    \useromanpagenumbering % 默认目录使用罗马数字
    \apptocmd{\tableofcontents}{%
        \clearpage
        \usearabicpagenumbering % 目录结束后切换阿拉伯数字
    }{}{}
}

%%%%%%%%%%%%%%A4标准版%%%%%%%%%%%%%%%%%%%%%%%
\ifcase\mathPageFormat
    \geometry{
    a4paper, % 纸张大小为 A4
    left=2.00cm, % 左边距 2.54 厘米
    right=2.00cm, % 右边距 2.54 厘米
    top=2.54cm, % 上边距 2.54 厘米
    bottom=2.54cm, % 下边距 2.54 厘米
    headheight=15pt, % 页眉高度
    headsep=0.5cm, % 页眉与正文的距离
    footskip=1cm % 页脚与正文的距离
    }   
% 自定义封面样式
  \renewcommand{\maketitle}{
    \thispagestyle{empty} % 本页无页眉页脚
    \begin{titlepage}
        \begin{tikzpicture}[remember picture, overlay]
            \fill[maincolor] (current page.south west) rectangle (current page.north east);
            \fill[secondcolor] ([yshift=-0.25\paperheight]current page.north west) rectangle ([xshift=-0.25\paperwidth,yshift=-0.20\paperheight]current page.north east);
            \fill[secondcolor] ([xshift=-0.25\paperwidth,yshift=-0.20\paperheight]current page.north east) rectangle (current page.north east);
            \foreach \x in {-0.25,-0.27,-0.29,...,-0.97}
            {
              \fill[secondcolor] ([yshift=\x\paperheight]current page.north east) rectangle ++(-0.25\paperwidth,-3mm);
            }
            \node[anchor=west, align=left, text width=\textwidth, inner sep=0] at ([yshift=6cm, xshift=0.5cm]current page.west) {\fontsize{36pt}{0}{\mathbook@value@Title}};
            \node[anchor=west, align=left, text width=\textwidth, inner sep=0] at ([yshift=4.5cm, xshift=0.5cm]current page.west) {\fontsize{28pt}{0}{\mathbook@value@Subtitle}};
            \node[anchor=south, align=center] at ([yshift=2.1cm,xshift=0.5cm]current page.south) {\color{black}\fontsize{16pt}{0}{\mathbook@value@Creator}};
            \node[anchor=south, align=center] at ([yshift=1.5cm,xshift=2cm]current page.south) {\color{black}\fontsize{12pt}{0}{\mathbook@value@UpdateTime}};
            \node[anchor=south, align=center] at ([yshift=0.5cm,xshift=-5cm]current page.south) {\color{black}\fontsize{12pt}{0}{\mathbook@value@motto}};
            \node[anchor=north, align=center] at ([yshift=23.6cm, xshift=17.8cm]current page.south west) {\color{black}\fontsize{24pt}{0}\mathbook@value@TypeOne};
            \node[] at ([shift={(-0.45\paperwidth,0.3\paperheight)}]current page.south east) {
              \begin{tikzpicture}
                % 填充一个圆形
                \fill[fill=thirdcolor] (0,0) circle (4cm);
                % 绘制一个较粗的圆形
                \draw[line width=10pt] (0,0) circle (3.6cm);
                % 绘制从内圆到外圆的径向线条
                \foreach \x in {0,30,...,360}
                {
                  \draw[line width=1pt] (\x:3.6cm) -- (\x:4cm);
                }
                % 在四个方向绘制较粗的线段
                \foreach \x in {0,90,180,270}
                {
                \draw [line width=10pt] (0,0)++(\x:3cm) -- ++(\x:0.6cm);
                }
                % 绘制更多的径向线条
                \foreach \x in {0,30,...,360}
                {
                  \draw[] (\x:3.2cm)--++(\x:0.4cm);
                }
                % 放置节点
                \node[scale=3] at (0,2.1) {$\lim_{}$};
                \node[scale=3] at (0,-2.1) {$\sum_{}$};
                \node[scale=3] at (2.1,0) {$\infty$};
                \node[scale=3] at (-2.1,0) {$\int$};
                % 填充扇形区域
                \fill[fill=thirdcolor] (-3,3)--++(45:1cm) arc [start angle=45,end angle=225,radius=1cm] -- cycle;
                \fill[fill=thirdcolor] (3,3)--++(-45:1cm) arc [start angle=-45,end angle=135,radius=1cm] -- cycle;
                % 填充曲线区域，使用贝塞尔曲线的正确语法
                \fill[thirdcolor] (225:4cm)..controls (225:5.2cm)..(228:4cm);
                \fill[thirdcolor] (312:4cm)..controls (315:5.2cm)..(318:4cm);
        \end{tikzpicture}
            };
        \end{tikzpicture}
    \end{titlepage}
    \clearpage}

    \pagestyle{fancy} % 启用自定义页眉

    % 清除当前的页眉和页脚设置
    \fancyhf{}

    % 设置页眉内容
    \fancyhead[L]{\color{themeColor} \fontsize{10pt}{0}{\textbf{\mathbook@value@Lhead}}}
    \fancyhead[C]{\color{themeColor} \fontsize{10pt}{0}{\textbf{\mathbook@value@Chead}} }
    \fancyhead[R]{\color{themeColor} \fontsize{10pt}{0}{\textbf{\mathbook@value@Rhead}} }

    % 设置页码位置
    \fancyfoot[C]{\color{themeColor}第 \thepage 页  / 共 \color{themeColor}\pageref{LastPage} 页 }
    
    \renewcommand{\chaptermark}[1]{\markboth{\thechapter\ #1}{}}  % 双参数对应左右页
    \renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}  % 单参数仅控制右页
    
    \setlength{\parindent}{0pt}  % 取消所有段落首行缩进
    % 设置分隔线
    \renewcommand{\headrulewidth}{0.4pt}
    \renewcommand{\footrulewidth}{0pt}
    
\newcounter{exam}[section]  % 按 section 重置
\setcounter{exam}{0}
\renewcommand{\theexam}{\thesection.\arabic{exam}}  % 编号格式：章节.序号
\newenvironment{example}[1][]{%
    \refstepcounter{exam}%
    \par\addvspace{2pt}%
    \noindent%
    \textbf{\textcolor{black}{例题~\theexam}~#1}%
    \rmfamily\kaishu%
    \ignorespaces%
}{%
    \par\addvspace{2pt}%
    \needspace{6cm}% 检测剩余空间是否足够
    \vspace*{6cm}% 统一改为每题6cm留白
    \ignorespacesafterend%
}
%%%%%%%%%%%%%%定理环境设置%%%%%%%%%%%%%%%%%
\ifusecustomthm
    % 加载必要的宏包
    \RequirePackage[most]{tcolorbox}  % 加载 tcolorbox 宏包，提供高级框线支持
    \tcbuselibrary{theorems,breakable,skins}  % 加载 tcolorbox 的附加功能库，包括定理、可断行框和皮肤支持
    
    % 定义颜色
    \definecolor{main}{RGB}{0,250,154}  % 定义颜色主色（青草绿）
    \definecolor{second}{RGB}{234, 234, 239}  % 定义颜色第二种色（极光灰）
    \definecolor{third}{RGB}{244, 105, 102}  % 定义颜色第三种色（橙色）
    
   % 设置通用样式
\tcbset{
    common/.style={  % 定义通用样式
        lower separated=false,  % 不显示下方分隔线
        coltitle=black,  % 标题文字颜色设置为黑色
        colback=second,  % 背景色使用 second 色（极光灰）
        boxrule=1pt,  % 框线宽度为 1pt
        arc=0pt,  % 设置内角为直角
        outer arc=5pt,  % 设置外角为圆弧角，5pt 为圆弧的半径（可以根据需要调整）
        fonttitle=\songti\bfseries,  % 标题字体为宋体加粗
        fontupper={\kaishu\selectfont}, % 中文楷书
        enhanced,  % 启用增强模式
        breakable,  % 允许框自动断行
        top=8pt,  % 上方内边距为 8pt
        before skip=15pt,  % 在此框之前的垂直间距为15pt
        after skip=15pt,   %在此框之后的垂直间距为15pt
        attach boxed title to top left={  % 将标题框与正文框左上角对齐
            yshift=0pt,  % 标题框相对于正文框向下偏移 2pt
            xshift=0pt},  % 标题框相对于正文框向右偏移 5pt
        boxed title style={  % 定义标题框的样式
            boxrule=0pt,  % 标题框边框宽度为 0pt（无边框）
            colframe=white,  % 标题框边框颜色为白色
            arc=0pt,  % 标题框角为直角
            outer arc=0pt},  % 外角也为直角
        separator sign={\quad},  % 使用 \quad 作为分隔符
        title={#1},  % 定义标题内容（动态替换为传入的标题内容）
        titlerule=0pt,  % 标题和正文之间没有分割线
    },
    mainstyle/.style={  % 定义主风格
        common,  % 继承通用样式
        colframe=main,  % 设置框架颜色为 main 色（青草绿）
        colback=main!5,  % 设置背景色为 main 色的浅色（淡青草绿）
        colbacktitle=main,  % 设置标题背景色为 main 色（青草绿）
        %overlay unbroken and last={  % 在框的最后添加符号
            %\node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
                %\textcolor{black}{$\clubsuit$}};}% 使用黑色的梅花符号
    },  
    secondstyle/.style={  % 定义第二风格
        common,  % 继承通用样式
        colframe=second,  % 设置框架颜色为 second 色（极光灰）
        colback=second!5,  % 设置背景色为 second 色的浅色（淡极光灰）
        colbacktitle=second,  % 设置标题背景色为 second 色（极光灰）
        %overlay unbroken and last={  % 在框的最后添加符号
            %\node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
                %\textcolor{second}{$\heartsuit$}};} % 使用 second 色的红桃符号
    }  
}

% 使用 tcolorbox 的 newtcbtheorem 来定义定理环境
\newtcbtheorem[auto counter,number within=section]{definitionaux}{定义}{mainstyle}{def}  % 定义带有编号的“定义”环境，使用 mainstyle 风格
\newtcbtheorem[auto counter,number within=section]{theoremaux}{定理}{mainstyle}{thm}  % 定义带有编号的“定理”环境，使用 mainstyle 风格
\newtcbtheorem[auto counter,number within=section]{propositionaux}{命题}{secondstyle}{prop}  % 定义带有编号的“命题”环境，使用 secondstyle 风格
\newtcbtheorem[auto counter,number within=section]{corollaryaux}{推论}{secondstyle}{cor}  % 定义带有编号的“推论”环境，使用 secondstyle 风格
\newtcbtheorem[auto counter,number within=section]{lemmaaux}{引理}{secondstyle}{lem}  % 定义带有编号的“引理”环境，使用 secondstyle 风格

% 重新定义各类环境，兼容有标题和无标题
\newenvironment{definition}[1][]{
    \if\relax\detokenize{#1}\relax  % 检查标题是否为空
        \definitionaux{}{}  % 无标题时调用 definitionaux 环境
    \else
        \definitionaux{#1}{}  % 有标题时调用 definitionaux 环境并传入标题
    \fi
}{\enddefinitionaux}

\newenvironment{proposition}[1][]{
    \if\relax\detokenize{#1}\relax  % 检查标题是否为空
        \propositionaux{}{}  % 无标题时调用 propositionaux 环境
    \else
        \propositionaux{#1}{}  % 有标题时调用 propositionaux 环境并传入标题
    \fi
}{\endpropositionaux}

\newenvironment{corollary}[1][]{
    \if\relax\detokenize{#1}\relax  % 检查标题是否为空
        \corollaryaux{}{}  % 无标题时调用 corollaryaux 环境
    \else
        \corollaryaux{#1}{}  % 有标题时调用 corollaryaux 环境并传入标题
    \fi
}{\endcorollaryaux}

\newenvironment{theorem}[1][]{
    \if\relax\detokenize{#1}\relax  % 检查标题是否为空
        \theoremaux{}{}  % 无标题时调用 theoremaux 环境
    \else
        \theoremaux{#1}{}  % 有标题时调用 theoremaux 环境并传入标题
    \fi
}{\endtheoremaux}

\newenvironment{lemma}[1][]{
    \if\relax\detokenize{#1}\relax  % 检查标题是否为空
        \lemmaaux{}{}  % 无标题时调用 lemmaaux 环境
    \else
        \lemmaaux{#1}{}  % 有标题时调用 lemmaaux 环境并传入标题
    \fi
}{\endlemmaaux}
\else

% 定理环境样式设置（保持您的原有样式）
\providecommand{\kaishu}{\normalfont}
\newtheoremstyle{defstyle}{3pt}{3pt}{\kaishu}{0pt}{\bfseries\color{black}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
\newtheoremstyle{thmstyle}{3pt}{3pt}{\kaishu}{0pt}{\bfseries\color{black}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
\newtheoremstyle{prostyle}{3pt}{3pt}{\kaishu}{0pt}{\bfseries\color{black}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}

% 定理类环境统一处理
\newcommand{\thmenvfooter}{%
    \par\addvspace{2pt}%
    \needspace{6cm}% 检测剩余空间
    \vspace*{6cm}% 固定6cm留白
}

% 定义各环境（自动添加留白）
\theoremstyle{thmstyle}
\newtheorem{theorem}{定理}[section]
\let\oldendtheorem\endtheorem
\renewcommand{\endtheorem}{\thmenvfooter\oldendtheorem}

\theoremstyle{defstyle}
\newtheorem{definition}{定义}[section]
\let\oldenddefinition\enddefinition
\renewcommand{\enddefinition}{\thmenvfooter\oldenddefinition}

\theoremstyle{prostyle}
\newtheorem{lemma}{引理}[section]
\let\oldendlemma\endlemma
\renewcommand{\endlemma}{\thmenvfooter\oldendlemma}

\newtheorem{corollary}{推论}[section]
\let\oldendcorollary\endcorollary
\renewcommand{\endcorollary}{\thmenvfooter\oldendcorollary}

\newtheorem{proposition}{命题}[section]
\let\oldendproposition\endproposition
\renewcommand{\endproposition}{\thmenvfooter\oldendproposition}
\fi
\or
%%%%%%%%%%%%%%%%% iPad横版%%%%%%%%%%%%%%%%%%%%%%
    \geometry{paperheight=150mm, paperwidth=200mm,left=12mm,right=12mm,top=10mm,bottom=15mm}
    \renewcommand{\maketitle}{
        \begin{titlepage}
            \begin{tikzpicture}[remember picture, overlay]
                \fill[maincolor] (current page.south west) rectangle (current page.north east);
                \fill[secondcolor] ([yshift=-0.25\paperheight]current page.north west) rectangle ([xshift=-0.25\paperwidth,yshift=-0.20\paperheight]current page.north east);
                \fill[secondcolor] ([xshift=-0.25\paperwidth,yshift=-0.20\paperheight]current page.north east) rectangle (current page.north east);
                \foreach \x in {-0.25,-0.27,-0.29,...,-0.97}
                \fill[secondcolor] ([yshift=\x\paperheight]current page.north east) rectangle ++(-0.25\paperwidth,-3mm);
                \fill[themeColor!6.2] ([yshift=0cm]current page.west) rectangle ++(\paperwidth,2cm);
                \node[anchor=west, align=left, text width=\textwidth, inner sep=0] at ([yshift=-1cm, xshift=1cm]current page.west) {\fontsize{32pt}{0}{\textbf{\kaishu \mathbook@value@Title}}};
                \node[anchor=west, align=left, text width=\textwidth, inner sep=0] at ([yshift=-2.5cm, xshift=1cm]current page.west) {\fontsize{28pt}{0}{\textbf{\mathbook@value@Subtitle}}};
                \fill[themeColor!6.2] (current page.south west) rectangle ++(\paperwidth,2cm);
                \node[anchor=south, align=center] at ([yshift=0.8cm]current page.south) {\color{themeColor}\fontsize{16pt}{0}{\mathbook@value@Creator}};
                \node[anchor=south, align=center] at ([yshift=0.2cm]current page.south) {\color{themeColor}\fontsize{12pt}{0}{\mathbook@value@UpdateTime}};
    
                \node[anchor=south, align=center] at ([yshift=8cm,xshift=7.3cm]current page.south west) {\color{themeColor}\fontsize{12pt}{0}{\mathbook@value@motto}};
    
                \fill[themeColor!6.2, rounded corners=12pt] ([yshift=8cm, xshift=15.5cm]current page.south west) rectangle ++(3.5cm,1.5cm);
                \node[anchor=south, align=center] at ([yshift=8cm, xshift=17.3cm]current page.south west) {\color{themeColor}\fontsize{16pt}{0}\textbf{\mathbook@value@TypeTwo}};
                \node[] at ([shift={(-0.12\paperwidth,0.3\paperheight)}]current page.south east) {
                  \begin{tikzpicture}
                    % 填充一个圆形
                    \fill[fill=thirdcolor] (0,0) circle (2cm);
                    % 绘制一个较粗的圆形
                    \draw[line width=10pt] (0,0) circle (1.8cm);
                    % 绘制从内圆到外圆的径向线条
                    \foreach \x in {0,30,...,360}
                    {
                      \draw[line width=1pt] (\x:1.8cm) -- (\x:2cm);
                    }
                    % 在四个方向绘制较粗的线段
                    \foreach \x in {0,90,180,270}
                    {
                    \draw [line width=10pt] (0,0)++(\x:1.5cm) -- ++(\x:0.3cm);
                    }
                    % 绘制更多的径向线条
                    \foreach \x in {0,30,...,360}
                    {
                      \draw[] (\x:1.6cm)--++(\x:0.2cm);
                    }
                    % 放置节点
                    \node[scale=1] at (0,1.05) {$\lim_{}$};
                    \node[scale=1] at (0,-1.05) {$\sum_{}$};
                    \node[scale=1] at (1.05,0) {$\infty$};
                    \node[scale=1] at (-1.05,0) {$\int$};
                 \end{tikzpicture}};
            \end{tikzpicture}
        \end{titlepage}
        
    
}
       \pagestyle{fancy}
       \fancyhf{} % 清空当前设置
   
       \renewcommand{\headrulewidth}{0pt} % 移除页眉底部的横线
       \renewcommand{\footrulewidth}{0pt} % 页面底部横线 \faWeixin{}
       \newcommand{\myrecttext}{\fontsize{14}{0} \textbf{\mathbook@value@Chead \mathbook@value@Rhead}}  %\mathbook@value@LheadC
       \newcommand{\myrecttextolus}{\fontsize{14}{0}\heiti \leftmark}
       \newcommand{\myrecttexttwo}{\fontsize{8pt}{0}{\textbf{  \kaishu  \truncate{4cm}{\leftmark}}}}
       \newcommand{\myrecttextthree}{\fontsize{8pt}{0}{\textbf{ \kaishu \truncate{4cm}{\rightmark}}}}
       \renewcommand{\chaptermark}[1]{\markboth{\thechapter #1}{}}
       \renewcommand{\sectionmark}[1]{\markright{\thesection #1}{}}
       \setlength{\parindent}{0pt}  % 取消所有段落首行缩进
      
   
       % 在每页的页眉位置添加矩形
       \chead{
       \begin{tikzpicture}[remember picture,overlay]
           \fill[themeColor] (current page.north west) rectangle ++(0.668\paperwidth,-0.8cm);
           \node[anchor=north west, text width=\paperwidth, text height=0.4cm, align=left] at ([xshift=0.0em]current page.north west) {%
           \textcolor{white}{\myrecttext}
           };
           
           \fill[themeColor!6.2] ([xshift=-0.332\paperwidth]current page.north east) rectangle ++(0.23\paperwidth,-0.8cm);
           \node[anchor=north west, text width=\paperwidth, text height=0.16cm, align=left, font=\bfseries] at ([xshift=0.66\paperwidth]current page.north west) {%
           \textcolor{themeColor}{\myrecttexttwo}
           };
           \node[anchor=north west, text width=\paperwidth, text height=0.52cm, align=left, font=\bfseries] at ([xshift=0.66\paperwidth]current page.north west) {%
           \textcolor{themeColor}{\myrecttextthree}
           };
   
           \fill[themeColor] ([xshift=-0.115\paperwidth]current page.north east) rectangle ++(0.027\paperwidth,-0.8cm);
           \node[anchor=east, text=white, text height=1.2cm] at (current page.north east) {};
   
           \fill[themeColor!60] ([xshift=-0.075\paperwidth]current page.north east) rectangle ++(0.027\paperwidth,-0.8cm);
           \node[anchor=east, text=white, text height=1.2cm] at (current page.north east) {};
   
           \fill[themeColor!20] ([xshift=-0.024\paperwidth]current page.north east) rectangle ++(0.027\paperwidth,-0.8cm);
           \node[anchor=east, text=white, text height=1.2cm] at (current page.north east) {};
   
           \draw[line width=1.5pt, color=themeColor] (current page.north west) ++(0,-0.8cm) -- ++(\paperwidth,0);
   
           \node[anchor=east, text height=1.2cm, font=\small] at ([xshift=-8.5cm, yshift=1.5cm]current page.south east) {第 \thepage 页  / 共 \pageref{LastPage} 页};
       \end{tikzpicture}
}
\newcounter{exam}[section]  % 按 section 重置
\setcounter{exam}{0}
\renewcommand{\theexam}{\thesection.\arabic{exam}}  % 编号格式：章节.序号
\newenvironment{example}[1][]{%
    \refstepcounter{exam}% 计数器递增
    \par\addvspace{2pt}% 环境前添加 10pt 垂直间距
    \noindent%
    \textbf{\textcolor{black}{例题~\theexam}~#1}% 标题格式
    \rmfamily\kaishu% 正文字体：罗马体 + 楷书
    \ignorespaces% 忽略后续空格
}{%
    \par\addvspace{2pt}% 环境后添加 2pt 垂直间距
    \clearpage% 在环境结束后换页[3,6](@ref)
    \ignorespacesafterend%
}
%%%%%%%%%%%%%%定理环境设置%%%%%%%%%%%%%%%%%
\ifusecustomthm
    % 加载必要的宏包
    \RequirePackage[most]{tcolorbox}  % 加载 tcolorbox 宏包，提供高级框线支持
    \tcbuselibrary{theorems,breakable,skins}  % 加载 tcolorbox 的附加功能库，包括定理、可断行框和皮肤支持
    
    % 定义颜色
    \definecolor{main}{RGB}{0,250,154}  % 定义颜色主色（青草绿）
    \definecolor{second}{RGB}{234, 234, 239}  % 定义颜色第二种色（极光灰）
    \definecolor{third}{RGB}{244, 105, 102}  % 定义颜色第三种色（橙色）
    
   % 设置通用样式
\tcbset{
    common/.style={  % 定义通用样式
        lower separated=false,  % 不显示下方分隔线
        coltitle=black,  % 标题文字颜色设置为黑色
        colback=second,  % 背景色使用 second 色（极光灰）
        boxrule=1pt,  % 框线宽度为 1pt
        arc=0pt,  % 设置内角为直角
        outer arc=5pt,  % 设置外角为圆弧角，5pt 为圆弧的半径（可以根据需要调整）
        fonttitle=\songti\bfseries,  % 标题字体为宋体加粗
        fontupper={\kaishu\selectfont}, % 中文楷书
        enhanced,  % 启用增强模式
        breakable,  % 允许框自动断行
        top=8pt,  % 上方内边距为 8pt
        before skip=15pt,  % 在此框之前的垂直间距为15pt
        after skip=15pt,   %在此框之后的垂直间距为15pt
        attach boxed title to top left={  % 将标题框与正文框左上角对齐
            yshift=0pt,  % 标题框相对于正文框向下偏移 2pt
            xshift=0pt},  % 标题框相对于正文框向右偏移 5pt
        boxed title style={  % 定义标题框的样式
            boxrule=0pt,  % 标题框边框宽度为 0pt（无边框）
            colframe=white,  % 标题框边框颜色为白色
            arc=0pt,  % 标题框角为直角
            outer arc=0pt},  % 外角也为直角
        separator sign={\quad},  % 使用 \quad 作为分隔符
        title={#1},  % 定义标题内容（动态替换为传入的标题内容）
        titlerule=0pt,  % 标题和正文之间没有分割线
    },
    mainstyle/.style={  % 定义主风格
        common,  % 继承通用样式
        colframe=main,  % 设置框架颜色为 main 色（青草绿）
        colback=main!5,  % 设置背景色为 main 色的浅色（淡青草绿）
        colbacktitle=main,  % 设置标题背景色为 main 色（青草绿）
        %overlay unbroken and last={  % 在框的最后添加符号
            %\node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
                %\textcolor{black}{$\clubsuit$}};}% 使用黑色的梅花符号
    },  
    secondstyle/.style={  % 定义第二风格
        common,  % 继承通用样式
        colframe=second,  % 设置框架颜色为 second 色（极光灰）
        colback=second!5,  % 设置背景色为 second 色的浅色（淡极光灰）
        colbacktitle=second,  % 设置标题背景色为 second 色（极光灰）
        %overlay unbroken and last={  % 在框的最后添加符号
            %\node[anchor=south east, outer sep=0pt] at (\linewidth-width,0) {
                %\textcolor{second}{$\heartsuit$}};} % 使用 second 色的红桃符号
    }  
}

% 使用 tcolorbox 的 newtcbtheorem 来定义定理环境
\newtcbtheorem[auto counter,number within=section]{definitionaux}{定义}{mainstyle}{def}  % 定义带有编号的“定义”环境，使用 mainstyle 风格
\newtcbtheorem[auto counter,number within=section]{theoremaux}{定理}{mainstyle}{thm}  % 定义带有编号的“定理”环境，使用 mainstyle 风格
\newtcbtheorem[auto counter,number within=section]{propositionaux}{命题}{secondstyle}{prop}  % 定义带有编号的“命题”环境，使用 secondstyle 风格
\newtcbtheorem[auto counter,number within=section]{corollaryaux}{推论}{secondstyle}{cor}  % 定义带有编号的“推论”环境，使用 secondstyle 风格
\newtcbtheorem[auto counter,number within=section]{lemmaaux}{引理}{secondstyle}{lem}  % 定义带有编号的“引理”环境，使用 secondstyle 风格

% 重新定义各类环境，兼容有标题和无标题
\newenvironment{definition}[1][]{
    \if\relax\detokenize{#1}\relax  % 检查标题是否为空
        \definitionaux{}{}  % 无标题时调用 definitionaux 环境
    \else
        \definitionaux{#1}{}  % 有标题时调用 definitionaux 环境并传入标题
    \fi
}{\enddefinitionaux}

\newenvironment{proposition}[1][]{
    \if\relax\detokenize{#1}\relax  % 检查标题是否为空
        \propositionaux{}{}  % 无标题时调用 propositionaux 环境
    \else
        \propositionaux{#1}{}  % 有标题时调用 propositionaux 环境并传入标题
    \fi
}{\endpropositionaux}

\newenvironment{corollary}[1][]{
    \if\relax\detokenize{#1}\relax  % 检查标题是否为空
        \corollaryaux{}{}  % 无标题时调用 corollaryaux 环境
    \else
        \corollaryaux{#1}{}  % 有标题时调用 corollaryaux 环境并传入标题
    \fi
}{\endcorollaryaux}

\newenvironment{theorem}[1][]{
    \if\relax\detokenize{#1}\relax  % 检查标题是否为空
        \theoremaux{}{}  % 无标题时调用 theoremaux 环境
    \else
        \theoremaux{#1}{}  % 有标题时调用 theoremaux 环境并传入标题
    \fi
}{\endtheoremaux}

\newenvironment{lemma}[1][]{
    \if\relax\detokenize{#1}\relax  % 检查标题是否为空
        \lemmaaux{}{}  % 无标题时调用 lemmaaux 环境
    \else
        \lemmaaux{#1}{}  % 有标题时调用 lemmaaux 环境并传入标题
    \fi
}{\endlemmaaux}
\else

% 定理环境样式设置（保持原有样式）
\providecommand{\kaishu}{\normalfont}
\newtheoremstyle{defstyle}{3pt}{3pt}{\kaishu}{0pt}{\bfseries\color{black}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
\newtheoremstyle{thmstyle}{3pt}{3pt}{\kaishu}{0pt}{\bfseries\color{black}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
\newtheoremstyle{prostyle}{3pt}{3pt}{\kaishu}{0pt}{\bfseries\color{black}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}

% 定理类环境统一处理（添加自动换页）
\newcommand{\thmenvfooter}{\clearpage} % 使用clearpage确保正确处理浮动体

% 定义各环境（自动添加换页）
\theoremstyle{thmstyle}
\newtheorem{theorem}{定理}[section]
\let\oldendtheorem\endtheorem
\renewcommand{\endtheorem}{\thmenvfooter\oldendtheorem}

\theoremstyle{defstyle}
\newtheorem{definition}{定义}[section]
\let\oldenddefinition\enddefinition
\renewcommand{\enddefinition}{\thmenvfooter\oldenddefinition}

\theoremstyle{prostyle}
\newtheorem{lemma}{引理}[section]
\let\oldendlemma\endlemma
\renewcommand{\endlemma}{\thmenvfooter\oldendlemma}

\newtheorem{corollary}{推论}[section]
\let\oldendcorollary\endcorollary
\renewcommand{\endcorollary}{\thmenvfooter\oldendcorollary}

\newtheorem{proposition}{命题}[section]
\let\oldendproposition\endproposition
\renewcommand{\endproposition}{\thmenvfooter\oldendproposition}
\fi
\fi
%%%%%%%%%%%%%%%章节样式%%%%%%%%%%%%%%%%%%%
\ctexset{
    chapter = {
        format += \centering,
        number = \arabic{chapter},
        beforeskip = 0pt,
        afterskip = 10pt,
        name = {第,章}
    },
    section = {
        number = \arabic{chapter}.\arabic{section},  % 关键修改：阿拉伯数字编号
        format += \centering,     % 默认左对齐（可删除或改为\centering）
        beforeskip = 1.0ex plus 0.2ex minus 0.2ex,  % 推荐弹性间距
        afterskip = 1.0ex plus 0.2ex minus 0.2ex
    },
    subsection = {
        number = \arabic{chapter}.\arabic{section}.\arabic{subsection},  % 关键修改：阿拉伯数字编号
        format += \centering,        % 默认左对齐
        beforeskip = 1.0ex plus 0.2ex minus 0.2ex,
        afterskip = 1.0ex plus 0.2ex minus 0.2ex
    }
}
%%%%%%%%%%%%%%目录设置%%%%%%%%%%%%%%
\renewcommand{\contentsname}{\zihao{2}\bfseries\centering\kaishu 目\hspace{2em}录} % 修改目录标题字体格式为二号字、加粗、居中、楷书

\setcounter{tocdepth}{2} % 设置目录深度(chapter, section, subsection)
\setcounter{secnumdepth}{3} % 设置编号深度(chapter, section, subsection, subsubsection)

% 重新定义 \tableofcontents 为双栏并使用自定义标题格式和超链接
\makeatletter
\renewenvironment{tableofcontents}{%
  \pagestyle{empty} % 目录页无页眉页脚
  \begin{center}
  {\contentsname}% 显示重新定义后的目录标题
  \end{center}
  \begin{multicols}{2} % 开始双栏
  \@starttoc{toc} % 开始目录
  \end{multicols} % 结束双栏
  \clearpage % 清除空白页
  \pagestyle{fancy} % 恢复页眉页脚
}{}
\makeatother 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcounter{prob}[chapter]
\setcounter{prob}{0}
\renewcommand{\theprob}{\thechapter.\arabic{prob}}
\newenvironment{problem}[1][]{
  \refstepcounter{prob}
  \par\noindent\textbf{\color{black}{问题} \theprob #1 }\rmfamily}{
  \par\ignorespacesafterend
}

% 修改 proof 环境
\renewenvironment{proof}
{
	\par\noindent\textbf{\textcolor{\contentcolor}{证：}} % 设置标题颜色
	\begingroup\color{\contentcolor} % 开始正文颜色范围
}
{
	\endgroup % 结束正文颜色范围
	\hfill \textcolor{\contentcolor}{$\square$} \par
}

% 修改 solution 环境
\newenvironment{solution}
{%
	\par\noindent\textbf{\textcolor{\contentcolor}{解答：}} % 标题不换行
	\begingroup\color{\contentcolor} % 开始正文颜色
	\ignorespaces % 忽略后续空格，防止意外换行
}
{%
	\endgroup % 结束颜色范围
	\hfill\textcolor{\contentcolor}{$\square$}\par
}

\newenvironment{remark}{{\par\noindent\textbf{注：}}}%{\hfill $\lozenge$\par}

\newenvironment{property}{\par\noindent\textbf{\color{black}\bfseries 性质：} }{\par}

\newenvironment{introduction}[1][\centering\bfseries 内容提要]{
  \begin{tcolorbox}[colframe=second, colback=white, coltitle=black, title={#1}]
    \begin{multicols}{2}
      \begin{itemize}[label=\textcolor{black}{\upshape\scriptsize$\square$}]
}{ % 环境结束部分
    \end{itemize}
  \end{multicols}
  \end{tcolorbox}
}
\counterwithin{equation}{section}
\renewcommand{\theequation}{\thesection.\arabic{equation}}

%%%%%%%%%%%%%%%%列表环境%%%%%%%%%%%%%%%
\RequirePackage{graphics}
\RequirePackage{enumitem}

\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}
\usetikzlibrary{backgrounds,calc,shadows,positioning,fit}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt] (char) {#1};}}

\newcommand*{\eitemi}{\tikz \draw [baseline, ball color=black,draw=none] circle (2pt);}
\newcommand*{\eitemii}{\tikz \draw [baseline, fill=black,draw=none,circular drop shadow] circle (2pt);}
\newcommand*{\eitemiii}{\tikz \draw [baseline, fill=black,draw=none] circle (2pt);}
\setlist[enumerate,1]{label=\color{black}\arabic*., topsep=0pt, itemsep=0pt, parsep=0pt}
\setlist[enumerate,2]{label=\color{black}(\arabic*), topsep=0pt, itemsep=0pt, parsep=0pt}
\setlist[enumerate,3]{label=\color{black}(\alph*), topsep=0pt, itemsep=0pt, parsep=0pt}
\setlist[enumerate,4]{label=\color{black}(\Roman*), topsep=0pt, itemsep=0pt, parsep=0pt}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}

% 选择题选项自动排版参考了 BHCexam.cls 的实现
\makeatletter
\newlength{\choicelengtha}
\newlength{\choicelengthb}
\newlength{\choicelengthc}
\newlength{\choicelengthd}
\newlength{\maxlength}

\def\@optprefix{}
\def\@optsuffix{.}

\newcommand{\fourchoices}[4]{
    \par
    \settowidth{\choicelengtha}{\@optprefix A\@optsuffix~#1~~~}
    \settowidth{\choicelengthb}{\@optprefix B\@optsuffix~#2~~~}
    \settowidth{\choicelengthc}{\@optprefix C\@optsuffix~#3~~~}
    \settowidth{\choicelengthd}{\@optprefix D\@optsuffix~#4~~~}
    \setlength{\maxlength}{\choicelengtha}
    \ifdim\choicelengthb>\maxlength \setlength{\maxlength}{\choicelengthb}\fi
    \ifdim\choicelengthc>\maxlength \setlength{\maxlength}{\choicelengthc}\fi
    \ifdim\choicelengthd>\maxlength \setlength{\maxlength}{\choicelengthd}\fi
    
    \ifdim\maxlength>0.4\linewidth
        \begin{tabularx}{\linewidth}{X}
            \@optprefix A\@optsuffix~#1~~~\\
            \@optprefix B\@optsuffix~#2~~~\\
            \@optprefix C\@optsuffix~#3~~~\\
            \@optprefix D\@optsuffix~#4~~~
        \end{tabularx}
    \else
        \ifdim\maxlength>0.2\linewidth
            \begin{tabularx}{\linewidth}{XX}
                \@optprefix A\@optsuffix~#1~~~ & \@optprefix B\@optsuffix~#2~~~\\
                \@optprefix C\@optsuffix~#3~~~ & \@optprefix D\@optsuffix~#4~~~
            \end{tabularx}
        \else
            \begin{tabularx}{\linewidth}{XXXX}
                \@optprefix A\@optsuffix~#1~~~ & \@optprefix B\@optsuffix~#2~~~ & 
                \@optprefix C\@optsuffix~#3~~~ & \@optprefix D\@optsuffix~#4~~~
            \end{tabularx}
        \fi
    \fi
    \unskip
}
\makeatother
%%%%%%%%%%%%%%%%%%%数学符号重定义%%%%%%%%%%%%%%%%
%定义数学符号风格
\let\oldlim\lim
\let\oldvarlimsup\varlimsup
\let\oldvarliminf\varliminf
\let\oldsum\sum
\let\oldint\int
\let\oldoint\oint
\let\oldoiint\oiint
\let\oldiint\iint
\let\oldiiint\iiint
\let\oldprod\prod
\let\oldsup\sup
\let\oldinf\inf
\let\oldfrac\frac
\let\oldmax\max
\let\oldmin\min

% 重新定义这些命令以便它们总是以 display 模式显示
\renewcommand{\lim}{\displaystyle\oldlim}
\renewcommand{\varlimsup}{\displaystyle\oldvarlimsup}
\renewcommand{\varliminf}{\displaystyle\oldvarliminf}
\renewcommand{\sum}{\displaystyle\oldsum}
\renewcommand{\int}{\displaystyle\oldint}
\renewcommand{\oint}{\displaystyle\oldoint}
%\renewcommand{\oiint}{\displaystyle\oldoiint}
\renewcommand{\iint}{\displaystyle\oldiint}
\renewcommand{\iiint}{\displaystyle\oldiiint}
\renewcommand{\prod}{\displaystyle\oldprod}
\renewcommand{\sup}{\displaystyle\oldsup}
\renewcommand{\inf}{\displaystyle\oldinf}
\renewcommand{\frac}{\displaystyle\oldfrac}
\renewcommand{\max}{\displaystyle\oldmax}
\renewcommand{\min}{\displaystyle\oldmin}



\endinput
