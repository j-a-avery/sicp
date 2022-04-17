# Solutions to Structure and Interpretation of Computer Programs

I am (very slowly) working through the classic textbook *Structure and Interpretation of Computer Programs*.

This is for my own personal practice and edification.

More than anything else, this repo exists to help me keep my place and not start over again for the `(inc times-started-SICP)`<sup>th</sup> time.

Answers in Racket (which *should* be pretty much everything, but no) are written in DrRacket and exported to plain text using `File` -> `Save Other` -> `Save Definitions as Text…` and overwriting the file every. single. time. Everything else that isn't created using some obvious other tool (Jupyter Notebook, Draw.IO) is created in VS Code.

If you are a student viewing this repo at some undetermined future time after which I have made it public, under no circumstances whatsoever should these solutions be used for homework help. Everything here should be considered absolutely, totally, completely wrong. And if you do foolishly decide to copy my work and pass it off as your own and wind up failing, well then I told you so.

If you are a researcher or manager viewing this repo at some undertermined future time after which I have made it public, and I somehow actually did manage to get some of the answers right and you kinda like the code you see and would like me to join your lab/research group/team/whatever, then feel free to contact me through whatever means it is people use to contact each other on GitHub.

## Progress/notes/microblog, whatever you want to call it

* **4/11/22** Can't find my previous solutions to &sect; 1.2, so working through it again for the <code>(inc times-read-&sect;1.2)</code><sup>th</sup> time, and... I forgot how brutal chapter 1 is, teaching freshman computer science using functional programming with junior/senior-level numerical analysis as the motivating examples.

* **4/12/22** Used data science instead of computer science to answer 1.15, which is almost certainly not the right way to do it. The data in <code>section-1.2-exercise-1.15-data.txt</code> is produced with 
```scheme
      (for-each
        (lambda (d)
          (print
            (let ((r (degrees->radians d))
                  (degrees->radians 
                  (lambda (d) (* d (/ pi 180)))))
              (list d r (sine r) (sin r) count-ps)))
          (newline))
        (range 0 1800))
  ```

* **4/13/22** Oh, so now we're teaching loop invariants to freshmen as an offhand remark during an exercise? They say COVID is a vascular disease that affects everything, including the brain. I had COVID three months ago tomorrow. I remember 1.16-1.18 being easy. I've spent two hours on 1.16 and I can't %$@#ing get it.

* **4/14/22** 4-6 hours total. Duh. *a* and *b* can *both* change between calls of `fast-expt-iter`. [facepalm]

* **4/16/22** On to chapter 2! Being completionist is getting in the way of learning efficiently. (Plus I broke the spine of my book, so page 73-74 is coming dangerously close to falling out altogether, so I want to avoid /[re]+/-reading &sect;1.3.) Reread 2.1, maybe revisit a problem or two, then start 2.2. If Chapter 1 is a [frighteningly-advanced] Scheme-based version of [what I know as] [COSC 1436-COSC-1437](https://reportcenter.highered.texas.gov/training-materials/lower-division-academic-course-guide-spring-21/ "The Texas Academic Course Guide Manual (ACGM); other states have similar systems.") &#215; topics from junior/master's-level numerical analysis, and chapter 2 looks to be a Scheme-based version of [COSC-2436](https://reportcenter.highered.texas.gov/training-materials/lower-division-academic-course-guide-spring-21/ "Also the ACGM"), then Chapters 3-5 are really the meat of what I want to get into anyway.

  Spent WAY too much time today working on a progress file generator. After I took it out and said a piece of paper will do. I'll add it to the repo when it's presentable. Maybe I'll rewrite it in Racket, too.