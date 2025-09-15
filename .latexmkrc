#!/usr/bin/env perl
# ==== Engine / Tools ====
$latex      = 'platex -interaction=nonstopmode -kanji=utf8 -shell-escape %O %S';
$bibtex     = 'pbibtex -kanji=utf8 %O %B';
$dvipdf     = 'dvipdfmx %O -o %D %S';
$makeindex  = 'mendex %O -o %D %S';
$max_repeat = 5;

# pLaTeX -> DVI -> PDF(dvipdfmx)
$pdf_mode = 3;

# ==== Directory layout ====
# 補助ファイルは build/ に集約。PDFはルートに残す（$out_dirは未設定のまま）
$aux_dir           = 'build';
$emulate_aux_dir   = 1;   # エンジン未対応時も擬似的に補助ファイルを移動

# 無ければ作成（Dockerでも安全）
BEGIN { system('mkdir','-p','build') unless -d 'build'; }

# ==== Cleaning rules ====
# latexmk -c で削除する拡張子を拡張（DVIやSyncTeXも対象）
$clean_ext = join(' ',
  qw(
    aux log fls fdb_latexmk
    out toc lof lot idx ilg ind
    bbl bcf blg run.xml
    acr acn alg glg glo gls ist
    snm nav
    dvi synctex.gz
  )
);

# cusdepなど派生生成物も -c で削除
$cleanup_includes_generated = 1;

# ==== Optional: quiet output ====
# $silence_logfile_warnings = 1;

# ==== End ====
