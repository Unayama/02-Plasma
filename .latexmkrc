#!/usr/bin/env perl
$latex = 'platex -interaction=nonstopmode -kanji=utf8 -shell-escape %O %S';
#$latex = 'platex -kanji=utf8 %O %S'; # nonstopmodeを外す
$bibtex     = 'pbibtex -kanji=utf8 %O %B'; # 必要なら
$dvipdf     = 'dvipdfmx %O -o %D %S';
$makeindex  = 'mendex %O -o %D %S'; # 必要なら
$max_repeat = 5;
$pdf_mode = 3;
