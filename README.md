# MathBook 模板使用说明文档

## 模板概述

MathBook 是一个基于 LaTeX 的数学书籍/讲义模板，专为数学内容排版设计，支持 A4 标准版和 iPad 横版两种页面格式。

## 基本选项

### 字体选项
```latex
\documentclass[fandol]{mathbook}  % 使用 Fandol 字体（默认）
\documentclass[windows]{mathbook} % 使用 Windows 字体
\documentclass[mac]{mathbook}    % 使用 Mac 字体
```

### 定理环境样式
```latex
\documentclass[custom]{mathbook}  % 使用自定义定理环境样式（彩色框）
\documentclass[plain]{mathbook}   % 使用普通定理环境样式（默认）
```

### 页面格式
```latex
\documentclass[standard]{mathbook} % A4 标准版（默认）
\documentclass[padl]{mathbook}     % iPad 横版
```

### 主题颜色
```latex
\setThemeColor{blue}    % 蓝色主题（默认）
\setThemeColor{green}   % 绿色主题
\setThemeColor{purple}  % 紫色主题
\setThemeColor{orange}  % 橙色主题
\setThemeColor{infj}    % INFJ 风格
\setThemeColor{enfp}    % ENFP 风格
\setThemeColor{infp}    % INFP 风格
\setThemeColor{esfp}    % ESFP 风格
\setThemeColor{intj}    % INTJ 风格
\setThemeColor{entp}    % ENTP 风格
\setThemeColor{isfj}    % ISFJ 风格
\setThemeColor{enfj}    % ENFJ 风格
```

## 封面信息设置

```latex
\Title{主标题}          % 设置主标题
\Subtitle{副标题}       % 设置副标题
\TypeOne{A4标准版}      % 设置A4版本说明
\TypeTwo{iPad横版}     % 设置iPad版本说明
\motto{格言}           % 设置封面格言
\Creator{作者名}       % 设置作者
\UpdateTime{2025/01/01} % 设置更新时间
\Lhead{左页眉}         % 设置左页眉
\Chead{中页眉}         % 设置中页眉
\Rhead{右页眉}         % 设置右页眉
\LheadC{页眉左侧内容}  % 设置页眉左侧固定内容
```

## 数学环境

### 定理类环境
```latex
\begin{theorem}[标题]  % 定理环境
内容...
\end{theorem}

\begin{definition}[标题]  % 定义环境
内容...
\end{definition}

\begin{lemma}[标题]  % 引理环境
内容...
\end{lemma}

\begin{proposition}[标题]  % 命题环境
内容...
\end{proposition}

\begin{corollary}[标题]  % 推论环境
内容...
\end{corollary}
```

### 证明与解答
```latex
\begin{proof}  % 证明环境
证明内容...
\end{proof}

\begin{solution}  % 解答环境
解答内容...
\end{solution}
```

### 例题与问题
```latex
\begin{example}[标题]  % 例题环境
例题内容...
\end{example}

\begin{problem}[标题]  % 问题环境
问题内容...
\end{problem}
```

### 其他环境
```latex
\begin{remark}  % 备注环境
备注内容...
\end{remark}

\begin{property}  % 性质环境
性质内容...
\end{property}

\begin{introduction}[标题]  % 内容提要（双栏）
\item 要点1
\item 要点2
...
\end{introduction}
```

## 列表环境

### 有序列表
```latex
\begin{enumerate}
\item 第一项
\item 第二项
\begin{enumerate}
\item 子项1
\item 子项2
\end{enumerate}
\end{enumerate}
```

### 无序列表
```latex
\begin{itemize}
\item 第一项
\item 第二项
\begin{itemize}
\item 子项1
\item 子项2
\end{itemize}
\end{itemize}
```

## 选择题排版

```latex
\fourchoices{选项A内容}{选项B内容}{选项C内容}{选项D内容}
```

## 实用命令

```latex
\explain{页码}  % 答案提示，如：※ 此部分答案见原书P123
\emptybox       % 空括号：(    )
\emptyline      % 空白下划线：______
\noreftitle{标题} % 无索引标题
\hideheaderfooter % 隐藏当前页的页眉页脚
\circled{1}     % 带圈数字
```

## 数学符号重定义

模板已自动将以下数学符号设置为 displaystyle 样式：
- `\lim`, `\sum`, `\int`, `\prod` 等大型运算符
- `\frac` 分数
- `\max`, `\min`, `\sup`, `\inf` 等

## 页面控制

```latex
\useromanpagenumbering  % 使用罗马数字页码
\usearabicpagenumbering % 使用阿拉伯数字页码
```

## 注意事项

1. 模板默认使用 Fandol 字体，如需使用系统字体请选择 windows 或 mac 选项
2. 定理环境在 iPad 横版模式下会自动分页
3. 选择题选项会根据内容长度自动调整排版方式
4. 建议使用 XeLaTeX 或 LuaLaTeX 编译

## 示例文档

```latex
\documentclass[padl,custom]{mathbook}
\setThemeColor{green}
\Title{高等数学讲义}
\Subtitle{微积分基础}
\Creator{数学系}

\begin{document}

\chapter{极限与连续}

\begin{definition}[极限]
设函数 $f(x)$ 在点 $a$ 附近有定义...
\end{definition}

\begin{theorem}
如果函数 $f(x)$ 在 $a$ 点可导，则它在 $a$ 点连续。
\end{theorem}

\begin{proof}
根据导数的定义...
\end{proof}

\begin{example}[重要极限]
计算 $\lim_{x\to 0} \frac{\sin x}{x}$。
\end{example}

\fourchoices{0}{1}{$\infty$}{不存在}
\explain{45}

\end{document}
```