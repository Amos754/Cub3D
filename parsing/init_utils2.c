/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   init_utils2.c                                      :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: olmarech <olmarech@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/09/26 15:57:37 by olmarech          #+#    #+#             */
/*   Updated: 2024/10/02 13:15:06 by olmarech         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "../cub3d.h"

void	check_tmp(char **tmp, t_pars *pars, char **file_content)
{
	int	i;
	int	j;

	i = -1;
	while (tmp[++i])
	{
		j = -1;
		while (tmp[i][++j])
		{
			if (!(tmp[i][j] >= '0' && tmp[i][j] <= '9'))
			{
				free_tab(tmp);
				free_exit(pars, file_content, "Bad RGB info.", 1);
			}
		}
		if (ft_atoi(tmp[i]) > 255 || ft_atoi(tmp[i]) < 0)
		{
			free_tab(tmp);
			free_exit(pars, file_content, "RGB values are between 0-255.", 1);
		}
	}
}

void	init_rgb(t_pars *pars, char **tmp, int option, char **file_content)
{
	if (option == 1)
	{
		check_tmp(tmp, pars, file_content);
		pars->f_rgb[0] = ft_atoi(tmp[0]);
		pars->f_rgb[1] = ft_atoi(tmp[1]);
		pars->f_rgb[2] = ft_atoi(tmp[2]);
		free_tab(tmp);
	}
	else
	{
		check_tmp(tmp, pars, file_content);
		pars->c_rgb[0] = ft_atoi(tmp[0]);
		pars->c_rgb[1] = ft_atoi(tmp[1]);
		pars->c_rgb[2] = ft_atoi(tmp[2]);
		free_tab(tmp);
	}
}

char	**good_tmp(t_pars *pars, char **file_content, int index)
{
	int	i;
	int	counter;

	i = -1;
	counter = 0;
	while (file_content[index][++i])
		if (file_content[index][i] == ',')
			counter++;
	if (counter != 2)
		free_exit(pars, file_content, "Something went wrong.", 1);
	return (ft_split(file_content[index] + 2, ','));

}

void	init_map(char **file_content, t_pars *pars)
{
	int	i;

	i = -1;
	pars->map = malloc(sizeof(char *) * (size_tab(file_content) + 1));
	while (file_content[++i])
		pars->map[i] = ft_strdup(file_content[i]);
	pars->map[i] = NULL;
}
