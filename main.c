/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: marvin <marvin@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/01 10:00:00 by marvin            #+#    #+#             */
/*   Updated: 2023/01/01 10:00:00 by marvin           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>

int main(void)
{
    printf("=== LIBASM TESTS ===\n\n");

    // Test ft_strlen
    printf("Testing ft_strlen:\n");
    printf("ft_strlen(\"Hello\"): %zu\n", ft_strlen("Hello"));
    printf("strlen(\"Hello\"): %zu\n", strlen("Hello"));
    printf("ft_strlen(\"\"): %zu\n", ft_strlen(""));
    printf("strlen(\"\"): %zu\n", strlen(""));
    printf("\n");

    // Test ft_strcpy
    printf("Testing ft_strcpy:\n");
    char dst1[100], dst2[100];
    printf("ft_strcpy: %s\n", ft_strcpy(dst1, "Hello World"));
    printf("strcpy: %s\n", strcpy(dst2, "Hello World"));
    printf("\n");

    // Test ft_strcmp
    printf("Testing ft_strcmp:\n");
    printf("ft_strcmp(\"abc\", \"abc\"): %d\n", ft_strcmp("abc", "abc"));
    printf("strcmp(\"abc\", \"abc\"): %d\n", strcmp("abc", "abc"));
    printf("ft_strcmp(\"abc\", \"abd\"): %d\n", ft_strcmp("abc", "abd"));
    printf("strcmp(\"abc\", \"abd\"): %d\n", strcmp("abc", "abd"));
    printf("ft_strcmp(\"abd\", \"abc\"): %d\n", ft_strcmp("abd", "abc"));
    printf("strcmp(\"abd\", \"abc\"): %d\n", strcmp("abd", "abc"));
    printf("\n");

    // Test ft_write
    printf("Testing ft_write:\n");
    printf("ft_write to stdout: ");
    ft_write(1, "Hello from ft_write!\n", 21);
    printf("write to stdout: ");
    write(1, "Hello from write!\n", 18);
    printf("\n");

    // Test ft_read
    printf("Testing ft_read:\n");
    int fd = open("main.c", O_RDONLY);
    if (fd != -1)
    {
        char buffer[100];
        ssize_t ret = ft_read(fd, buffer, 50);
        buffer[ret] = '\0';
        printf("Read %zd bytes: %.50s...\n", ret, buffer);
        close(fd);
    }
    printf("\n");

    // Test ft_strdup
    printf("Testing ft_strdup:\n");
    char *dup1 = ft_strdup("Hello World");
    char *dup2 = strdup("Hello World");
    printf("ft_strdup: %s\n", dup1);
    printf("strdup: %s\n", dup2);
    free(dup1);
    free(dup2);
    printf("\n");

    printf("All tests completed!\n");
    return (0);
}