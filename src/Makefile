#
# %CopyrightBegin%
#
# Copyright Ericsson AB 2017. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# %CopyrightEnd%
#

LATEX=latex
#LATEX=/opt/texmf/bin/latex
DVIPS=dvips -r0
#DVIPS=/opt/texmf/bin/dvips -r0
BIBTEX=bibtex
#BIBTEX=/opt/texmf/bin/bibtex
MAKEINDEX=makeindex
TWOPAGE=${HOME}/Bin/2up
#EXTRACT=${HOME}/Bin/extract_grrules
EXTRACT=extract_grrules

SOURC1=es-lexical-structure.tex

SOURC2=es-programs-modules.tex \
       es-expressions-evaluation.tex

SOURC3=es-preprocessing.tex

SOURC0=es-release-notes.tex \
       es-introduction.tex \
       es-notation.tex \
       es-arithmetics.tex \
       es-types-terms.tex \
       es-processes.tex \
       es-nodes.tex \
       es-ports.tex \
       es-code-maintenance.tex \
       es-bifs.tex \
       es-operators.tex \
       es-limits.tex \
       es-differences.tex \
       es-parse-trees.tex \
       es-hashing.tex \
       es-external-format.tex \
       es-grammar.tex \
       es-epmd.tex \
       es-see.tex \
       grammar.sty

SOURCE=es.tex $(SOURC0) $(SOURC1) $(SOURC2) $(SOURC3)

all:	full TAGS

full:	es.ps
#full:	es.ps es-separate-grammar.ps

TAGS:	$(SOURCE)
	etags $(SOURCE)

es.2up.ps:	es.ps
	$(TWOPAGE) es.ps > es.2up.ps

es.ps:	es.dvi
	$(DVIPS) -o es.ps es
	chmod a+r es.ps

es.dvi:	$(SOURCE) es-lex-gram.tex es-main-gram.tex es-preproc-gram.tex es.bbl es.ind
	$(LATEX) es

old.2up.ps:	old.ps
	$(TWOPAGE) old.ps > old.2up.ps

old.ps:	old.dvi
	$(DVIPS) -o old.ps old
	chmod a+r old.ps

old.dvi:	$(SOURCE) es-lex-gram.tex es-main-gram.tex es-preproc-gram.tex old.bbl old.ind
	$(LATEX) old

std.2up.ps:	std.ps
	$(TWOPAGE) std.ps > std.2up.ps

std.ps:	std.dvi
	$(DVIPS) -o std.ps std
	chmod a+r std.ps

std.dvi:	$(SOURCE) es-lex-gram.tex es-main-gram.tex es-preproc-gram.tex std.bbl std.ind
	$(LATEX) std

es-lex-gram.tex: $(EXTRACT) $(SOURC1)
	$(EXTRACT) $(SOURC1) > es-lex-gram.tex

es-main-gram.tex: $(EXTRACT) $(SOURC2)
	$(EXTRACT) $(SOURC2) > es-main-gram.tex

es-preproc-gram.tex: $(EXTRACT) $(SOURC3)
	$(EXTRACT) $(SOURC3) > es-preproc-gram.tex

es.bbl:	es.bib $(SOURCE)
	$(BIBTEX) es

es.ind:	es.idx
	$(MAKEINDEX) es

es.idx: $(SOURCE) es-lex-gram.tex es-main-gram.tex es-preproc-gram.tex

old.bbl:	es.bib $(SOURCE)
	$(BIBTEX) old

old.ind:	old.idx
	$(MAKEINDEX) old

old.idx: $(SOURCE) es-lex-gram.tex es-main-gram.tex es-preproc-gram.tex

std.bbl:	es.bib $(SOURCE)
	$(BIBTEX) std

std.ind:	std.idx
	$(MAKEINDEX) std

std.idx: $(SOURCE) es-lex-gram.tex es-main-gram.tex es-preproc-gram.tex

es-separate-grammar.ps:	es-separate-grammar.dvi
	$(DVIPS) -o es-separate-grammar.ps es-separate-grammar
	chmod a+r es-separate-grammar.ps

es-separate-grammar.dvi:	es-separate-grammar.tex
	$(LATEX) es-separate-grammar.tex
