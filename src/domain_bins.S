/*
 * Copyright (c) 2023 EPAM Systems
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <zephyr/toolchain.h>

/* DomD binary from include/ dir */
.section .data.domd_img,"a"

GDATA(__img_domd_start_0)
GDATA(__img_domd_end_0)

__img_domd_start_0:
.incbin		CONFIG_DOM_CFG_DOMD_IMAGE_BIN_FILE
__img_domd_end_0:

/* DomD dtb from include/ dir */
.section .data.dtb_domd,"a"

GDATA(__dtb_domd_start_0)
GDATA(__dtb_domd_end_0)

__dtb_domd_start_0:
.incbin		CONFIG_DOM_CFG_DOMD_DTB_BIN_FILE
__dtb_domd_end_0:

#if CONFIG_DOM_CFG_NUMBER > 1
/* DomU binary from include/ dir */
.section .data.domu_img,"a"

GDATA(__img_domu_start_1)
GDATA(__img_domu_end_1)

__img_domu_start_1:
.incbin		CONFIG_DOM_CFG_DOMU1_IMAGE_BIN_FILE
__img_domu_end_1:

/* DomD dtb from include/ dir */
.section .data.dtb_domu,"a"

GDATA(__dtb_domu_start_1)
GDATA(__dtb_domu_end_1)

__dtb_domu_start_1:
.incbin		CONFIG_DOM_CFG_DOMU1_DTB_BIN_FILE
__dtb_domu_end_1:
#endif
