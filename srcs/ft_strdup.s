# ft_strdup - 文字列を複製する関数
# 与えられた文字列のコピーを新しく確保したメモリ上に作成する
# 引数: %rdi = 複製する文字列のポインタ
# 戻り値: %rax = 新しく確保された複製文字列のポインタ（失敗時はNULL）

.section .text
.globl ft_strdup

ft_strdup:
    test %rdi, %rdi         # 入力文字列がNULLかチェック
    jz Lnull_return         # NULLの場合はNULLを返す
    
    push %rbp               # ベースポインタを保存
    mov %rsp, %rbp          # スタックフレームを設定
    push %rdi               # 元の文字列ポインタを保存
    
    call ft_strlen          # 文字列の長さを取得
    inc %rax                # ヌル文字分を追加（長さ+1）
    mov %rax, %rdi          # malloc用の引数に設定
    
    call malloc@PLT         # メモリを確保
    test %rax, %rax         # mallocが成功したかチェック
    jz Lmalloc_failed       # 失敗した場合はエラー処理へ
    
    mov %rax, %rdi          # 確保したメモリをコピー先に
    pop %rsi                # 元の文字列をコピー元に設定
    push %rdi               # 確保したメモリのポインタを保存
    
    call ft_strcpy          # 文字列をコピー
    pop %rax                # 確保したメモリのポインタを戻り値に
    
    leave                   # スタックフレームを復元
    ret                     # 複製された文字列のポインタを返す

Lnull_return:
    xor %rax, %rax          # NULLを返す
    ret

Lmalloc_failed:
    add $8, %rsp            # スタックを調整
    leave                   # スタックフレームを復元
    xor %rax, %rax          # NULLを返す（メモリ確保失敗）
    ret
