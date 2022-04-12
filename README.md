# Solutions to Structure and Interpretation of Computer Programs

I am (very slowly) working through the classic textbook *Structure and Interpretation of Computer Programs*.

This is for my own personal practice and edification.

More than anything else, this repo exists to help me keep my place and not start over again for the `(inc times-started-SICP)`<sup>th</sup> time.

If you are a student viewing this repo at some undetermined future time after which I have made it public, under no circumstances whatsoever should these solutions be used for homework help. Everything here should be considered absolutely, totally, completely wrong. And if you do foolishly decide to copy my work and pass it off as your own and wind up failing, well then I told you so.

If you are a researcher or manager viewing this repo at some undertermined future time after which I have made it public, and I somehow actually did manage to get some of the answers right and you kinda like the code you see and would like me to join your lab/research group/team/whatever, then feel free to contact me through whatever means it is people use to contact each other on GitHub.


<dl>
<dt>4/11/22</dt>
<dd>Can't find my previous solutions to &sect; 1.2, so working through it again for the <code>(inc times-read-&sect;1.2)</code><sup>th</sup> time, and... I forgot how brutal chapter 1 is, teaching freshman computer science using functional programming with junior/senior-level numerical analysis as the motivating examples.
</dd>

<dt>4/12/22</dt>
<dd>Used data science instead of computer science to answer 1.15, which is almost certainly not the right way to do it. The data in <code>section-1.2-exercise-1.15-data.txt</code> is produced with 
<code><pre> 
    (for-each
      (lambda (d)
        (print
          (let ((r (degrees->radians d))
                (degrees->radians 
                  (lambda (d) (* d (/ pi 180)))))
            (list d r (sine r) (sin r) count-ps)))
        (newline))
      (range 0 1800))</pre></code>
</dd>

</dl>
