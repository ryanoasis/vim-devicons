# -*- coding: utf-8 -*-
# vim:se fenc=utf8 noet:
from .base import Base
from os.path import isdir


class Filter(Base):

	def __init__(self, vim):
		super().__init__(vim)
		self.name = 'devicons_denite_converter'
		self.description = 'add devicons in front of candidates'

	def filter(self, context):
		for candidate in context['candidates']:

			if 'bufnr' in candidate:
				bufname = self.vim.funcs.bufname(candidate['bufnr'])
				filename = self.vim.funcs.fnamemodify(bufname, ':p:t')
			elif 'word' in candidate and 'action__path' in candidate:
				filename = candidate['word']

			icon = self.vim.funcs.WebDevIconsGetFileTypeSymbol(
				filename, isdir(filename))

			# Customize output format if not done already.
			if icon not in candidate.get('abbr', '')[:10]:
				candidate['abbr'] = ' {} {}'.format(
					icon, candidate.get('abbr', candidate['word']))

		return context['candidates']
