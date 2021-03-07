# asyncomplete-dictionary

Vim dictionary for each filetype completion source for [asyncomplete.vim](https://github.com/prabirshrestha/asyncomplete.vim)

## Requirement

- asyncomplete.vim
- `grep` command works
- Set the path to the dictionary file in Vim [dictionary](http://vimdoc.sourceforge.net/htmldoc/options.html#'dictionary') option

### Optional

- [`fzy`](https://github.com/jhawthorn/fzy) command works If you want to do fuzzy search

## Usage

```vim
call asyncomplete#register_source({
    \ 'name': 'dictionary',
    \ 'allowlist': ['*'],
    \ 'completor': function('asyncomplete#sources#dictionary#completor'),
    \ })
```
