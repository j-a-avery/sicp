# Solutions to Structure and Interpretation of Computer Programs

I am (very slowly) working through the classic textbook *Structure and Interpretation of Computer Programs*.

This is for my own personal practice and edification.

More than anything else, this repo exists to help me keep my place and not start over again for the `(inc times-started-SICP)`<sup>th</sup> time.

Answers in Racket (which *should* be pretty much everything, but no) are written in DrRacket and exported to plain text using `File` -> `Save Other` -> `Save Definitions as Text…` and overwriting the file every. single. time. Everything else that isn't created using some obvious other tool (Jupyter Notebook, Draw.IO) is created in VS Code.

If you are a student viewing this repo at some undetermined future time after which I have made it public, under no circumstances whatsoever should these solutions be used for homework help. Everything here should be considered absolutely, totally, completely wrong. And if you do foolishly decide to copy my work and pass it off as your own and wind up failing, well then I told you so.

If you are a researcher or manager viewing this repo at some undertermined future time after which I have made it public, and I somehow actually did manage to get some of the answers right and you kinda like the code you see and would like me to join your lab/research group/team/whatever, then feel free to contact me through whatever means it is people use to contact each other on GitHub.

# Exercises Worked

<style>
  table {
    border-collapse: collapse;
    border-spacing: 0px;
    font-family: monospace;
  }

  td, th {
    padding: 5px;
    text-align: right;
    border: 1px solid #ccc;
  }

  .done {
    background-color: #d2f9d2;
    color: black;
  }
  
  .not-done {
    color: black;
  }

  .no-problem {
    background-color: #ccc;
  }
