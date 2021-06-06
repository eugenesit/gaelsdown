
<!-- README.md is generated from README.Rmd via `devtools::build_readme()`. Please edit README.Rmd -->

# gaelsdown <img src="gaelsdown.png" align="right" width=200 />

This project is a branch of Chester Ismay’s
[thesisdown](https://github.com/ismayc/thesisdown) package. The template
conforms to the Queen’s University [style and form
requirements](https://github.com/eugenesit/gaelsdown/blob/master/docs/SGS_General_Forms_of_Theses_March2017.pdf)
using LaTeX templates from the [Queen’s Computing Graduate
Society](https://flux.cs.queensu.ca/gcs/document-preparation/latex/thesis-template-2/).
Composition and formatting can be done using lightweight
[markdown](https://rmarkdown.rstudio.com/authoring_basics.html) syntax,
and **R** code and its output can be seamlessly included using
[rmarkdown](https://rmarkdown.rstudio.com). If you are interested in
using a different template to create your thesis, take a look at the end
of this README.

Currently, the PDF and gitbook versions are fully-functional. The word
and epub versions are developmental, have no templates behind them, and
are essentially calls to the appropriate functions in bookdown.

If you are new to working with `bookdown`/`rmarkdown`, please read over
the documentation available in the `gitbook` template at
<https://ismayc.github.io/thesisdown_book>.

The current output for the four versions of gaelsdown can be found here:

-   [PDF](https://github.com/ismayc/thesisdown_book/blob/master/thesis.pdf)
    (Generating LaTeX file is available
    [here](https://github.com/ismayc/thesisdown_book/blob/master/thesis.tex)
    with other files in the [book
    directory](https://github.com/ismayc/thesisdown_book/tree/master).)
-   [Word](https://github.com/ismayc/thesisdown_book/blob/master/thesis.docx)
-   [ePub](https://github.com/ismayc/thesisdown_book/blob/master/thesis.epub)
-   [gitbook](https://ismayc.github.io/thesisdown_book)

### Using gaelsdown from Eugene’s GitHub

The following instructions are adapted from
[thesisdown](https://github.com/ismayc/thesisdown), with special thanks
to [Ben Marwick](https://github.com/benmarwick) for adding a lot more
clarity to the directions below from the [README of his spin-off
`huskydown`
package](https://github.com/benmarwick/huskydown/blob/master/README.md).

Using {gaelsdown} has some prerequisites which are described below. To
compile PDF documents using **R**, you are going to need to have LaTeX
installed. By far the easiest way to install LaTeX on any platform is
with the [tinytex](https://yihui.name/tinytex/) R package:

``` r
install.packages(c('tinytex', 'rmarkdown'))
tinytex::install_tinytex()
# after restarting RStudio, confirm that you have LaTeX with
tinytex:::is_tinytex()
```

You may need to install a few extra LaTeX packages on your first attempt
to knit as well. Here is one such example of how to do so:

``` r
tinytex::tlmgr_install("babel-portuges")
```

To use {gaelsdown} from
[RStudio](https://www.rstudio.com/products/rstudio/download/):

1.  Ensure that you have already installed LaTeX and the fonts described
    above, and are using the latest version of
    [RStudio](https://www.rstudio.com/products/rstudio/download/). You
    can use `thesisdown` without RStudio. For example, you can write the
    Rmd files in your favorite text editor
    (e.g. [Atom](https://atom.io/),
    [Notepad++](https://notepad-plus-plus.org/), or
    [typora](https://typora.io/)). RStudio is probably the easiest tool
    for writing both R code and text in your thesis. It also provides a
    nice way to build your thesis while editing. We’ll proceed assuming
    that you have decided to use the RStudio workflow.

2.  Install the {bookdown} and {gaelsdown} packages. Note that
    {gaelsdown} is not available on CRAN at the moment and that’s why
    `install.packages("gaelsdown")` won’t work. Use
    `devtools::install_github()` as shown below instead to install the
    package.

    ``` r
    if (!require("devtools")) 
      install.packages("devtools", repos = "https://cran.rstudio.org")
    devtools::install_github("rstudio/bookdown")
    devtools::install_github("eugenesit/gaelsdown")
    ```

          Note that you may need to restart RStudio at this point for
the following dialog to show up.

3.  Get started with the {gaelsdown} template. There are two options for
    doing so.

-   3a) **RECOMMENDED** Create a new RStudio project with a {gaelsdown}
    template.

    In RStudio, click on **File** &gt; **New Project** &gt; **New
    Directory**. Then select **Thesis Project using thesisdown** from
    the dropdown that will look something like the image below. You’ll
    see the graduation cap as the icon on the left for the appropriate
    project type.

    ![](https://raw.githubusercontent.com/eugenesit/gaelsdown/master/docs/reference/figures/project_option.png)

    Next, give your project a name and specify where you’d like the
    files to appear. In the screenshot below, the project name is
    `my_thesis` and it will appear as a new folder on my Desktop.

    ![](https://raw.githubusercontent.com/eugenesit/gaelsdown/master/docs/reference/figures/project_directory.png)

    If you got this far, skip over step 3b which is the older version of
    getting the template. It might force you to change some of the
    directories to get knitting to work and has some other limitations
    as well. That’s why step 3a is recommended.

-   3b) Use the **New R Markdown** dialog to select **Thesis**:

    ![](https://raw.githubusercontent.com/eugenesit/gaelsdown/master/docs/reference/figures/markdown_reference.png)

    Note that this will currently only **Knit** if you name the
    directory `index` as shown above. This guarantees that `index.html`
    is generated correctly for the Gitbook version of the thesis.

4.  After choosing which type of output you’d like in the YAML at the
    top of `index.Rmd`, **Knit** the `index.Rmd` file to get the book in
    PDF or HTML formats.

### Day-to-day writing of your thesis

You need to edit the individual chapter R Markdown files to write your
thesis. It’s recommended that you version control your thesis using
GitHub if possible. RStudio can also easily sync up with GitHub to make
the process easier. While writing, you should `git commit` your work
frequently, after every major activity on your thesis. For example,
every few paragraphs or section of text, and after major step of
analysis development. You should `git push` at the end of each work
session before you leave your computer or change tasks. For a gentle,
novice-friendly guide to getting starting with using Git with R and
RStudio, see <https://happygitwithr.com/>.

## Rendering

To render your thesis into a PDF, open `index.Rmd` in RStudio and then
click the “knit” button. To change the output formats between PDF,
gitbook and Word, look at the `output:` field in `index.Rmd` and
comment-out the formats you don’t want.

The PDF file of your thesis will be deposited in the `_book/` directory,
by default.

## Components

The following components are ones you should edit to customize your
thesis:

### `_bookdown.yml`

This is the main configuration file for your thesis. You can change the
name of your outputted file here for your thesis and other options about
your thesis here.

### `index.Rmd`

This file contains all the meta information that goes at the beginning
of your document. You’ll need to edit the top portion of this file (the
YAML) to put your name on the first page, the title of your thesis, etc.
Note that you need to have at least one chapter start in the `index.Rmd`
file for the build to work. For the template, this is done with
`# Introduction` in the example from the template.

### `01-chap1.Rmd`, `02-chap2.Rmd`, etc.

These are the Rmd files for each chapter in your dissertation. Write
your thesis in these. If you’re writing in RStudio, you may find the
[wordcount addin](https://github.com/benmarwick/wordcountaddin) useful
for getting word counts and readability statistics in R Markdown
documents.

### `bib/`

Store your bibliography (as bibtex files) here. We recommend using the
[citr addin](https://github.com/crsh/citr) and
[Zotero](https://www.zotero.org/) to efficiently manage and insert
citations.

### `csl/`

Specific style files for bibliographies should be stored here. A good
source for citation styles is
<https://github.com/citation-style-language/styles#readme>.

### `figure/` and `data/`

Store your figures and data here and reference them in your R Markdown
files. See the [bookdown book](https://bookdown.org/yihui/bookdown/) for
details on cross-referencing items using R Markdown.

## Customizing a template for your institution

In an ideal world, one package would support a variety of different
LaTeX templates from a wide range of institutions and we’d love to get
it there at some point. Until that time, realize that gaelsdown was
designed to only work with the Queen’s University LaTeX template, while
thesisdown was created for the Reed College LaTeX template. Others have
adapted the package to work with their institutions! Here are some that
have customized it to fit their needs. It is recommended you review how
they changed the files by comparing their repositories to this one and
then make tweaks to yours as needed. Feel free to file an issue on the
[thesisdown repo](https://github.com/ismayc/thesisdown) if you have
questions/troubles.

Have you created a thesisdown template for your institution and would
like to have it included here? Make a PR [similar to the commit done to
include
`jayhawkdown`](https://github.com/ismayc/thesisdown/commit/760113a076767cf67b6e22339e398bd3f15305c5).
I’ll review it and merge it in. Let’s keep the list going!

| College/University                                          | Repository                                                                                    | Based on                                                        |
|:------------------------------------------------------------|:----------------------------------------------------------------------------------------------|:----------------------------------------------------------------|
| American University                                         | [SimonHeuberger/eagledown](https://github.com/SimonHeuberger/eagledown)                       | [benmarwick/huskydown](https://github.com/benmarwick/huskydown) |
| Brock University                                            | [brentthorne/brockdown](https://github.com/brentthorne/brockdown)                             | [zkamvar/beaverdown](https://github.com/zkamvar/beaverdown)     |
| École Doctorale de Mathématiques Hadamard                   | [abichat/hadamardown](https://github.com/abichat/hadamardown)                                 | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Drexel University                                           | [tbradley1013/dragondown](https://github.com/tbradley1013/dragondown)                         | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Duke University                                             | [mine-cetinkaya-rundel/thesisdowndss](https://github.com/mine-cetinkaya-rundel/thesisdowndss) | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Graduate Institute of International and Development Studies | [jhollway/iheiddown](https://github.com/jhollway/iheiddown)                                   | [ulyngs/oxforddown](https://github.com/ulyngs/oxforddown)       |
| Heidelberg University, Faculty of Biosciences               | [nkurzaw/heididown](https://github.com/nkurzaw/heididown)                                     | [phister/huwiwidown](https://github.com/phister/huwiwidown)     |
| Humboldt University of Berlin                               | [phister/huwiwidown](https://github.com/phister/huwiwidown)                                   | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Kansas State University                                     | [emraher/wildcatdown](https://github.com/emraher/wildcatdown)                                 | [benmarwick/huskydown](https://github.com/benmarwick/huskydown) |
| Massachusetts Institute of Technology                       | [ratatstats/manusdown](https://github.com/ratatstats/manusdown)                               | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Oregon State University                                     | [zkamvar/beaverdown](https://github.com/zkamvar/beaverdown)                                   | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Oxford University                                           | [davidplans/oxdown](https://github.com/davidplans/oxdown)                                     | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Smith College                                               | [SmithCollege-SDS/pioneerdown](https://github.com/SmithCollege-SDS/pioneerdown)               | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Southampton University                                      | [dr-harper/sotonthesis](https://github.com/dr-harper/sotonthesis)                             | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Stanford University                                         | [mhtess/treedown](https://github.com/mhtess/treedown)                                         | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Universidade Federal do Rio de Janeiro                      | [COPPE-UFRJ/coppedown](https://github.com/COPPE-UFRJ/coppedown)                               | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Université Paris-Saclay                                     | [abichat/hadamardown](https://github.com/abichat/hadamardown)                                 | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| University College London                                   | [benyohaiphysics/thesisdownUCL](https://github.com/benyohaiphysics/thesisdownUCL)             | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| University of Arizona                                       | [kelseygonzalez/beardown](https://github.com/kelseygonzalez/beardown)                         | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| University of California, Davis                             | [ryanpeek/aggiedown](https://github.com/ryanpeek/aggiedown)                                   | [DanOvando/gauchodown](https://github.com/DanOvando/gauchodown) |
| University of California, Santa Barbara                     | [DanOvando/gauchodown](https://github.com/DanOvando/gauchodown)                               | [benmarwick/huskydown](https://github.com/benmarwick/huskydown) |
| University of Florida                                       | [ksauby/thesisdownufl](https://github.com/ksauby/thesisdownufl)                               | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| University of Freiburg                                      | [vivekbhr/doctorRbite](https://github.com/vivekbhr/doctorRbite)                               | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| University of Kansas                                        | [wjakethompson/jayhawkdown](https://github.com/wjakethompson/jayhawkdown)                     | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| University of Manchester                                    | [juliov/uomthesisdown](https://github.com/JulioV/uomthesisdown)                               | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| University of Minnesota                                     | [zief0002/qmedown](https://github.com/zief0002/qmedown)                                       | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| University of New South Wales                               | [rensa/unswthesisdown](https://github.com/rensa/unswthesisdown)                               | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| University of Salzburg                                      | [irmingard/salzburgthesisdown](https://github.com/irmingard/salzburgthesisdown)               | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| University of Toronto                                       | [mattwarkentin/torontodown](https://github.com/mattwarkentin/torontodown)                     | [zkamvar/beaverdown](https://github.com/zkamvar/beaverdown)     |
| University of Washington                                    | [benmarwick/huskydown](https://github.com/benmarwick/huskydown)                               | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| TU Wien                                                     | [ben-schwen/robotdown](https://github.com/ben-schwen/robotdown)                               | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| University of Bristol                                       | [mattlee821/bristolthesis](https://github.com/mattlee821/bristolthesis)                       | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Universidade Federal de Santa Catarina                      | [lfpdroubi/ufscdown](https://github.com/lfpdroubi/ufscdown)                                   | [ismayc/thesisdown](https://github.com/ismayc/thesisdown)       |
| Universiteit van Amsterdam                                  | [lcreteig/amsterdown](https://github.com/lcreteig/amsterdown)                                 | [benmarwick/huskydown](https://github.com/benmarwick/huskydown) |
