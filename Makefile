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

.SECONDARY:

.PHONY: src_ps src_pdf

ps: src_ps erlang-spec.ps

pdf: src_pdf erlang-spec.pdf

src_ps:
	(cd src && $(MAKE) es.ps)

src_pdf:
	(cd src && $(MAKE) es.pdf)

erlang-spec.%: src/es.%
	$(CP) $< $@

clean:
	(cd src && $(MAKE) clean)
	$(RM_F) erlang-spec.ps erlang-spec.pdf
