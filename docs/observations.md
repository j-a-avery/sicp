# Progress/notes/microblog

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

  Went ahead and spent all day on a progress table, and maybe 15-20 minutes? (maybe half an hour?) on a quick Python script to merge it in the middle of the readme file. It currently resides in a Jupyter notebook (since that's the easiest way to experiment in Python, even for non-data science tasks), so it needs to move to a Python file, shebang and everything.

  Ugh, that's right, GitHub strips CSS from markdown. At this rate, I'm going to wind up putting everything in a GitHub Pages repo and writing my custom JAMstack blog compiler thing.

* **4/17/22** "Happy" Easter.

  I only half-finished exercise 2.3 last year, and I don't feel like spending time on it today. Exercise 2.9 is kind of answered, but I feel like I could do better; 2.9 and 2.11 feel related, so I'll circle back to them later. I kind of want to re-do all of &sect;2.1.4 in an OO language. I need to be working more of the proof problems, since the goal is PhD prep. Today's a holiday; that'll be my excuse.