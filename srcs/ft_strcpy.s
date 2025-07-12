# ft_strcpy - コピー元からコピー先へ文字列をコピーする関数
# srcが指す文字列をdestが指すバッファにコピーする
# 引数: %rdi = コピー先文字列, %rsi = コピー元文字列
# 戻り値: %rax = コピー先文字列のポインタ

.section .text
.globl ft_strcpy

ft_strcpy:
    mov %rdi, %rax          # 戻り値用にコピー先ポインタを保存
    test %rdi, %rdi         # コピー先ポインタがNULLかチェック
    jz Ldone                # NULLの場合はすぐに戻る
    test %rsi, %rsi         # コピー元ポインタがNULLかチェック
    jz Ldone                # NULLの場合はすぐに戻る

Lloop:
    movb (%rsi), %cl        # コピー元文字列から1バイトを%clに読み込み
    movb %cl, (%rdi)        # そのバイトをコピー先文字列に格納
    test %cl, %cl           # そのバイトがヌル文字かチェック
    jz Ldone                # ヌル文字なら完了
    inc %rdi                # コピー先の次の位置に移動
    inc %rsi                # コピー元の次の位置に移動
    jmp Lloop               # ループを続行

Ldone:
    ret                     # %raxにコピー先ポインタを返す