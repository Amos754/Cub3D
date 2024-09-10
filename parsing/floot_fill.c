#include <stdlib.h>
#include <limits.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <math.h>
#include <fcntl.h>
#include "GNL/get_next_line.h"

char	*ft_strdup(char *s)
{
	int		i;
	int		size;
	char	*cpy;

	i = 0;
	size = ft_strlen(s);
	cpy = malloc(sizeof(char) * (size + 1));
	if (!cpy)
		return (NULL);
	while (s[i] != '\0')
	{
		cpy[i] = s[i];
		i++;
	}
	cpy[i] = '\0';
	return (cpy);
}

void	print_content(char **file_content)
{
	int	i;
	int	j;

	i = 0;
	while (file_content[i])
	{
		j = 0;
		while (file_content[i][j])
		{
			if (file_content[i][j] == '1')
				printf("\e[96m██\033[0m");
			else if (file_content[i][j] == '0')
				printf("\e[90m██\033[0m");
			else if (file_content[i][j] == 'N' | file_content[i][j] == 'S'
				| file_content[i][j] == 'E' | file_content[i][j] == 'W')
				printf("\033[0;32m██\033[0m");
			else if (file_content[i][j] == '2')
				printf("\033[1;31m██\033[0m");
			else if (file_content[i][j] == '	')
				printf("	");
			else
				printf("  ");
			j++;
			usleep(5000);
		}
		printf("\n");
		i++;
	}
}

int	main(int ac, char **av)
{
	int		fd;
	char	**file_content;
	char	*buff;
	int		i;

	i = 0;
	fd = open(av[1], O_RDWR, 677);
	file_content = malloc(sizeof(char **) * 9999999);
	while((buff = get_next_line(fd)))
	{
		file_content[i] = ft_strdup(buff);
		free(buff);
		i++;
	}
	print_content(file_content);
}