</style>
<table>
  <tr>
    <th>1.1</th>
    <td id="1_1"class="done">1&nbsp;&#10003;</td>
    <td id="1_2"class="done">2&nbsp;&#10003;</td>
    <td id="1_3"class="done">3&nbsp;&#10003;</td>
    <td id="1_4"class="done">4&nbsp;&#10003;</td>
    <td id="1_5"class="not-done">5&nbsp;&nbsp;</td>
    <td id="1_6"class="done">6&nbsp;&#10003;</td>
    <td id="1_7"class="not-done">7&nbsp;&nbsp;</td>
    <td id="1_8"class="not-done">8&nbsp;&nbsp;</td>
    <td colspan=28 class="no-problem"></td>
  </tr>
  <tr>
    <th>1.2</th>
    <td id="1_9"class="done">9&nbsp;&#10003;</td>
    <td id="1_10"class="done">10&nbsp;&#10003;</td>
    <td id="1_11"class="done">11&nbsp;&#10003;</td>
    <td id="1_12"class="done">12&nbsp;&#10003;</td>
    <td id="1_13"class="done">13&nbsp;&#10003;</td>
    <td id="1_14"class="done">14&nbsp;&#10003;</td>
    <td id="1_15"class="done">15&nbsp;&#10003;</td>
    <td id="1_16"class="done">16&nbsp;&#10003;</td>
    <td id="1_17"class="done">17&nbsp;&#10003;</td>
    <td id="1_18"class="done">18&nbsp;&#10003;</td>
    <td id="1_19"class="not-done">19&nbsp;&nbsp;</td>
    <td id="1_20"class="not-done">20&nbsp;&nbsp;</td>
    <td id="1_21"class="not-done">21&nbsp;&nbsp;</td>
    <td id="1_22"class="not-done">22&nbsp;&nbsp;</td>
    <td id="1_23"class="not-done">23&nbsp;&nbsp;</td>
    <td id="1_24"class="not-done">24&nbsp;&nbsp;</td>
    <td id="1_25"class="not-done">25&nbsp;&nbsp;</td>
    <td id="1_26"class="not-done">26&nbsp;&nbsp;</td>
    <td id="1_27"class="not-done">27&nbsp;&nbsp;</td>
    <td id="1_28"class="not-done">28&nbsp;&nbsp;</td>
    <td colspan=16 class="no-problem"></td>
  </tr>
  <tr>
    <th>1.3</th>
    <td id="1_29"class="not-done">29&nbsp;&nbsp;</td>
    <td id="1_30"class="not-done">30&nbsp;&nbsp;</td>
    <td id="1_31"class="not-done">31&nbsp;&nbsp;</td>
    <td id="1_32"class="not-done">32&nbsp;&nbsp;</td>
    <td id="1_33"class="not-done">33&nbsp;&nbsp;</td>
    <td id="1_34"class="not-done">34&nbsp;&nbsp;</td>
    <td id="1_35"class="not-done">35&nbsp;&nbsp;</td>
    <td id="1_36"class="not-done">36&nbsp;&nbsp;</td>
    <td id="1_37"class="done">37&nbsp;&#10003;</td>
    <td id="1_38"class="done">38&nbsp;&#10003;</td>
    <td id="1_39"class="done">39&nbsp;&#10003;</td>
    <td id="1_40"class="done">40&nbsp;&#10003;</td>
    <td id="1_41"class="done">41&nbsp;&#10003;</td>
    <td id="1_42"class="done">42&nbsp;&#10003;</td>
    <td id="1_43"class="done">43&nbsp;&#10003;</td>
    <td id="1_44"class="done">44&nbsp;&#10003;</td>
    <td id="1_45"class="not-done">45&nbsp;&nbsp;</td>
    <td id="1_46"class="not-done">46&nbsp;&nbsp;</td>
    <td colspan=18 class="no-problem"></td>
  </tr>
  <tr>
    <th>2.1</th>
    <td id="2_1"class="done">1&nbsp;&#10003;</td>
    <td id="2_2"class="done">2&nbsp;&#10003;</td>
    <td id="2_3"class="done">3&nbsp;&#10003;</td>
    <td id="2_4"class="done">4&nbsp;&#10003;</td>
    <td id="2_5"class="done">5&nbsp;&#10003;</td>
    <td id="2_6"class="done">6&nbsp;&#10003;</td>
    <td id="2_7"class="not-done">7&nbsp;&nbsp;</td>
    <td id="2_8"class="not-done">8&nbsp;&nbsp;</td>
    <td id="2_9"class="not-done">9&nbsp;&nbsp;</td>
    <td id="2_10"class="not-done">10&nbsp;&nbsp;</td>
    <td id="2_11"class="not-done">11&nbsp;&nbsp;</td>
    <td id="2_12"class="not-done">12&nbsp;&nbsp;</td>
    <td id="2_13"class="not-done">13&nbsp;&nbsp;</td>
    <td id="2_14"class="not-done">14&nbsp;&nbsp;</td>
    <td id="2_15"class="not-done">15&nbsp;&nbsp;</td>
    <td id="2_16"class="not-done">16&nbsp;&nbsp;</td>
    <td colspan=20 class="no-problem"></td>
  </tr>
  <tr>
    <th>2.2</th>
    <td id="2_17"class="not-done">17&nbsp;&nbsp;</td>
    <td id="2_18"class="not-done">18&nbsp;&nbsp;</td>
    <td id="2_19"class="not-done">19&nbsp;&nbsp;</td>
    <td id="2_20"class="not-done">20&nbsp;&nbsp;</td>
    <td id="2_21"class="not-done">21&nbsp;&nbsp;</td>
    <td id="2_22"class="not-done">22&nbsp;&nbsp;</td>
    <td id="2_23"class="not-done">23&nbsp;&nbsp;</td>
    <td id="2_24"class="not-done">24&nbsp;&nbsp;</td>
    <td id="2_25"class="not-done">25&nbsp;&nbsp;</td>
    <td id="2_26"class="not-done">26&nbsp;&nbsp;</td>
    <td id="2_27"class="not-done">27&nbsp;&nbsp;</td>
    <td id="2_28"class="not-done">28&nbsp;&nbsp;</td>
    <td id="2_29"class="not-done">29&nbsp;&nbsp;</td>
    <td id="2_30"class="not-done">30&nbsp;&nbsp;</td>
    <td id="2_31"class="not-done">31&nbsp;&nbsp;</td>
    <td id="2_32"class="not-done">32&nbsp;&nbsp;</td>
    <td id="2_33"class="not-done">33&nbsp;&nbsp;</td>
    <td id="2_34"class="not-done">34&nbsp;&nbsp;</td>
    <td id="2_35"class="not-done">35&nbsp;&nbsp;</td>
    <td id="2_36"class="not-done">36&nbsp;&nbsp;</td>
    <td id="2_37"class="not-done">37&nbsp;&nbsp;</td>
    <td id="2_38"class="not-done">38&nbsp;&nbsp;</td>
    <td id="2_39"class="not-done">39&nbsp;&nbsp;</td>
    <td id="2_40"class="not-done">40&nbsp;&nbsp;</td>
    <td id="2_41"class="not-done">41&nbsp;&nbsp;</td>
    <td id="2_42"class="not-done">42&nbsp;&nbsp;</td>
    <td id="2_43"class="not-done">43&nbsp;&nbsp;</td>
    <td id="2_44"class="not-done">44&nbsp;&nbsp;</td>
    <td id="2_45"class="not-done">45&nbsp;&nbsp;</td>
    <td id="2_46"class="not-done">46&nbsp;&nbsp;</td>
    <td id="2_47"class="not-done">47&nbsp;&nbsp;</td>
    <td id="2_48"class="not-done">48&nbsp;&nbsp;</td>
    <td id="2_49"class="not-done">49&nbsp;&nbsp;</td>
    <td id="2_50"class="not-done">50&nbsp;&nbsp;</td>
    <td id="2_51"class="not-done">51&nbsp;&nbsp;</td>
    <td id="2_52"class="not-done">52&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <th>2.3</th>
    <td id="2_53"class="not-done">53&nbsp;&nbsp;</td>
    <td id="2_54"class="not-done">54&nbsp;&nbsp;</td>
    <td id="2_55"class="not-done">55&nbsp;&nbsp;</td>
    <td id="2_56"class="not-done">56&nbsp;&nbsp;</td>
    <td id="2_57"class="not-done">57&nbsp;&nbsp;</td>
    <td id="2_58"class="not-done">58&nbsp;&nbsp;</td>
    <td id="2_59"class="not-done">59&nbsp;&nbsp;</td>
    <td id="2_60"class="not-done">60&nbsp;&nbsp;</td>
    <td id="2_61"class="not-done">61&nbsp;&nbsp;</td>
    <td id="2_62"class="not-done">62&nbsp;&nbsp;</td>
    <td id="2_63"class="not-done">63&nbsp;&nbsp;</td>
    <td id="2_64"class="not-done">64&nbsp;&nbsp;</td>
    <td id="2_65"class="not-done">65&nbsp;&nbsp;</td>
    <td id="2_66"class="not-done">66&nbsp;&nbsp;</td>
    <td id="2_67"class="not-done">67&nbsp;&nbsp;</td>
    <td id="2_68"class="not-done">68&nbsp;&nbsp;</td>
    <td id="2_69"class="not-done">69&nbsp;&nbsp;</td>
    <td id="2_70"class="not-done">70&nbsp;&nbsp;</td>
    <td id="2_71"class="not-done">71&nbsp;&nbsp;</td>
    <td id="2_72"class="not-done">72&nbsp;&nbsp;</td>
    <td colspan=16 class="no-problem"></td>
  </tr>
  <tr>
    <th>2.4</th>
    <td id="2_73"class="not-done">73&nbsp;&nbsp;</td>
    <td id="2_74"class="not-done">74&nbsp;&nbsp;</td>
    <td id="2_75"class="not-done">75&nbsp;&nbsp;</td>
    <td id="2_76"class="not-done">76&nbsp;&nbsp;</td>
    <td colspan=32 class="no-problem"></td>
  </tr>
  <tr>
    <th>2.5</th>
    <td id="2_77"class="not-done">77&nbsp;&nbsp;</td>
    <td id="2_78"class="not-done">78&nbsp;&nbsp;</td>
    <td id="2_79"class="not-done">79&nbsp;&nbsp;</td>
    <td id="2_80"class="not-done">80&nbsp;&nbsp;</td>
    <td id="2_81"class="not-done">81&nbsp;&nbsp;</td>
    <td id="2_82"class="not-done">82&nbsp;&nbsp;</td>
    <td id="2_83"class="not-done">83&nbsp;&nbsp;</td>
    <td id="2_84"class="not-done">84&nbsp;&nbsp;</td>
    <td id="2_85"class="not-done">85&nbsp;&nbsp;</td>
    <td id="2_86"class="not-done">86&nbsp;&nbsp;</td>
    <td id="2_87"class="not-done">87&nbsp;&nbsp;</td>
    <td id="2_88"class="not-done">88&nbsp;&nbsp;</td>
    <td id="2_89"class="not-done">89&nbsp;&nbsp;</td>
    <td id="2_90"class="not-done">90&nbsp;&nbsp;</td>
    <td id="2_91"class="not-done">91&nbsp;&nbsp;</td>
    <td id="2_92"class="not-done">92&nbsp;&nbsp;</td>
    <td id="2_93"class="not-done">93&nbsp;&nbsp;</td>
    <td id="2_94"class="not-done">94&nbsp;&nbsp;</td>
    <td id="2_95"class="not-done">95&nbsp;&nbsp;</td>
    <td id="2_96"class="not-done">96&nbsp;&nbsp;</td>
    <td id="2_97"class="not-done">97&nbsp;&nbsp;</td>
    <td colspan=15 class="no-problem"></td>
  </tr>
  <tr>
    <th>3.1</th>
    <td id="3_1"class="not-done">1&nbsp;&nbsp;</td>
    <td id="3_2"class="not-done">2&nbsp;&nbsp;</td>
    <td id="3_3"class="not-done">3&nbsp;&nbsp;</td>
    <td id="3_4"class="not-done">4&nbsp;&nbsp;</td>
    <td id="3_5"class="not-done">5&nbsp;&nbsp;</td>
    <td id="3_6"class="not-done">6&nbsp;&nbsp;</td>
    <td id="3_7"class="not-done">7&nbsp;&nbsp;</td>
    <td id="3_8"class="not-done">8&nbsp;&nbsp;</td>
    <td colspan=28 class="no-problem"></td>
  </tr>
  <tr>
    <th>3.2</th>
    <td id="3_9"class="not-done">9&nbsp;&nbsp;</td>
    <td id="3_10"class="not-done">10&nbsp;&nbsp;</td>
    <td id="3_11"class="not-done">11&nbsp;&nbsp;</td>
    <td colspan=33 class="no-problem"></td>
  </tr>
  <tr>
    <th>3.3</th>
    <td id="3_12"class="not-done">12&nbsp;&nbsp;</td>
    <td id="3_13"class="not-done">13&nbsp;&nbsp;</td>
    <td id="3_14"class="not-done">14&nbsp;&nbsp;</td>
    <td id="3_15"class="not-done">15&nbsp;&nbsp;</td>
    <td id="3_16"class="not-done">16&nbsp;&nbsp;</td>
    <td id="3_17"class="not-done">17&nbsp;&nbsp;</td>
    <td id="3_18"class="not-done">18&nbsp;&nbsp;</td>
    <td id="3_19"class="not-done">19&nbsp;&nbsp;</td>
    <td id="3_20"class="not-done">20&nbsp;&nbsp;</td>
    <td id="3_21"class="not-done">21&nbsp;&nbsp;</td>
    <td id="3_22"class="not-done">22&nbsp;&nbsp;</td>
    <td id="3_23"class="not-done">23&nbsp;&nbsp;</td>
    <td id="3_24"class="not-done">24&nbsp;&nbsp;</td>
    <td id="3_25"class="not-done">25&nbsp;&nbsp;</td>
    <td id="3_26"class="not-done">26&nbsp;&nbsp;</td>
    <td id="3_27"class="not-done">27&nbsp;&nbsp;</td>
    <td id="3_28"class="not-done">28&nbsp;&nbsp;</td>
    <td id="3_29"class="not-done">29&nbsp;&nbsp;</td>
    <td id="3_30"class="not-done">30&nbsp;&nbsp;</td>
    <td id="3_31"class="not-done">31&nbsp;&nbsp;</td>
    <td id="3_32"class="not-done">32&nbsp;&nbsp;</td>
    <td id="3_33"class="not-done">33&nbsp;&nbsp;</td>
    <td id="3_34"class="not-done">34&nbsp;&nbsp;</td>
    <td id="3_35"class="not-done">35&nbsp;&nbsp;</td>
    <td id="3_36"class="not-done">36&nbsp;&nbsp;</td>
    <td id="3_37"class="not-done">37&nbsp;&nbsp;</td>
    <td colspan=10 class="no-problem"></td>
  </tr>
  <tr>
    <th>3.4</th>
    <td id="3_38"class="not-done">38&nbsp;&nbsp;</td>
    <td id="3_39"class="not-done">39&nbsp;&nbsp;</td>
    <td id="3_40"class="not-done">40&nbsp;&nbsp;</td>
    <td id="3_41"class="not-done">41&nbsp;&nbsp;</td>
    <td id="3_42"class="not-done">42&nbsp;&nbsp;</td>
    <td id="3_43"class="not-done">43&nbsp;&nbsp;</td>
    <td id="3_44"class="not-done">44&nbsp;&nbsp;</td>
    <td id="3_45"class="not-done">45&nbsp;&nbsp;</td>
    <td id="3_46"class="not-done">46&nbsp;&nbsp;</td>
    <td id="3_47"class="not-done">47&nbsp;&nbsp;</td>
    <td id="3_48"class="not-done">48&nbsp;&nbsp;</td>
    <td id="3_49"class="not-done">49&nbsp;&nbsp;</td>
    <td colspan=24 class="no-problem"></td>
  </tr>
  <tr>
    <th>3.5</th>
    <td id="3_50"class="not-done">50&nbsp;&nbsp;</td>
    <td id="3_51"class="not-done">51&nbsp;&nbsp;</td>
    <td id="3_52"class="not-done">52&nbsp;&nbsp;</td>
    <td id="3_53"class="not-done">53&nbsp;&nbsp;</td>
    <td id="3_54"class="not-done">54&nbsp;&nbsp;</td>
    <td id="3_55"class="not-done">55&nbsp;&nbsp;</td>
    <td id="3_56"class="not-done">56&nbsp;&nbsp;</td>
    <td id="3_57"class="not-done">57&nbsp;&nbsp;</td>
    <td id="3_58"class="not-done">58&nbsp;&nbsp;</td>
    <td id="3_59"class="not-done">59&nbsp;&nbsp;</td>
    <td id="3_60"class="not-done">60&nbsp;&nbsp;</td>
    <td id="3_61"class="not-done">61&nbsp;&nbsp;</td>
    <td id="3_62"class="not-done">62&nbsp;&nbsp;</td>
    <td id="3_63"class="not-done">63&nbsp;&nbsp;</td>
    <td id="3_64"class="not-done">64&nbsp;&nbsp;</td>
    <td id="3_65"class="not-done">65&nbsp;&nbsp;</td>
    <td id="3_66"class="not-done">66&nbsp;&nbsp;</td>
    <td id="3_67"class="not-done">67&nbsp;&nbsp;</td>
    <td id="3_68"class="not-done">68&nbsp;&nbsp;</td>
    <td id="3_69"class="not-done">69&nbsp;&nbsp;</td>
    <td id="3_70"class="not-done">70&nbsp;&nbsp;</td>
    <td id="3_71"class="not-done">71&nbsp;&nbsp;</td>
    <td id="3_72"class="not-done">72&nbsp;&nbsp;</td>
    <td id="3_73"class="not-done">73&nbsp;&nbsp;</td>
    <td id="3_74"class="not-done">74&nbsp;&nbsp;</td>
    <td id="3_75"class="not-done">75&nbsp;&nbsp;</td>
    <td id="3_76"class="not-done">76&nbsp;&nbsp;</td>
    <td id="3_77"class="not-done">77&nbsp;&nbsp;</td>
    <td id="3_78"class="not-done">78&nbsp;&nbsp;</td>
    <td id="3_79"class="not-done">79&nbsp;&nbsp;</td>
    <td id="3_80"class="not-done">80&nbsp;&nbsp;</td>
    <td id="3_81"class="not-done">81&nbsp;&nbsp;</td>
    <td id="3_82"class="not-done">82&nbsp;&nbsp;</td>
    <td colspan=3 class="no-problem"></td>
  </tr>
  <tr>
    <th>4.1</th>
    <td id="4_1"class="not-done">1&nbsp;&nbsp;</td>
    <td id="4_2"class="not-done">2&nbsp;&nbsp;</td>
    <td id="4_3"class="not-done">3&nbsp;&nbsp;</td>
    <td id="4_4"class="not-done">4&nbsp;&nbsp;</td>
    <td id="4_5"class="not-done">5&nbsp;&nbsp;</td>
    <td id="4_6"class="not-done">6&nbsp;&nbsp;</td>
    <td id="4_7"class="not-done">7&nbsp;&nbsp;</td>
    <td id="4_8"class="not-done">8&nbsp;&nbsp;</td>
    <td id="4_9"class="not-done">9&nbsp;&nbsp;</td>
    <td id="4_10"class="not-done">10&nbsp;&nbsp;</td>
    <td id="4_11"class="not-done">11&nbsp;&nbsp;</td>
    <td id="4_12"class="not-done">12&nbsp;&nbsp;</td>
    <td id="4_13"class="not-done">13&nbsp;&nbsp;</td>
    <td id="4_14"class="not-done">14&nbsp;&nbsp;</td>
    <td id="4_15"class="not-done">15&nbsp;&nbsp;</td>
    <td id="4_16"class="not-done">16&nbsp;&nbsp;</td>
    <td id="4_17"class="not-done">17&nbsp;&nbsp;</td>
    <td id="4_18"class="not-done">18&nbsp;&nbsp;</td>
    <td id="4_19"class="not-done">19&nbsp;&nbsp;</td>
    <td id="4_20"class="not-done">20&nbsp;&nbsp;</td>
    <td id="4_21"class="not-done">21&nbsp;&nbsp;</td>
    <td id="4_22"class="not-done">22&nbsp;&nbsp;</td>
    <td id="4_23"class="not-done">23&nbsp;&nbsp;</td>
    <td id="4_24"class="not-done">24&nbsp;&nbsp;</td>
    <td colspan=12 class="no-problem"></td>
  </tr>
  <tr>
    <th>4.2</th>
    <td id="4_25"class="not-done">25&nbsp;&nbsp;</td>
    <td id="4_26"class="not-done">26&nbsp;&nbsp;</td>
    <td id="4_27"class="not-done">27&nbsp;&nbsp;</td>
    <td id="4_28"class="not-done">28&nbsp;&nbsp;</td>
    <td id="4_29"class="not-done">29&nbsp;&nbsp;</td>
    <td id="4_30"class="not-done">30&nbsp;&nbsp;</td>
    <td id="4_31"class="not-done">31&nbsp;&nbsp;</td>
    <td id="4_32"class="not-done">32&nbsp;&nbsp;</td>
    <td id="4_33"class="not-done">33&nbsp;&nbsp;</td>
    <td id="4_34"class="not-done">34&nbsp;&nbsp;</td>
    <td colspan=26 class="no-problem"></td>
  </tr>
  <tr>
    <th>4.3</th>
    <td id="4_35"class="not-done">35&nbsp;&nbsp;</td>
    <td id="4_36"class="not-done">36&nbsp;&nbsp;</td>
    <td id="4_37"class="not-done">37&nbsp;&nbsp;</td>
    <td id="4_38"class="not-done">38&nbsp;&nbsp;</td>
    <td id="4_39"class="not-done">39&nbsp;&nbsp;</td>
    <td id="4_40"class="not-done">40&nbsp;&nbsp;</td>
    <td id="4_41"class="not-done">41&nbsp;&nbsp;</td>
    <td id="4_42"class="not-done">42&nbsp;&nbsp;</td>
    <td id="4_43"class="not-done">43&nbsp;&nbsp;</td>
    <td id="4_44"class="not-done">44&nbsp;&nbsp;</td>
    <td id="4_45"class="not-done">45&nbsp;&nbsp;</td>
    <td id="4_46"class="not-done">46&nbsp;&nbsp;</td>
    <td id="4_47"class="not-done">47&nbsp;&nbsp;</td>
    <td id="4_48"class="not-done">48&nbsp;&nbsp;</td>
    <td id="4_49"class="not-done">49&nbsp;&nbsp;</td>
    <td id="4_50"class="not-done">50&nbsp;&nbsp;</td>
    <td id="4_51"class="not-done">51&nbsp;&nbsp;</td>
    <td id="4_52"class="not-done">52&nbsp;&nbsp;</td>
    <td id="4_53"class="not-done">53&nbsp;&nbsp;</td>
    <td id="4_54"class="not-done">54&nbsp;&nbsp;</td>
    <td colspan=16 class="no-problem"></td>
  </tr>
  <tr>
    <th>4.4</th>
    <td id="4_55"class="not-done">55&nbsp;&nbsp;</td>
    <td id="4_56"class="not-done">56&nbsp;&nbsp;</td>
    <td id="4_57"class="not-done">57&nbsp;&nbsp;</td>
    <td id="4_58"class="not-done">58&nbsp;&nbsp;</td>
    <td id="4_59"class="not-done">59&nbsp;&nbsp;</td>
    <td id="4_60"class="not-done">60&nbsp;&nbsp;</td>
    <td id="4_61"class="not-done">61&nbsp;&nbsp;</td>
    <td id="4_62"class="not-done">62&nbsp;&nbsp;</td>
    <td id="4_63"class="not-done">63&nbsp;&nbsp;</td>
    <td id="4_64"class="not-done">64&nbsp;&nbsp;</td>
    <td id="4_65"class="not-done">65&nbsp;&nbsp;</td>
    <td id="4_66"class="not-done">66&nbsp;&nbsp;</td>
    <td id="4_67"class="not-done">67&nbsp;&nbsp;</td>
    <td id="4_68"class="not-done">68&nbsp;&nbsp;</td>
    <td id="4_69"class="not-done">69&nbsp;&nbsp;</td>
    <td id="4_70"class="not-done">70&nbsp;&nbsp;</td>
    <td id="4_71"class="not-done">71&nbsp;&nbsp;</td>
    <td id="4_72"class="not-done">72&nbsp;&nbsp;</td>
    <td id="4_73"class="not-done">73&nbsp;&nbsp;</td>
    <td id="4_74"class="not-done">74&nbsp;&nbsp;</td>
    <td id="4_75"class="not-done">75&nbsp;&nbsp;</td>
    <td id="4_76"class="not-done">76&nbsp;&nbsp;</td>
    <td id="4_77"class="not-done">77&nbsp;&nbsp;</td>
    <td id="4_78"class="not-done">78&nbsp;&nbsp;</td>
    <td id="4_79"class="not-done">79&nbsp;&nbsp;</td>
    <td colspan=11 class="no-problem"></td>
  </tr>
  <tr>
    <th>5.1</th>
    <td id="5_1"class="not-done">1&nbsp;&nbsp;</td>
    <td id="5_2"class="not-done">2&nbsp;&nbsp;</td>
    <td id="5_3"class="not-done">3&nbsp;&nbsp;</td>
    <td id="5_4"class="not-done">4&nbsp;&nbsp;</td>
    <td id="5_5"class="not-done">5&nbsp;&nbsp;</td>
    <td id="5_6"class="not-done">6&nbsp;&nbsp;</td>
    <td colspan=30 class="no-problem"></td>
  </tr>
  <tr>
    <th>5.2</th>
    <td id="5_7"class="not-done">7&nbsp;&nbsp;</td>
    <td id="5_8"class="not-done">8&nbsp;&nbsp;</td>
    <td id="5_9"class="not-done">9&nbsp;&nbsp;</td>
    <td id="5_10"class="not-done">10&nbsp;&nbsp;</td>
    <td id="5_11"class="not-done">11&nbsp;&nbsp;</td>
    <td id="5_12"class="not-done">12&nbsp;&nbsp;</td>
    <td id="5_13"class="not-done">13&nbsp;&nbsp;</td>
    <td id="5_14"class="not-done">14&nbsp;&nbsp;</td>
    <td id="5_15"class="not-done">15&nbsp;&nbsp;</td>
    <td id="5_16"class="not-done">16&nbsp;&nbsp;</td>
    <td id="5_17"class="not-done">17&nbsp;&nbsp;</td>
    <td id="5_18"class="not-done">18&nbsp;&nbsp;</td>
    <td id="5_19"class="not-done">19&nbsp;&nbsp;</td>
    <td colspan=23 class="no-problem"></td>
  </tr>
  <tr>
    <th>5.3</th>
    <td id="5_20"class="not-done">20&nbsp;&nbsp;</td>
    <td id="5_21"class="not-done">21&nbsp;&nbsp;</td>
    <td id="5_22"class="not-done">22&nbsp;&nbsp;</td>
    <td colspan=33 class="no-problem"></td>
  </tr>
  <tr>
    <th>5.4</th>
    <td id="5_23"class="not-done">23&nbsp;&nbsp;</td>
    <td id="5_24"class="not-done">24&nbsp;&nbsp;</td>
    <td id="5_25"class="not-done">25&nbsp;&nbsp;</td>
    <td id="5_26"class="not-done">26&nbsp;&nbsp;</td>
    <td id="5_27"class="not-done">27&nbsp;&nbsp;</td>
    <td id="5_28"class="not-done">28&nbsp;&nbsp;</td>
    <td id="5_29"class="not-done">29&nbsp;&nbsp;</td>
    <td id="5_30"class="not-done">30&nbsp;&nbsp;</td>
    <td colspan=28 class="no-problem"></td>
  </tr>
  <tr>
    <th>5.5</th>
    <td id="5_31"class="not-done">31&nbsp;&nbsp;</td>
    <td id="5_32"class="not-done">32&nbsp;&nbsp;</td>
    <td id="5_33"class="not-done">33&nbsp;&nbsp;</td>
    <td id="5_34"class="not-done">34&nbsp;&nbsp;</td>
    <td id="5_35"class="not-done">35&nbsp;&nbsp;</td>
    <td id="5_36"class="not-done">36&nbsp;&nbsp;</td>
    <td id="5_37"class="not-done">37&nbsp;&nbsp;</td>
    <td id="5_38"class="not-done">38&nbsp;&nbsp;</td>
    <td id="5_39"class="not-done">39&nbsp;&nbsp;</td>
    <td id="5_40"class="not-done">40&nbsp;&nbsp;</td>
    <td id="5_41"class="not-done">41&nbsp;&nbsp;</td>
    <td id="5_42"class="not-done">42&nbsp;&nbsp;</td>
    <td id="5_43"class="not-done">43&nbsp;&nbsp;</td>
    <td id="5_44"class="not-done">44&nbsp;&nbsp;</td>
    <td id="5_45"class="not-done">45&nbsp;&nbsp;</td>
    <td id="5_46"class="not-done">46&nbsp;&nbsp;</td>
    <td id="5_47"class="not-done">47&nbsp;&nbsp;</td>
    <td id="5_48"class="not-done">48&nbsp;&nbsp;</td>
    <td id="5_49"class="not-done">49&nbsp;&nbsp;</td>
    <td id="5_50"class="not-done">50&nbsp;&nbsp;</td>
    <td id="5_51"class="not-done">51&nbsp;&nbsp;</td>
    <td id="5_52"class="not-done">52&nbsp;&nbsp;</td>
    <td colspan=14 class="no-problem"></td>
  </tr>
</table>## Progress/notes/microblog, whatever you want to call it

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