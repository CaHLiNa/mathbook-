# mathbook v2.0 模板使用说明文档

## 模板概述

mathbook 是一个基于 LaTeX 的数学书籍/讲义模板，专为数学内容排版设计，目前支持 A4 标准版和 iPad 横版两种页面格式，有计划加入ipad竖版。

## 基本选项

### 字体选项
```latex
\documentclass[fandol]{mathbook}  % 使用 Fandol 字体（默认）
```
### 定理环境样式
```latex
\documentclass[fancy]{mathbook}  % 使用普通定理环境样式（默认）
\documentclass[plain]{mathbook}   % 使用自定义定理环境样式
```

### 页面格式
```latex
\documentclass[standard]{mathbook} % A4 标准版（默认）
\documentclass[ipadH]{mathbook}     % ipad 横版
```

### 留白选项
```latex
\documentclass[blank]{mathbook}  %留白
\documentclass[noblank]{mathbook}  %不留白
```

### 答案显示选项
```latex
\documentclass[answer]{mathbook} %显示答案
\documentclass[noanswer]{mathbook}%不显示答案

```
答案的显示是通过设置proof和solution环境控制的noanswer选项下proof和solution环境显示背景色并占用空间
## 封面信息设置

```latex
\Pretitle{预标题}
\title{主标题}          % 设置主标题
\subtitle{副标题}       % 设置副标题
\motto{格言}           % 设置封面格言
\Creator{作者名}       % 设置作者
\UpdateTime{2025/01/01} % 设置更新时间
\Lhead{左页眉}         % 设置左页眉
\Rhead{右页眉}         % 设置右页眉

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
4. 建议使用 XeLaTeX编译

