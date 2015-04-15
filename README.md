m4 script for brainf*ck
=======================

[brainf*ck](http://ja.wikipedia.org/wiki/Brainfuck)を実行する[m4](http://ja.wikipedia.org/wiki/M4_(%E3%83%97%E3%83%AD%E3%82%B0%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0%E8%A8%80%E8%AA%9E))マクロです。

```
usage: m4 bf.m4 < input.bf
```

ある程度動きますが次のような制限があります:
 * 入力を受け取れない (`,'が使えない)
 * m4の制御文字がコードに含まれると正常に動かない
 * 特定の記号を出力するとおかしな事になる

## Samples

### Hello, world!

```SHELL
echo "+++++++++[>++++++++>+++++++++++>+++++<<<-]>.>++.+++++++..+++.>-.------------.<++++++++.--------.+++.------.--------.>+." | m4 bf.m4
```

### [sample](sample)について

次のページのものを拝借しました:
http://hakugetu.so.land.to/program/brainfuck/1-4.php
