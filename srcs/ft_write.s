# ft_write - ファイルにデータを書き込む関数
# バッファからファイルディスクリプタにデータを書き込む
# 引数: %rdi = ファイルディスクリプタ, %rsi = バッファ, %rdx = 書き込みバイト数
# 戻り値: %rax = 実際に書き込んだバイト数、エラーの場合は-1

.section .text
.globl ft_write

ft_write:
    mov $1, %rax            # Linuxのwriteシステムコール番号（1）を設定
    syscall                 # システムコールを実行
    jc Lerror               # キャリーフラグが立っていればエラー処理へ
    ret                     # 正常終了、書き込みバイト数を返す

Lerror:
    neg %rax                # エラーコードを正の値に変換
    mov %rax, %rdi          # エラーコードを引数に設定
    call __errno_location@PLT # errnoの場所を取得
    mov %edi, (%rax)        # errnoにエラーコードを設定
    mov $-1, %rax           # 戻り値を-1に設定
    ret                     # エラーを返す
