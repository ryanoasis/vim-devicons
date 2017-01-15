# -*- coding: utf-8 -*-
# vim:se fenc=utf8 noet:
from .base import Base
from os.path import isdir

class Filter(Base):

	def __init__(self, vim):
		super().__init__(vim)
		self.name = 'converter_devicons'
		self.description = 'add devicons in front of candidates'

	def filter(self, context):
		for candidate in context['candidates']:
			candidate['word'] = ' '+self.vim.funcs.WebDevIconsGetFileTypeSymbol(candidate['word'], isdir(candidate['word']))+' '+candidate['word']
		return context['candidates']
