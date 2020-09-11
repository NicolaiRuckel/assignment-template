# Assignment Template

This is my template to generate assignment sheets and their solutions. To
adjust the layout of the assignments edit `preamble.tex`. As long as all the
assignment files are named `assignment*.tex` the Makefile will take care of
creating the solution files for you.

Example and solution code is expected in `code` and images in `images`. If you
want different names, adjust the according variables in the Makefile.

The default `make` target will create the assignment and solutions PDFs in `out`.
All the auxiliary files are deleted after that. To change this behaviour,
remove the call of `latexmk -c` in the rule for `out/%.pdf`.

## Creating Assignments

To create an assignment sheet, create a `.tex` file that starts with
`assignment`. In that file include the preamble before
`\begin{document}`, i.e.:

```tex
\input{preamble}
\begin{document}
\end{document}
```

Every assignment sheet should have a header. It takes two arguments: the number
of the assignment and the due date.

```tex
\input{preamble}
\begin{document}
\header{1}{2020-03-23}
\end{document}
```

All the task of the assignment sheets should be in the `assignment`
environment. Every task should begin with the `\task{$TOPIC}` command, where
`$TOPIC` is the topic of that specific task. You could also include the number
of points in the topic. This could look like this:

```tex
\input{preamble}
\begin{document}
\header{1}{2020-03-23}

\begin{assignment}
  \task{Foo (2 points)} Description of the first task.
  \task{Bar (1 point)} Description of the second task.
\end{assignment}
\end{document}
```

Write the solutions in `\solution{ … }`, e.g.:

```tex
\input{preamble}
\begin{document}
\header{1}{2020-03-23}

\begin{assignment}
  \task{Foo (2 points)} Description of the first task.
  \solution{This is how to solve task 1}
  \task{Bar (1 point)} Description of the second task.
  \solution{This is how to solve task 2}
\end{assignment}
\end{document}
```

Of course, the solutions are only shown in the solutions PDFs.

## License

This work by Nicolai Ruckel is licensed under [CC BY-SA 4.0](https://creativecommons.org/licenses/by-sa/4.0).
