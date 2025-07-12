# ft_strcmp - 二つの文字列を比較する関数
# 二つのヌル終端文字列を辞書順で比較する
# 引数: %rdi = 第一文字列, %rsi = 第二文字列
# 戻り値: %rax = s1 < s2なら負の値, s1 == s2なら0, s1 > s2なら正の値

.section .text
.globl ft_strcmp

ft_strcmp:
    test %rdi, %rdi         # 第一文字列がNULLかチェック
    jz Lnull_check          # NULLポインタの場合を処理
    test %rsi, %rsi         # 第二文字列がNULLかチェック
    jz Lnull_check          # NULLポインタの場合を処理

Lloop:
    movb (%rdi), %al        # 第一文字列から1バイト読み込み
    movb (%rsi), %cl        # 第二文字列から1バイト読み込み
    cmp %al, %cl            # 二つのバイトを比較
    jne Ldifferent          # 異なる場合は差を計算
    test %al, %al           # ヌル文字に到達したかチェック
    jz Lequal               # ヌル文字なら文字列は同じ
    inc %rdi                # 第一文字列の次の文字に移動
    inc %rsi                # 第二文字列の次の文字に移動
    jmp Lloop               # 比較を続行

Ldifferent:
    movzbl %al, %eax        # 第一バイトを32ビットにゼロ拡張
    movzbl %cl, %ecx        # 第二バイトを32ビットにゼロ拡張
    sub %ecx, %eax          # 差を計算 (s1[i] - s2[i])
    ret                     # 差を返す

Lequal:
    xor %eax, %eax          # 戻り値を0に設定（文字列が同じ）
    ret

Lnull_check:
    cmp %rdi, %rsi          # 両方のポインタを比較
    je Lequal               # 両方がNULLなら同じ
    test %rdi, %rdi         # 第一文字列がNULLかチェック
    jz Ls1_null             # s1がNULLなら s1 < s2
    mov $1, %eax            # s2がNULL, s1 > s2
    ret
Ls1_null:
    mov $-1, %eax           # s1がNULL, s1 < s2
    ret