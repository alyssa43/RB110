<h1>Regex Cheat Sheet</h1>

### Basic Matching

| Pattern        | Meaning                                       |
| :------------- | :-------------------------------------------- |
| `/a/`          | Match the character `a`                       |
| `/\?/`, `/\./` | Match a meta-character literally              |
| `/\n/`, `/\t/` | Match a control character (newline, tab, etc) |
| `/pq/`         | Concatenation (`p` followed by `q`)           |
| `/(p)/`        | Capture Group                                 |
| `/(p|q)/`      | Alternation (`p` or `q`)                      |
| `/p/i`         | Case insensitive match                        |

### Character Classes and Shortcuts

| Pattern          | Meaning                                         |
| :--------------- | :---------------------------------------------- |
| `/[ab]/`         | `a` or `b`                                      |
| `/[a-z]/`        | `a` through `z`, inclusive                      |
| `/[^ab]/`        | Not (`a` or `b`)                                |
| `/[^a-z]/`       | Not (`a` through `z`)                           |
| `/./`            | Any character except newline                    |
| `/\s/`, `/[\s]/` | Whitespace character (space, tab, newline, etc) |
| `/\S/`, `/[\S]/` | Not a whitespace character                      |
| `/\d/`, `/[\d]/` | Decimal digit (`0-9`)                           |
| `/\D/`, `/[\D]/` | Not a decimal digit                             |
| `/\w/`, `/[\w]/` | Word character (`0-9`, `a-z`, `A-Z`, `_`)       |
| `/\W/`, `/[\W]/` | Not a word character                            |

### Anchors

| Pattern | Meaning                                   |
| :------ | :---------------------------------------- |
| `/^p/`  | Pattern at start of line                  |
| `/p$/`  | Pattern at end of line                    |
| `/\Ap/` | Pattern at start of string                |
| `/p\z/` | Pattern at end of string (after newline)  |
| `/p\Z/` | Pattern at end of string (before newline) |
| `/\bp/` | Pattern begins at word boundary           |
| `/p\b/` | Pattern ends at word boundary             |
| `/\Bp/` | Pattern begins at non-word boundary       |
| `/p\B/` | Pattern ends at non-word boundary         |

### Quantifiers

| Pattern     | Meaning                                |
| :---------- | :------------------------------------- |
| `/p*/`      | 0 or more occurrences of pattern       |
| `/p+/`      | 1 or more occurrences of pattern       |
| `/p?/`      | 0 or 1 occurrence of pattern           |
| `/p{m}/`    | `m` occurrences of pattern             |
| `/p{m,}/`   | `m` or more occurrences of pattern     |
| `/p{m,n}/`  | `m` through `n` occurrences of pattern |
| `/p*?/`     | 0 or more occurrences (lazy)           |
| `/p+?/`     | 1 or more occurrences (lazy)           |
| `/p??/`     | 0 or 1 occurrence (lazy)               |
| `/p{m,}?/`  | `m` or more occurrences (lazy)         |
| `/p{m,n}?/` | `m` through `n` occurrences (lazy)     |

### Meta-characters

| Outside Character Classes | Inside Character Classes |
| :-----------------------: | :----------------------: |
|       `$ ^ * + ? .`       |       `^ \ - [ ]`        |
|       `( ) [ ] { }`       |                          |
|        \| `\` `/`         |                          |

### Common Ruby Methods for Regex

| Method            | Use                                 |
| :---------------- | :---------------------------------- |
| `String#match`    | Determine if regex matches a string |
| `string =~ regex` | Determine if regex matches a string |
| `String#scan`     | Find all regex matches in string    |
| `String#split`    | Split string by regex               |
| `String#sub`      | Replace regex match one time        |
| `String#gsub`     | Replace regex match globally        |