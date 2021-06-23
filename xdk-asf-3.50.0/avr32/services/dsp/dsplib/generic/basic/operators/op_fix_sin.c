/*****************************************************************************
 *
 * \file
 *
 * \brief 16-bit and 32-bit fixed-point sine functions or the AVR32 UC3
 *
 * Copyright (c) 2014-2018 Microchip Technology Inc. and its subsidiaries.
 *
 * \asf_license_start
 *
 * \page License
 *
 * Subject to your compliance with these terms, you may use Microchip
 * software and any derivatives exclusively with Microchip products.
 * It is your responsibility to comply with third party license terms applicable
 * to your use of third party software (including open source software) that
 * may accompany Microchip software.
 *
 * THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES,
 * WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE,
 * INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY,
 * AND FITNESS FOR A PARTICULAR PURPOSE. IN NO EVENT WILL MICROCHIP BE
 * LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL OR CONSEQUENTIAL
 * LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND WHATSOEVER RELATED TO THE
 * SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS BEEN ADVISED OF THE
 * POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.  TO THE FULLEST EXTENT
 * ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN ANY WAY
 * RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
 * THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
 *
 * \asf_license_stop
 *
 ******************************************************************************/
/*
 * Support and FAQ: visit <a href="https://www.microchip.com/support/">Microchip Support</a>
 */


#include "dsp.h"

#if defined(FORCE_ALL_GENERICS) || \
    defined(FORCE_GENERIC_OP16_SIN) || \
    !defined(TARGET_SPECIFIC_OP16_SIN)

#define DSP16_MODULO_1_MASK  (((U16) -1) >> (16 - (DSP16_QB+1)))

extern dsp16_t dsp16_op_kernel_cosfix(dsp16_t angle);
extern dsp16_t dsp16_op_kernel_sinfix(dsp16_t angle);

/*
 *  Input range = [-1; 1] corresponding to [-pi; pi]
 */
dsp16_t dsp16_op_sin(dsp16_t angle)
{
#if DSP16_QA > 1
  U16 n = ((angle + DSP16_Q(0.25)) & DSP16_MODULO_1_MASK) >> (DSP16_QB-1);
#else
  U16 n = ((U16) (angle + DSP16_Q(0.25))) >> (DSP16_QB-1);
#endif

    // Translate input down to +/- pi/4
  angle -= n*DSP16_Q(0.5);

#if DSP16_QA > 1
    // angle modulo 1 (signed values)
  angle <<= (16 - (DSP16_QB+1));
  angle >>= (16 - (DSP16_QB+1));
#endif

  switch(n)
    {
  case 0:
      return dsp16_op_kernel_sinfix(angle);
  case 1:
      return dsp16_op_kernel_cosfix(angle);
  case 2:
      return -dsp16_op_kernel_sinfix(angle);
  default:
      return -dsp16_op_kernel_cosfix(angle);
    }
}

#endif

#if defined(FORCE_ALL_GENERICS) || \
    defined(FORCE_GENERIC_OP32_SIN) || \
    !defined(TARGET_SPECIFIC_OP32_SIN)

#define DSP32_MODULO_1_MASK  (((U32) -1) >> (32 - (DSP32_QB+1)))

extern dsp32_t dsp32_op_kernel_cosfix(dsp32_t angle);
extern dsp32_t dsp32_op_kernel_sinfix(dsp32_t angle);

/*
 *  Input range = [-1; 1] corresponding to [-pi; pi]
 */
dsp32_t dsp32_op_sin(dsp32_t angle)
{
#if DSP32_QA > 1
  U32 n = ((angle + DSP32_Q(0.25)) & DSP32_MODULO_1_MASK) >> (DSP32_QB-1);
#else
  U32 n = DSP32_Q(0.25);
  n += angle;
  n = n >> (DSP32_QB-1);
#endif

  // Translate input down to +/- pi/4
  angle -= n*DSP32_Q(0.5);

#if DSP32_QA > 1
  // angle modulo 1 (signed values)
  angle <<= (32 - (DSP32_QB + 1));
  angle >>= (32 - (DSP32_QB + 1));
#endif

  switch(n)
    {
  case 0:
      return dsp32_op_kernel_sinfix(angle);
  case 1:
      return dsp32_op_kernel_cosfix(angle);
  case 2:
      return -dsp32_op_kernel_sinfix(angle);
  default:
      return -dsp32_op_kernel_cosfix(angle);
    }
}

#endif
