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

			if self.vim.funcs.has_key(candidate, 'bufnr'):
				bufname = self.vim.funcs.bufname(candidate['bufnr'])
				filename = self.vim.funcs.fnamemodify(bufname, ':p:t')
				path = self.vim.funcs.fnamemodify(bufname, ':p:h')
			elif self.vim.funcs.has_key(candidate, 'word') and self.vim.funcs.has_key(candidate, 'action__path'):
				path = candidate['action__path']
				filename = candidate['word']

			icon = self.vim.funcs.WebDevIconsGetFileTypeSymbol(filename, isdir(filename))

			# prevent filenames of buffers getting 'lost'
			if filename != path:
				path = self.vim.funcs.printf('%s', filename)

			# Customize output format.
			candidate['abbr'] = self.vim.funcs.printf(' %s %s', icon, path)

		return context['candidates']
