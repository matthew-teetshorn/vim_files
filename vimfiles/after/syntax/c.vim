syn keyword	cNote		contained NOTE
syn keyword	cImportant	contained IMPORTANT

syn cluster	cCommentGroup	add=cNote,cImportant

hi def link cNote		Note
hi def link cImportant	Important
