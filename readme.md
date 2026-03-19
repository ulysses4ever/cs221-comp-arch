## CS211 Computer Architecture (Artem Pelenitsyn)

This repo contains sources for **CS221 Computer Architecture**,
a course that was running (in this form) through 2012-2016 at the [Institute of Mathematics, Mechanics and Computer Science](http://mmcs.sfedu.ru/), 
([Southern Federal University](http://sfedu.ru/), [Computer Science and SE major](http://it.mmcs.sfedu.ru/)).
The old course page is [available in Web Archive](https://web.archive.org/web/20160616230157/http://edu.mmcs.sfedu.ru/course/view.php?id=170).


### Lectures

Just `cd` into `slides` and then `pdflatex lecture-XX.tex` to build a `lecture-XX.pdf` (XX is from 01 onwwards).

### Labs

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
  text) in its first line; cf. [lesson-1.md](https://bitbucket.org/Ulysses4ever/cs221-comp-arch/src/010360eb73394a6755bdb10aa5fa6a1cc8aa86d5/lessons/lesson-01.md?at=master).
  
The repo contains a bunch of handy scripts, which are documented directly in their source. E. g. the most straightforward way to obtain code for non-assignment materials (`pages` directory) is to run `getHeadlessHtml.sh` and manually copy HTML code which is already in your clipboard after that to Moodle (also you need `xlip` installed on your system to use this).

You'll probably like to have offline interactive MD editor. We suggest you to use Geany + corresponding plugin (found e.g. in Ubuntu repo) or LightTable / Sublime + corresponding plugins. They do not understand full pandoc Markdown but trying their best, so cheer up to them!

## License

This work is licensed under a [Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-nc-sa/4.0/).

![CC BY-NC-SA Icon](https://licensebuttons.net/l/by-nc-sa/4.0/88x31.png)

You are free to:
- **Share**: Copy and redistribute the material in any medium or format.
- **Adapt**: Remix, transform, and build upon the material.

Under the following terms:
- **Attribution**: You must give appropriate credit and provide a link to the license.
- **NonCommercial**: You may not use the material for commercial purposes.
- **ShareAlike**: If you remix or transform the material, you must distribute your contributions under the same license as the original.

