# proj-sh

"Why type the full name of the source code directory that you are trying 'cd' into?"

# Yes, why?

How many times do you have to hit 'tab' while stumbling around your source code directories before the bell gets on your nerves? I have high tolerance for pain, so it took me many thousands of failed tab completions to try to come up with a better way. What can I say, old habits die hard.

# Other better ways

Some people that are smarter than me use [fzf](https://github.com/junegunn/fzf). It's awesome and I totally recommend it. Too bad that I've only recently discovered it, and not before forming another habit that stuck.

# My own better way

I've been using the approach outlined below for several years now, and it seems to work well.

1. Put all of your source code directories in one root directory. _Don't_ group them into subdirectories (like 'ios', 'python', 'work', 'secret_projects' etc). Use a flat hierarchy.
2. Name each directory as descriptively as possible, using as many distinct keywords as you can, while keeping the name reasonably short. **This is important**. The whole point is to use fuzzy searching to 'cd' into your project directories instead of typing the exact 'cd /proj/this-other-project-thing/' while hitting tab a bunch of times, because who the hell remembers what *exactly* you called that one directory. #stoptabbing
3. Create a bash/zsh function that accepts a fuzzy pattern and `cd`s into the first directory that matches it.

Let's illustrate. Imagine you have the following projects:
```
/Users/peter/proj
├── 01-docker-elasticmq
├── 02-pcbng-blog
├── 03-miller-csv-tool
├── 04-letsencrypt-ssl-docker
├── 05-pcbng-api-gateway
├── 06-poc-backend
├── 07-proj-sh
└── 08-personal-blog
```
(oh, and BTW, you should definitely `brew install tree`. That's where the above output came from.)

Instead of `cd ~/proj/06<tab>-poc-backend`, do `proj 06`.

Say you need to work on your personal blog. There are two directories with 'blog' in their names. That's fine, just give `proj` a way to disambiguate: `proj pers blog`.

I like to prepend all of my source code or project directories with sequential numbers. I found that sometimes it's easier to remember them that way. Right this second, for work, I'm usually in one of projects 37, 47, 74 or 'storefront', for instance. I also remember each one of those by a couple of unique keywords that I sometimes use if I space out on the number. The point is to give yourself more ways to remember where your code lives, instead of forcing yourself to memorize "the one true name" for everything. Try it.

# Usage: nothing to it

* Use `proj fuzzy search pattern` to `cd` into the most recently modified directory that matches `*fuzzy*search*pattern*`

* Use `projd my lifes work` to `echo` the name of the most recently modified directory that matches `*my*lifes*work*`. This is good for things like `cp my-face.png $(projd pers blog)/images`

proj/projd can also cd into project subdirectories. All you have to do is separate the project directory pattern from the subdirectory pattern with a '/', like so:

`projd pers blo / ima face` returns /Users/peter/proj/08-*pers*onal-*blo*g*/ima*ges/my-*face*.png (emphasis mine)

# Installation: it's just a shell script

0. Clone this repo
1. Edit proj.sh and change `PROJ_BASE_DIR` to point to your project root directory
2. `source proj.sh` from your bash/zsh.

# "Fuzzy" search, eh?

proj.sh is a very straightforward 30-ish line bash script. All it does is turn your input into a file glob pattern and use it to find subdirectories that match:

```
proj 74            => ls ~/proj/*74*
proj pers blog     => ls ~/proj/*pers*blog*
proj supe secr pro => ls ~/proj/*supe*secr*proj*
```
```
proj pers blo / ima face  =>  /Users/peter/proj/08-personal-blog/images/my-face.png
```

# Now what?

Dunno.. Install it, use it many times a day while thinking of ways to make it better?
