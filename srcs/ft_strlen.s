# ft_strlen - 文字列の長さを計算する関数
# ヌル終端文字列の長さを返す
# 引数: %rdi = 文字列のポインタ
# 戻り値: %rax = 文字列の長さ

.section .text
.globl ft_strlen

ft_strlen:
    xor %rax, %rax          # 長さカウンタを0で初期化
    test %rdi, %rdi         # 文字列ポインタがNULLかチェック
    jz Ldone                # NULLの場合は0を返す

Lloop:
    cmpb $0, (%rdi,%rax)    # string[rax]の文字と0（ヌル文字）を比較
    je Ldone                # ヌル文字が見つかったら終了へジャンプ
    inc %rax                # 長さカウンタをインクリメント
    jmp Lloop               # ループを続行

Ldone:
    ret                     # %raxに格納された長さを返す
