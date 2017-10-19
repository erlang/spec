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
DVIPS=dvips -r0
BIBTEX=bibtex
MAKEINDEX=makeindex
TWOPAGE=2up
EXTRACT=../bin/extract_grrules
FIXPOINT=../bin/fixpoint
RM_F=/bin/rm -f

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

SOURCE_TEX=$(filter %.tex,$(SOURCE))
GEN_GRAM_TEX=es-lex-gram.tex \
		es-main-gram.tex \
		es-preproc-gram.tex

AUX_FILES=$(patsubst %.tex,%.aux,$(SOURCE_TEX)) es.idx

all:	full TAGS

full:	es.ps
#full:	es.ps es-separate-grammar.ps

TAGS:	$(SOURCE)
	etags $(SOURCE)

aux-files: $(GEN_GRAM_TEX)
	$(LATEX) es 1>/dev/null 2>/dev/null
	touch aux-files

es.2up.ps:	es.ps
	$(TWOPAGE) es.ps > es.2up.ps

es.ps:	es.dvi
	$(DVIPS) -o es.ps es
	chmod a+r es.ps

es.dvi:	$(SOURCE) aux-files $(GEN_GRAM_TEX) es.bbl es.ind
	$(FIXPOINT) $(AUX_FILES) -- $(LATEX) es

es.pdf:	$(SOURCE) aux-files $(GEN_GRAM_TEX) es.bbl es.ind
	$(FIXPOINT) $(AUX_FILES) -- pdflatex es

old.2up.ps:	old.ps
	$(TWOPAGE) old.ps > old.2up.ps

old.ps:	old.dvi
	$(DVIPS) -o old.ps old
	chmod a+r old.ps

old.dvi:	$(SOURCE) $(GEN_GRAM_TEX) old.bbl old.ind
	$(LATEX) old

std.2up.ps:	std.ps
	$(TWOPAGE) std.ps > std.2up.ps

std.ps:	std.dvi
	$(DVIPS) -o std.ps std
	chmod a+r std.ps

std.dvi:	$(SOURCE) $(GEN_GRAM_TEX) std.bbl std.ind
	$(LATEX) std

es-lex-gram.tex: $(EXTRACT) $(SOURC1)
	$(EXTRACT) $(SOURC1) > es-lex-gram.tex

es-main-gram.tex: $(EXTRACT) $(SOURC2)
	$(EXTRACT) $(SOURC2) > es-main-gram.tex

es-preproc-gram.tex: $(EXTRACT) $(SOURC3)
	$(EXTRACT) $(SOURC3) > es-preproc-gram.tex

es.bbl:	aux-files es.bib $(SOURCE)
	$(BIBTEX) es

es.ind:	aux-files
	$(MAKEINDEX) es

es.idx: $(SOURCE) $(GEN_GRAM_TEX)

old.bbl:	es.bib $(SOURCE)
	$(BIBTEX) old

old.ind:	old.idx
	$(MAKEINDEX) old

old.idx: $(SOURCE) $(GEN_GRAM_TEX)

std.bbl:	es.bib $(SOURCE)
	$(BIBTEX) std

std.ind:	std.idx
	$(MAKEINDEX) std

std.idx: $(SOURCE) $(GEN_GRAM_TEX)

es-separate-grammar.ps:	es-separate-grammar.dvi
	$(DVIPS) -o es-separate-grammar.ps es-separate-grammar
	chmod a+r es-separate-grammar.ps

es-separate-grammar.dvi:	es-separate-grammar.tex
	$(LATEX) es-separate-grammar.tex

clean:
	$(RM_F) aux-files
	$(RM_F) TAGS
	$(RM_F) *-gram.tex
	$(RM_F) *.aux
	$(RM_F) *.prev
	$(RM_F) *.bbl
	$(RM_F) *.dvi
	$(RM_F) *.idx
	$(RM_F) *.ind
	$(RM_F) *.log
	$(RM_F) *.toc
	$(RM_F) *.ilg
	$(RM_F) *.ps
	$(RM_F) *.pdf
	$(RM_F) *.blg
