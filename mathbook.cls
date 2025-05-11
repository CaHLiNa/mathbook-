% 文件：mathbook.cls
% 版本：2.0
% 作者：Math173SR
% 日期：2025年4月26日
% 描述：这是一个用于数学书籍排版的LaTeX类文件。
% 该类文件提供了数学书籍的基本格式和样式设置。

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mathbook}[2025/04/26  v2.0  mathbook class]

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}

\SetupKeyvalOptions{family=MATHSR, prefix=MATHSR@, setkeys=\kvsetkeys}    % 设置键值选项族MATHSR，所有选项前缀为MATHSR@
\newcommand{\mkv}[1]{\kvsetkeys{MATHSR}{#1}}   % 定义宏\mkv用于设置键值选项，输入\mkv{key=value}等价于\kvsetkeys{MATHSR}{key=value}


%%%%%%%%%%%%%%%%%%%% 页面格式选项 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareStringOption{pageformat}[standard] % 定义字符串选项pageformat，默认值为standard
\DeclareVoidOption{standard}{\mkv{pageformat=standard}} % 定义无参数选项standard，设置pageformat为standard,A4标准版
\DeclareVoidOption{ipadH}{\mkv{pageformat=ipadH}}    % 定义无参数选项ipadH，设置pageformat为standard，ipad横版
\DeclareVoidOption{ipadV}{\mkv{pageformat=ipadV}}    % 定义无参数选项ipadV，设置pageformat为standard，ipad竖版

%%%%%%%%%%%%%%%%%%%% 封面选项 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareStringOption{cover}[coverone] % 定义字符串选项cover，默认值为standard
\DeclareVoidOption{coverone}{\mkv{cover=coverone}} % 定义无参数选项coverone，设置cover为coverone
\DeclareVoidOption{covertwo}{\mkv{cover=covertwo}} % 定义无参数选项covertwo，设置cover为covertwo

%%%%%%%%%%%%%%%%%%%% 字体选项 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareStringOption{fontset}[fandol] % 取消注释
\DeclareVoidOption{fandol}{\PassOptionsToPackage{fontset=fandol}{ctex}}

%%%%%%%%%%%%%%%%%%%% 定理环境选项 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareStringOption{enthm}[fancy] % 定义字符串选项enthm，默认值为plain
\DeclareVoidOption{fancy}{\mkv{enthm=fancy}} % 定义无参数选项fancy，设置enthm为fancy
\DeclareVoidOption{plain}{\mkv{enthm=plain}} %暂时未定义，有好看的自定义环境可以联系我

%%%%%%%%%%%%%%%%%%%%%答案选项%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareStringOption{mode}[answer] 
\DeclareVoidOption{answer}{\mkv{mode=answer}} 
\DeclareVoidOption{noanswer}{\mkv{mode=noanswer}} 

%%%%%%%%%%%%%%%%%%%%%%%%留白选项%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareStringOption[blank]{space}
\DeclareVoidOption{blank}{\mkv{space=blank}}
\DeclareVoidOption{noblank}{\mkv{space=noblank}}


% 加载基础类
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass{book}

\RequirePackage[fontset=fandol,punct=kaiming,zihao=-4,heading=true]{ctex} % Replace \@fontset with a valid fontset, e.g., fandol
%punct=kaiming 标点占半个字符宽度，避免出现在行首
%zihao=-4 字号小四
\RequirePackage{setspace} %行距
\RequirePackage{csquotes} %智能引号
\RequirePackage{fontspec} % 字体设置
\RequirePackage{tabularx, ifthen} % 排选项用
\RequirePackage{xcolor,graphicx,caption} % 彩色、图片、图释
\RequirePackage{geometry,fancyhdr} % 纸张、边距、页眉、页脚
\RequirePackage{amsmath,amssymb,amsthm} % ams数学相关
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
\RequirePackage{afterpage} 
\RequirePackage{zhnumber} 
\RequirePackage{lastpage} 
\RequirePackage{titling} 
\RequirePackage{adjustbox} 
\RequirePackage{fontawesome5} 
\RequirePackage{multicol} 
\RequirePackage{bm} 
\RequirePackage{pgffor}    % 用于循环
\RequirePackage{pgfmath} % 导入随机数生成包
\RequirePackage{truncate}
\RequirePackage{pgfkeys}
\RequirePackage{zref-abspage}    % 绝对页面定位
\RequirePackage{calc}            % 长度计算
\RequirePackage{needspace}% 添加空间检测宏包
\RequirePackage{microtype}  % 优化字体
\usetikzlibrary{shapes.geometric,decorations.pathmorphing,positioning,calc,fadings}
\RequirePackage{xcolor} 
\RequirePackage{hyperref}
\RequirePackage{truncate}
\RequirePackage{comment}
\RequirePackage{xeCJK}
\RequirePackage[most]{tcolorbox}  % 加载 tcolorbox 宏包，提供高级框线支持
\tcbuselibrary{theorems,breakable,skins}  % 加载 tcolorbox 的附加功能库，包括定理、可断行框和皮肤支持

%%%%%%%%%%%%%%%equation环境编号%%%%%%%%%%%%%%%
\counterwithin{equation}{section}
\renewcommand{\theequation}{\thesection.\arabic{equation}}

\setstretch{1.618} % 精确控制行距系数
% ===================== 封面参数 =====================
\def\MATHSR@Pretitle{此处填写预标题}
\def\MATHSR@title{\heiti 此处填写主标题}
\def\MATHSR@subtitle{\textbf{此处填写副标题}}
\def\MATHSR@Type{\textbf{纸张版本}}
\def\MATHSR@motto{Success in mathematics requires dedication and perseverance}
\def\MATHSR@Creator{\textbf{Math173SR}}
\def\MATHSR@UpdateTime{\textbf{最后更新时间：\today}}
\def\MATHSR@Lhead{\leftmark}
\def\MATHSR@Chead{}
\def\MATHSR@Rhead{\rightmark}
\def\MATHSR@LheadC{Math173SR}
% 在类文件中添加标准命令映射
\renewcommand{\title}[1]{\Title{#1}}
\renewcommand{\author}[1]{\Creator{#1}}
\renewcommand{\date}[1]{\UpdateTime{#1}}
% ===================== 参数设置接口 =====================
\newcommand\Pretitle[1]{\def\MATHSR@Pretitle{\textbf{#1}}}     % 预标题设置命令
\renewcommand\title[1]{\def\MATHSR@title{\heiti \textbf{#1}}}    % 主标题设置命令
\newcommand\subtitle[1]{\def\MATHSR@subtitle{\textbf{#1}}}    % 副标题设置命令
\newcommand\Type[1]{\def\MATHSR@Type{\textbf{#1}}}      % 版本类型设置
\newcommand\motto[1]{\def\MATHSR@motto{\itshape #1}}         % 格言设置命令
\newcommand\Creator[1]{\def\MATHSR@Creator{\textbf{#1}}}      % 创建者设置命令
\newcommand\UpdateTime[1]{\def\MATHSR@UpdateTime{\textbf{最后更新时间：#1}}} % 更新时间
\newcommand\Lhead[1]{\def\MATHSR@Lhead{\textbf{#1}}}         % 左页眉设置命令
\newcommand\Chead[1]{\def\MATHSR@Chead{\textbf{#1}}}         % 中页眉设置命令
\newcommand\Rhead[1]{\def\MATHSR@Rhead{\textbf{#1}}}          % 右页眉设置命令
\newcommand\LheadC[1]{\def\MATHSR@LheadC{\textbf{#1}}}       % 定制左页眉内容

\hypersetup {colorlinks=true,linkcolor=black, urlcolor=maincolor, citecolor=red,pdfencoding=auto}

%%%%%%%%%%%%%%%%%%%%全局颜色设置
\definecolor{winered}{RGB}{128, 0, 32}



\ifdefstring{\MATHSR@pageformat}{standard}{
\Type{A4标准版}
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
    \pagestyle{fancy} % 启用自定义页眉
    % 清除当前的页眉和页脚设置
    \fancyhf{}
    % 设置页眉内容
    \fancyhead[L]{\color{black} \fontsize{10pt}{0}{\textbf{\MATHSR@Lhead}}}
    \fancyhead[C]{\color{black} \fontsize{10pt}{0}{\textbf{\MATHSR@Chead}}}
    \fancyhead[R]{\color{black} \fontsize{10pt}{0}{\textbf{\MATHSR@Rhead}}}
    % 设置页码位置
    \fancyfoot[C]{第 \thepage 页  / 共 \pageref{LastPage} 页 }
    \setlength{\parindent}{0pt}  % 取消所有段落首行缩进
 \ifdefstring{\MATHSR@enthm}{fancy}{
  \ifdefstring{\MATHSR@space}{blank}{
\newtheoremstyle{thmstyle}{3pt}{3pt}{\kaishu}{0pt}{\bfseries\color{black}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
\newcommand{\thmenvfooter}{%
    \par\addvspace{2pt}%
    \needspace{6cm}% 检测剩余空间
    \vspace*{6cm}% 固定6cm留白
}
\theoremstyle{thmstyle}
\newtheorem{theorem}{定理}[section]
\let\oldendtheorem\endtheorem
\renewcommand{\endtheorem}{\thmenvfooter\oldendtheorem}

\newtheorem{definition}{定义}[section]
\let\oldenddefinition\enddefinition
\renewcommand{\enddefinition}{\thmenvfooter\oldenddefinition}

\newtheorem{lemma}{引理}[section]
\let\oldendlemma\endlemma
\renewcommand{\endlemma}{\thmenvfooter\oldendlemma}

\newtheorem{corollary}{推论}[section]
\let\oldendcorollary\endcorollary
\renewcommand{\endcorollary}{\thmenvfooter\oldendcorollary}

\newtheorem{proposition}{命题}[section]
\let\oldendproposition\endproposition
\renewcommand{\endproposition}{\thmenvfooter\oldendproposition}
\newcounter{exam}[section]  % 按 section 重置
\setcounter{exam}{0}
\renewcommand{\theexam}{\thesection.\arabic{exam}}  % 编号格式：章节.序号
\newenvironment{example}[1][]{%
    \refstepcounter{exam}% 计数器递增
    \par\addvspace{0pt}% 环境前添加 10pt 垂直间距
    \noindent%
    \textbf{\textcolor{black}{例题~\theexam}~#1}% 标题格式
    \rmfamily\kaishu% 正文字体：罗马体 + 楷书
    \ignorespaces% 忽略后续空格
}{%
    \par\addvspace{0pt}% 环境后添加 2pt 垂直间距
    \needspace{6cm}% 检测剩余空间是否足够
    \vspace*{6cm}% 统一改为每题7cm留白
    \ignorespacesafterend%
}
\newcounter{prob}[subsection]  % 按 section 重置
\setcounter{prob}{0}
\renewcommand{\theprob}{\arabic{prob}.}  % 编号格式：章节.序号
\newenvironment{problem}[1][]{%
    \refstepcounter{prob}%
    \par\addvspace{0pt}%
    \noindent%
    \textbf{\textcolor{black}{\theprob}~#1}%
    \rmfamily\kaishu%
    \ignorespaces%
}{%
    \par\addvspace{0pt}%
    \needspace{6cm}% 检测剩余空间是否足够
    \vspace*{6cm}% 统一改为每题7cm留白
    \ignorespacesafterend%
}

\newcounter{enumcounter} % 自定义计数器
\preto{\enumerate}{% 在 enumerate 环境开始时初始化计数器
  \setcounter{enumcounter}{0}%
  \let\olditem\item
  \renewcommand{\item}{%
    \stepcounter{enumcounter}%
    \ifnum\value{enumcounter}>1\relax
      \needspace{6cm}
      \vspace*{6cm}
    \fi
    \olditem % 调用原始 item 命令
  }%
}
\appto{\endenumerate}{\setcounter{enumcounter}{0}} % 环境结束时重置计数器
}{\relax}
 }{\relax}
 \ifdefstring{\MATHSR@enthm}{plain}{
  \ifdefstring{\MATHSR@space}{blank}{
\definecolor{defcolor}{RGB}{0,154,84}
\definecolor{thmcolor}{RGB}{0,104,191} 
\definecolor{procolor}{RGB}{56,129,93}
\definecolor{corcolor}{RGB}{120,81,169}
\definecolor{sblue}{RGB}{240,243,250}

% ======== 导言区配置 ========
% 定义计数器
\newcounter{theorem}  
\newcounter{definition}
\newcounter{corollary}
\newcounter{proposition}
\newcounter{example}

% 设置按节编号
\numberwithin{theorem}{section}
\numberwithin{definition}{section}
\numberwithin{corollary}{section}
\numberwithin{proposition}{section}
\numberwithin{example}{section}

% ======== 定理环境 ========
\newtcolorbox[use counter=theorem]{theorem}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue, 
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{thmcolor},
  before upper = {\parindent 0pt\tcblower}, 
  after={\needspace{6cm}\vspace*{6cm}},
  overlay = {
    \node[anchor=north west, thmcolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {定理~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 定义环境 ========
\newtcolorbox[use counter=definition]{definition}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{defcolor},
  before upper = {\parindent 0pt\tcblower},
  overlay = {
    \node[anchor=north west, defcolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {定义~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 推论环境 ========
\newtcolorbox[use counter=corollary]{corollary}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{corcolor},
  before upper = {\parindent 0pt\tcblower},
  after={\needspace{6cm}\vspace*{6cm}},
  overlay = {
    \node[anchor=north west, corcolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {推论~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 命题环境 ========
\newtcolorbox[use counter=proposition]{proposition}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{procolor},
  before upper = {\parindent 0pt\tcblower},
  after={\needspace{6cm}\vspace*{6cm}},
  overlay = {
    \node[anchor=north west, procolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {命题~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 例题环境 ========
\newtcolorbox[use counter=example]{example}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{thmcolor},
  before upper = {\parindent 0pt\tcblower},
  after={\needspace{6cm}\vspace*{6cm}},
  overlay = {
    \node[anchor=north west, thmcolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {例题~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}%每个环境结束后换页

}{\relax}
 }{\relax}
 }{\relax}

\ifdefstring{\MATHSR@pageformat}{ipadH}{
  \geometry{
    paperheight=150mm, 
    paperwidth=200mm,
    left=12mm,
    right=12mm,
    top=10mm,
    bottom=15mm,
    headheight=15pt, % 页眉高度
    headsep=0.5cm, % 页眉与正文的距离
    footskip=1cm % 页脚与正文的距离
    }
    \pagestyle{fancy}
    \fancyhf{} % 清空当前设置
   
    \renewcommand{\headrulewidth}{0pt} % 移除页眉底部的横线
    \renewcommand{\footrulewidth}{0pt} % 页面底部横线 \faWeixin{}
    \newcommand{\myrecttext}{\fontsize{14}{0} \textbf{\MATHSR@Rhead}} 
    \newcommand{\myrecttextolus}{\fontsize{14}{0}\heiti \MATHSR@Lhead}
    \newcommand{\myrecttexttwo}{\fontsize{8pt}{0}{\textbf{  \kaishu  \truncate{4cm}{\leftmark}}}}
    \newcommand{\myrecttextthree}{\fontsize{8pt}{0}{\textbf{ \kaishu \truncate{4cm}{\rightmark}}}}
    \renewcommand{\chaptermark}[1]{\markboth{\thechapter #1}{}}
    \renewcommand{\sectionmark}[1]{\markright{\thesection #1}{}}
    \setlength{\parindent}{0pt}  % 取消所有段落首行缩进
    \definecolor{padcolor}{RGB}{88,169,223} %页眉方框色
    % 在每页的页眉位置添加矩形
    \chead{
    \begin{tikzpicture}[remember picture,overlay]
           \fill[padcolor] (current page.north west) rectangle ++(0.668\paperwidth,-0.8cm);
           \node[anchor=north west, text width=\paperwidth, text height=0.4cm, align=left] at ([xshift=0.0em]current page.north west) {%
           \textcolor{white}{\myrecttext}
           };
           
           \fill[padcolor!6.2] ([xshift=-0.332\paperwidth]current page.north east) rectangle ++(0.23\paperwidth,-0.8cm);
           \node[anchor=north west, text width=\paperwidth, text height=0.16cm, align=left, font=\bfseries] at ([xshift=0.66\paperwidth]current page.north west) {%
           \textcolor{padcolor}{\myrecttexttwo}
           };
           \node[anchor=north west, text width=\paperwidth, text height=0.52cm, align=left, font=\bfseries] at ([xshift=0.66\paperwidth]current page.north west) {%
           \textcolor{padcolor}{\myrecttextthree}
           };
   
           \fill[padcolor] ([xshift=-0.115\paperwidth]current page.north east) rectangle ++(0.027\paperwidth,-0.8cm);
           \node[anchor=east, text=white, text height=1.2cm] at (current page.north east) {};
   
           \fill[padcolor!60] ([xshift=-0.075\paperwidth]current page.north east) rectangle ++(0.027\paperwidth,-0.8cm);
           \node[anchor=east, text=white, text height=1.2cm] at (current page.north east) {};
   
           \fill[padcolor!20] ([xshift=-0.024\paperwidth]current page.north east) rectangle ++(0.027\paperwidth,-0.8cm);
           \node[anchor=east, text=white, text height=1.2cm] at (current page.north east) {};
   
           \draw[line width=1.5pt, color=padcolor] (current page.north west) ++(0,-0.8cm) -- ++(\paperwidth,0);
   
           \node[anchor=east, text height=1.2cm, font=\small] at ([xshift=-8.5cm, yshift=1.5cm]current page.south east) {第 \thepage 页  / 共 \pageref{LastPage} 页};
    \end{tikzpicture}
}
\Type{ipad横版}
\ifdefstring{\MATHSR@enthm}{fancy}{
\ifdefstring{\MATHSR@space}{blank}{
\newtheoremstyle{thmstyle}{3pt}{3pt}{\kaishu}{0pt}{\bfseries\color{black}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
\newcommand{\thmenvfooter}{\clearpage} % 使用clearpage确保正确处理浮动体
\theoremstyle{thmstyle}
\newtheorem{theorem}{定理}[section]
\let\oldendtheorem\endtheorem
\renewcommand{\endtheorem}{\thmenvfooter\oldendtheorem}

\newtheorem{definition}{定义}[section]
\let\oldenddefinition\enddefinition
\renewcommand{\enddefinition}{\thmenvfooter\oldenddefinition}

\newtheorem{lemma}{引理}[section]
\let\oldendlemma\endlemma
\renewcommand{\endlemma}{\thmenvfooter\oldendlemma}

\newtheorem{corollary}{推论}[section]
\let\oldendcorollary\endcorollary
\renewcommand{\endcorollary}{\thmenvfooter\oldendcorollary}

\newtheorem{proposition}{命题}[section]
\let\oldendproposition\endproposition
\renewcommand{\endproposition}{\thmenvfooter\oldendproposition}
\newcounter{exam}[section]  % 按 section 重置
\setcounter{exam}{0}
\renewcommand{\theexam}{\thesection.\arabic{exam}}  % 编号格式：章节.序号
\newenvironment{example}[1][]{%
    \refstepcounter{exam}% 计数器递增
    \par\addvspace{0pt}% 环境前添加 10pt 垂直间距
    \noindent%
    \textbf{\textcolor{black}{例题~\theexam}~#1}% 标题格式
    \rmfamily\kaishu% 正文字体：罗马体 + 楷书
    \ignorespaces% 忽略后续空格
}{%
    \par\addvspace{0pt}% 环境后添加 2pt 垂直间距
    \clearpage% 在环境结束后换页[3,6](@ref)
    \ignorespacesafterend%
}
\newcounter{prob}[subsection]  % 按 section 重置
\setcounter{prob}{0}
\renewcommand{\theprob}{\arabic{prob}.}  % 编号格式：章节.序号
\newenvironment{problem}[1][]{%
    \refstepcounter{prob}%
    \par\addvspace{0pt}%
    \noindent%
    \textbf{\textcolor{black}{\theprob}~#1}%
    \rmfamily\kaishu%
    \ignorespaces%
}{%
    \par\addvspace{0pt}%
    \clearpage
    \ignorespacesafterend%
}
\newcounter{enumcounter} % 自定义计数器
\preto{\enumerate}{% 在 enumerate 环境开始时初始化计数器
  \setcounter{enumcounter}{0}%
  \let\olditem\item
  \renewcommand{\item}{%
    \stepcounter{enumcounter}%
    \ifnum\value{enumcounter}>1\relax
      \clearpage % 强制分页并处理浮动体
    \fi
    \olditem % 调用原始 item 命令
  }%
}
\appto{\endenumerate}{\setcounter{enumcounter}{0}} % 环境结束时重置计数器
}{\relax}
}{\relax}
\ifdefstring{\MATHSR@enthm}{plain}{
\ifdefstring{\MATHSR@space}{blank}{
\definecolor{defcolor}{RGB}{0,154,84}
\definecolor{thmcolor}{RGB}{0,104,191} 
\definecolor{procolor}{RGB}{56,129,93}
\definecolor{corcolor}{RGB}{120,81,169}
\definecolor{exacolor}{RGB}{227, 237, 205}
\definecolor{sblue}{RGB}{255, 255, 255}

% ======== 导言区配置 ========
% 定义计数器
\newcounter{theorem}  
\newcounter{definition}
\newcounter{corollary}
\newcounter{proposition}
\newcounter{example}

% 设置按节编号
\numberwithin{theorem}{section}
\numberwithin{definition}{section}
\numberwithin{corollary}{section}
\numberwithin{proposition}{section}
\numberwithin{example}{section}

% ======== 定理环境 ========
\newtcolorbox[use counter=theorem]{theorem}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue, 
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{thmcolor},
  before upper = {\parindent 0pt\tcblower}, 
  after={\clearpage},
  overlay = {
    \node[anchor=north west, thmcolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {定理~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 定义环境 ========
\newtcolorbox[use counter=definition]{definition}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{defcolor},
  before upper = {\parindent 0pt\tcblower},
  overlay = {
    \node[anchor=north west, defcolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {定义~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 推论环境 ========
\newtcolorbox[use counter=corollary]{corollary}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{corcolor},
  before upper = {\parindent 0pt\tcblower},
  after={\clearpage},
  overlay = {
    \node[anchor=north west, corcolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {推论~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 命题环境 ========
\newtcolorbox[use counter=proposition]{proposition}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{procolor},
  before upper = {\parindent 0pt\tcblower},
  after={\clearpage},
  overlay = {
    \node[anchor=north west, procolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {命题~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 例题环境 ========
\newtcolorbox[use counter=example]{example}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{exacolor},
  before upper = {\parindent 0pt\tcblower},
  after={\clearpage},   %环境结束换页
  overlay = {
    \node[anchor=north west,exacolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {例题~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}%每个环境结束后换页

}{\relax}
}{\relax}
}{\relax}

\ifdefstring{\MATHSR@cover}{coverone}{
\definecolor{maincolor}{RGB}{254, 216, 71}
\definecolor{secondcolor}{RGB}{249, 241, 179}
\definecolor{thirdcolor}{RGB}{247, 234, 156}
\definecolor{text@main}{RGB}{254, 216, 71}
\definecolor{text@second}{RGB}{2, 49, 102}
\definecolor{text@third}{RGB}{162, 148, 65}
  \renewcommand{\maketitle}{
    \pagestyle{empty} % 全文无页眉页脚
     \begin{titlepage}
      \begin{tikzpicture}[remember picture, overlay]
      %背景色
      \fill[secondcolor] (current page.north west) rectangle (current page.south east);
      \fill[maincolor] (current page.south east) rectangle ++(-0.9\paperwidth, 0.69\paperheight)coordinate(t1);
      \fill[thirdcolor] (t1) rectangle ++(-0.1\paperwidth, -0.137\paperheight);
      %白线
      \draw[white, very thick] (current page.north west) ++ (0.1\paperwidth, 0) -- ++ (0, -\paperheight);
      \draw[white, very thick] (current page.north west) ++ (0, -0.31\paperheight) -- ++ (\paperwidth, 0);
      \draw[white, very thick] (current page.north west) ++ (0, -0.447\paperheight) -- ++ (0.1\paperwidth, 0);
      %添加文字点
      \node[text@third, font = \LARGE,anchor=north west] at ([shift = {(.14\paperwidth, -0.03\paperheight)}]current page.north west) {Graduate Text in Mathematics};
      \node[text@main, scale = 5, anchor = north east] at ([]current page.north east) {GTM};
      \node[text@second, anchor = south west, scale = 2.4] at ([xshift = 0.04\paperwidth]t1) {\MATHSR@Pretitle};
      \node[text@second, anchor=north west] at ([xshift=0.04\paperwidth,yshift=-0.05\paperheight]t1) {\fontsize{36pt}{0}\selectfont \MATHSR@title};
      \node[text@second, anchor=north west] at ([xshift=0.04\paperwidth,yshift=-0.18\paperheight]t1) {\fontsize{36pt}{0}\selectfont \MATHSR@subtitle};
      \node[anchor = south east, scale = 2] at ([xshift=-0.05\paperwidth,yshift=0.04\paperheight]current page.south east) {\faWeixin {:\MATHSR@Creator}};
      \node[anchor=south west, align=left] at ([yshift=0.1cm,xshift=2cm]current page.south west) {\color{black}\fontsize{12pt}{0}{\MATHSR@UpdateTime}};
      \node[anchor=south east, align=right] at ([yshift=0.1cm,xshift=0cm]current page.south east) {\color{black}\fontsize{12pt}{0}{\MATHSR@motto}};
      \node[anchor=south east, align=right] at ([yshift=0.2\paperheight, xshift=-0.1\paperwidth]current page.south east) {\color{black}\fontsize{24pt}{0}\MATHSR@Type};
      \end{tikzpicture}
     \end{titlepage}
    \clearpage}
}{\relax}
\ifdefstring{\MATHSR@cover}{covertwo}{
\definecolor{maincolor}{HTML}{66CC99}
\definecolor{secondcolor}{HTML}{FFFFFF}
\definecolor{thirdcolor}{HTML}{CCFFFF}
\renewcommand{\maketitle}{
    \begin{titlepage}
    \begin{tikzpicture}[remember picture, overlay]
        \fill[maincolor] (current page.south west) rectangle (current page.north east);
        \fill[secondcolor] ([yshift=-0.25\paperheight]current page.north west) rectangle ([xshift=-0.25\paperwidth,yshift=-0.20\paperheight]current page.north east);
        \fill[secondcolor] ([xshift=-0.25\paperwidth,yshift=-0.20\paperheight]current page.north east) rectangle (current page.north east);
        \foreach \x in {-0.25,-0.27,-0.29,...,-0.97}
        \fill[secondcolor] ([yshift=\x\paperheight]current page.north east) rectangle ++(-0.25\paperwidth,-3mm);
        \node[anchor=west, align=left, text width=\textwidth, inner sep=0] at ([xshift=0.2\paperwidth,yshift=-0.35\paperheight]current page.north west) {\fontsize{32pt}{0}{\textbf{\kaishu \MATHSR@title}}};
        \node[anchor=west, align=left, text width=\textwidth, inner sep=0] at ([xshift=0.2\paperwidth,yshift=-0.45\paperheight]current page.north west) {\fontsize{28pt}{0}{\textbf{\MATHSR@subtitle}}};
        \fill[black!6.2] (current page.south west) rectangle ++(\paperwidth,1cm);
        \node[anchor=south, align=center] at ([yshift=0.2cm]current page.south) {\color{black}\fontsize{12pt}{0}{\faWeixin {:\MATHSR@Creator}\quad\MATHSR@UpdateTime}};
        \node[anchor=west, align=center] at ([xshift=0.1\paperwidth,yshift=-0.23\paperheight]current page.north west) {\color{black}\fontsize{12pt}{0}{\MATHSR@motto}};
        \node[anchor=south, align=left,scale=1.5] at ([xshift=-0.12\paperwidth,yshift=-0.13\paperheight]current page.north east) {\color{black}\fontsize{16pt}{0}\textbf{\MATHSR@Type}};
        \end{tikzpicture}
        \end{titlepage}
}
}{\relax}

\ifdefstring{\MATHSR@mode}{answer}{
\renewenvironment{proof}
{
	\par\noindent\textbf{\textcolor{black}{证：}} % 设置标题颜色
	\begingroup\color{black} % 开始正文颜色范围
}
{
	\endgroup % 结束正文颜色范围
	\hfill \textcolor{black}{$\square$} \par
}

% 修改 solution 环境
\newenvironment{solution}
{%
	\par\noindent\textbf{\textcolor{black}{解答：}} % 标题不换行
	\begingroup\color{black} % 开始正文颜色
	\ignorespaces % 忽略后续空格，防止意外换行
}
{%
	\endgroup % 结束颜色范围
	\hfill\textcolor{black}{$\square$}\par
}
}{\relax}
\ifdefstring{\MATHSR@mode}{noanswer}{
\renewenvironment{proof}
{
	\par\noindent\textbf{\textcolor{white}{证：}} % 设置标题颜色
	\begingroup\color{white} % 开始正文颜色范围
}
{
	\endgroup % 结束正文颜色范围
	\hfill \textcolor{white}{$\square$} \par
}

% 修改 solution 环境
\newenvironment{solution}
{%
	\par\noindent\textbf{\textcolor{white}{解答：}} % 标题不换行
	\begingroup\color{white} % 开始正文颜色
	\ignorespaces % 忽略后续空格，防止意外换行
}
{%
	\endgroup % 结束颜色范围
	\hfill\textcolor{white}{$\square$}\par
}
}{\relax}
%%%%%%%%%%%%%%%%%不留白环境%%%%%%%%%%%%%%%%%%%%%%
\ifdefstring{\MATHSR@enthm}{fancy}{
\ifdefstring{\MATHSR@space}{noblank}{
\newtheoremstyle{thmstyle}{3pt}{3pt}{\kaishu}{0pt}{\bfseries\color{black}}{}{0.5em}{\thmname{#1} \thmnumber{#2} \thmnote{(#3)}}
\theoremstyle{thmstyle}
\newtheorem{theorem}{定理}[section]
\newtheorem{definition}{定义}[section]
\newtheorem{lemma}{引理}[section]
\newtheorem{corollary}{推论}[section]
\newtheorem{proposition}{命题}[section]
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
    \ignorespacesafterend%
}
\newcounter{prob}[subsection]  % 按 section 重置
\setcounter{prob}{0}
\renewcommand{\theprob}{\arabic{prob}.}  % 编号格式：章节.序号
\newenvironment{problem}[1][]{%
    \refstepcounter{prob}%
    \par\addvspace{2pt}%
    \noindent%
    \textbf{\textcolor{black}{\theprob}~#1}%
    \rmfamily\kaishu%
    \ignorespaces%
}{%
    \par\addvspace{2pt}%
    \ignorespacesafterend%
}


}{\relax}
}{\relax}

\ifdefstring{\MATHSR@enthm}{plain}{
\ifdefstring{\MATHSR@space}{noblank}{
\definecolor{defcolor}{RGB}{0,154,84}
\definecolor{thmcolor}{RGB}{0,104,191} 
\definecolor{procolor}{RGB}{56,129,93}
\definecolor{corcolor}{RGB}{120,81,169}
\definecolor{sblue}{RGB}{240,243,250}

% ======== 导言区配置 ========
% 定义计数器
\newcounter{theorem}  
\newcounter{definition}
\newcounter{corollary}
\newcounter{proposition}
\newcounter{example}

% 设置按节编号
\numberwithin{theorem}{section}
\numberwithin{definition}{section}
\numberwithin{corollary}{section}
\numberwithin{proposition}{section}
\numberwithin{example}{section}

% ======== 定理环境 ========
\newtcolorbox[use counter=theorem]{theorem}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue, 
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{thmcolor},
  before upper = {\parindent 0pt\tcblower}, 
  overlay = {
    \node[anchor=north west, thmcolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {定理~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 定义环境 ========
\newtcolorbox[use counter=definition]{definition}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{defcolor},
  before upper = {\parindent 0pt\tcblower},
  overlay = {
    \node[anchor=north west, defcolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {定义~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 推论环境 ========
\newtcolorbox[use counter=corollary]{corollary}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{corcolor},
  before upper = {\parindent 0pt\tcblower},
  overlay = {
    \node[anchor=north west, corcolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {推论~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 命题环境 ========
\newtcolorbox[use counter=proposition]{proposition}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{procolor},
  before upper = {\parindent 0pt\tcblower},
  overlay = {
    \node[anchor=north west, procolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {命题~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}

% ======== 例题环境 ========
\newtcolorbox[use counter=example]{example}[1][]{
  enhanced,
  notitle,
  colback = sblue,
  colbacklower = sblue,
  frame hidden,
  boxrule = 0pt,
  bicolor,
  sharp corners,
  borderline west = {4pt}{0pt}{thmcolor},
  before upper = {\parindent 0pt\tcblower},
  overlay = {
    \node[anchor=north west, thmcolor, font=\sffamily\bfseries] 
      at ([xshift=0.4cm]frame.north west) {例题~\thesection.\thetcbcounter\if\relax\detokenize{#1}\relax\else~#1\fi};
  }
}
}{\relax}
}{\relax}

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

\makeatletter
\renewenvironment{tableofcontents}{%
  %\pagestyle{empty} % 目录页无页眉页脚
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
\pretocmd{\tableofcontents}{%
    \clearpage%                     % 确保目录从新页开始
    \useromanpagenumbering%         % 应用罗马页码设置
}{}{}
    \apptocmd{\tableofcontents}{%
        \clearpage
        \usearabicpagenumbering % 目录结束后切换阿拉伯数字
    }{}{}
}

\newenvironment{remark}{{\par\noindent\textbf{注：}}}

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
\setlist[enumerate,1]{label=\color{black}(\arabic*), topsep=0pt, itemsep=0pt, parsep=0pt}
\setlist[enumerate,2]{label=\color{black}\arabic*), topsep=0pt, itemsep=0pt, parsep=0pt}
\setlist[enumerate,3]{label=\color{black}(\alph*), topsep=0pt, itemsep=0pt, parsep=0pt}
\setlist[enumerate,4]{label=\color{black}(\Roman*), topsep=0pt, itemsep=0pt, parsep=0pt}
\setlist[itemize,1]{label={\eitemi}}
\setlist[itemize,2]{label={\eitemii}}
\setlist[itemize,3]{label={\eitemiii}}

%%%%%%%%%%%%%%%%%%%%% 选择题选项自动排版%%%%%%%%%%%%%%%%%%%%%%%
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
    \settowidth{\choicelengtha}{\@optprefix (A)\@optsuffix~#1~~~}
    \settowidth{\choicelengthb}{\@optprefix (B)\@optsuffix~#2~~~}
    \settowidth{\choicelengthc}{\@optprefix (C)\@optsuffix~#3~~~}
    \settowidth{\choicelengthd}{\@optprefix (D)\@optsuffix~#4~~~}
    \setlength{\maxlength}{\choicelengtha}
    \ifdim\choicelengthb>\maxlength \setlength{\maxlength}{\choicelengthb}\fi
    \ifdim\choicelengthc>\maxlength \setlength{\maxlength}{\choicelengthc}\fi
    \ifdim\choicelengthd>\maxlength \setlength{\maxlength}{\choicelengthd}\fi
    
    \ifdim\maxlength>0.4\linewidth
        \begin{tabularx}{\linewidth}{X}
            \@optprefix (A)\@optsuffix~#1~~~\\
            \@optprefix (B)\@optsuffix~#2~~~\\
            \@optprefix (C)\@optsuffix~#3~~~\\
            \@optprefix (D)\@optsuffix~#4~~~
        \end{tabularx}
    \else
        \ifdim\maxlength>0.2\linewidth
            \begin{tabularx}{\linewidth}{XX}
                \@optprefix (A)\@optsuffix~#1~~~ & \@optprefix (B)\@optsuffix~#2~~~\\
                \@optprefix (C)\@optsuffix~#3~~~ & \@optprefix (D)\@optsuffix~#4~~~
            \end{tabularx}
        \else
            \begin{tabularx}{\linewidth}{XXXX}
                \@optprefix (A)\@optsuffix~#1~~~ & \@optprefix (B)\@optsuffix~#2~~~ & 
                \@optprefix (C)\@optsuffix~#3~~~ & \@optprefix (D)\@optsuffix~#4~~~
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

% 标点替换的可靠方法
\catcode`，=\active \def，{,}
\catcode`。=\active \def。{.}
\catcode`：=\active \def：{:}
\catcode`（=\active \def（{(}
\catcode`）=\active \def）{)}

\endinput

















