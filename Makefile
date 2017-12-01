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

RM_F=/bin/rm -f
CP=/bin/cp

all: srcdir erlang-spec.pdf

.SUFFIXES: .pdf .ps

erlang-spec.%: src/es.%
	$(CP) $< $@

.PHONY: srcdir
srcdir src/es.ps src/es.pdf:
	cd src && $(MAKE) es.ps es.pdf

clean:
	cd src && $(MAKE) $@
	$(RM_F) erlang-spec.pdf erlang-spec.ps
