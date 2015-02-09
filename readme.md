This repo contains sources for [**CS221. Computer Architecture**](http://edu.mmcs.sfedu.ru/course/view.php?id=170) course given 
at the [Institute of Mathematics, Mechanics and Computer Science](http://mmcs.sfedu.ru/), 
[Southern Federal University](http://sfedu.ru/) ([Computer Science and IT major](http://it.mmcs.sfedu.ru/)).

We use:

* plain text / Markdown to store the sources, 
* [`pandoc`](http://johnmacfarlane.net/pandoc/) to convert them to HTML,
* an [instance](http://edu.mmcs.sfedu.ru/) of [Moodle LMS](https://moodle.org/) to publish HTML to students.

The whole workflow is fully automated **for assignments** (`lessons` directory) so far, just run

	scripts/doAll.sh lessons/lesson-1.md

In order this automation to work properly you have to:

* install `pandoc` (obviously),
* obtain Python 2.7,
* reside in blessed `bash` environment,
* create `local_scripts/send_moodle.sh` following directions given in
  `local_scripts/readme.txt`,
  
besides:

* each lesson source md-file must expose corresponding assignment id in 
  Moodle (we assume, that assignments are pre-created and we only update their
  text) in its first line; cf. [lesson-1.md](https://bitbucket.org/Ulysses4ever/it211-programming-languages/raw/33d06cdc4d7ba35b16fcb408ba9aebfe7eb30074/lessons/unit-1-basic-cpp/lesson-1.md).
  
The repo contains a bunch of handy scripts, which are documented directly in their source and/or in the [wiki](https://bitbucket.org/Ulysses4ever/it211-programming-languages/wiki). E. g. the most straightforward way to obtain code for non-assignment materials (`pages` directory) is to run `getHeadlessHtml.sh` and manually copy HTML code which is already in your clipboard after that to Moodle (also you need `xlip` installed on your system to use this).

You'll probably like to have offline interactive MD editor. We suggest you to use Geany + corresponding plugin (found e.g. in Ubuntu repo) or LightTable / Sublime + corresponding plugins. They do not understand full pandoc Markdown but trying their best, so cheer up to them!
