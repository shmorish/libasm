# ft_read - ファイルからデータを読み込む関数
# ファイルディスクリプタからバッファにデータを読み込む
# 引数: %rdi = ファイルディスクリプタ, %rsi = バッファ, %rdx = 読み込みバイト数
# 戻り値: %rax = 実際に読み込んだバイト数、エラーの場合は-1

.section .text
.globl ft_read

ft_read:
    mov $0, %rax            # Linuxのreadシステムコール番号（0）を設定
    syscall                 # システムコールを実行
    jc Lerror               # キャリーフラグが立っていればエラー処理へ
    ret                     # 正常終了、読み込みバイト数を返す

Lerror:
    neg %rax                # エラーコードを正の値に変換
    mov %rax, %rdi          # エラーコードを引数に設定
    call __errno_location@PLT # errnoの場所を取得
    mov %edi, (%rax)        # errnoにエラーコードを設定
    mov $-1, %rax           # 戻り値を-1に設定
    ret                     # エラーを返す
