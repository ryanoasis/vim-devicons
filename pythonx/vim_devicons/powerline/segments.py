# -*- coding: utf-8 -*-
# vim:se fenc=utf8 noet:
from __future__ import (unicode_literals, division, absolute_import, print_function)

try:
	import vim
except ImportError:
	vim = {}

from powerline.bindings.vim import (vim_get_func, buffer_name)
from powerline.theme import requires_segment_info

@requires_segment_info
def webdevicons(pl, segment_info):
	webdevicons = vim_get_func('WebDevIconsGetFileTypeSymbol')
	name = buffer_name(segment_info)
	return [] if not webdevicons else [{
		'contents': webdevicons(name),
		'highlight_groups': ['webdevicons', 'file_name'],
		}]

@requires_segment_info
def webdevicons_file_format(pl, segment_info):
	webdevicons_file_format = vim_get_func('WebDevIconsGetFileFormatSymbol')
	return [] if not webdevicons_file_format else [{
		'contents': webdevicons_file_format(),
		'highlight_groups': ['webdevicons_file_format', 'file_format'],
		}]
