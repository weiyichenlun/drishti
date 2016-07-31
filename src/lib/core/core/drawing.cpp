/*!
  @file   drawing.cpp
  @author David Hirvonen
  @brief  Implementation of simple drawing routines.

  \copyright Copyright 2014-2016 Elucideye, Inc. All rights reserved.
  \license{This project is released under the 3 Clause BSD License.}

*/

#include "drawing.h"
#include "drishti_core.h"
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/imgproc/imgproc_c.h>

DRISHTI_CORE_BEGIN

void quiver(cv::Mat3b &canvas, const cv::Mat1f &dx, const cv::Mat1f &dy, int step, float scale, const cv::Mat1b &mask)
{
    for(int y = 0; y < canvas.rows; y += step)
    {
        for(int x = 0; x < canvas.cols; x += step)
        {
            if(!mask.empty() && !mask(y,x))
            {
                continue;
            }

            cv::circle(canvas, cv::Point(x,y), 1, CV_RGB(0,255,255), -1, CV_AA);
            cv::Point v(int(dx(y,x) * scale), int(dy(y,x) * scale));
            cv::arrowedLine(canvas, cv::Point(x, y), cv::Point(x,y)+v, CV_RGB(0,255,0), 1, CV_AA);
        }
    }
}

DRISHTI_CORE_END
