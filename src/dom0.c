/*
 * Copyright (c) 2024 EPAM Systems
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <domain.h>
#include <zephyr/kernel.h>
#include <zephyr/logging/log.h>

LOG_MODULE_REGISTER(dom0);

#include "dom0.h"

extern struct dom0_domain_cfg domain_cfgs[];

int domain_get_user_cfg_count(void)
{
	int i = 0;

	while (domain_cfgs[i].domain_cfg) {
		i++;
	}

	return i;
}

struct xen_domain_cfg *domain_get_user_cfg(int index)
{
	if (index < domain_get_user_cfg_count()) {
		return domain_cfgs[index].domain_cfg;
	}

	return NULL;
}

int main(void)
{
	int ret;
	int i = 0;

	ret = storage_init();
	if (ret) {
		goto exit_err;
	}

	/* init domains cfg */
	while (domain_cfgs[i].domain_cfg) {
		domain_cfgs[i].domain_cfg->image_info = &domain_cfgs[i];
		i++;
	}

exit_err:
	return ret;
}
