/*!
  @file   Sensor.h
  @author David Hirvonen

  @brief  Implementation of a simple sensor/camera abstraction.

  \copyright Copyright 2014-2016 Elucideye, Inc. All rights reserved.
  \license{This project is released under the 3 Clause BSD License.}

*/

#ifndef drishtisdk_Sensor_h
#define drishtisdk_Sensor_h

#include "sensor/drishti_sensor.h"

#include <opencv2/core/core.hpp>

#include <array>

_SENSOR_BEGIN

inline float microToMeters(float microns)
{
    return microns * 1e6f;
}

struct SensorModel
{
    // ### Intrisnic camera parameters:
    struct Intrinsic
    {
        Intrinsic();
        Intrinsic(const cv::Point2f &c, float fx, const cv::Size &size);
        cv::Matx33f getK() const;
        cv::Point3f getDepth(const std::array<cv::Point2f,2> &pixels, float widthMeters) const;

        // Note: Default parameters for iPhone 5s front facing "Photo" mode
        cv::Size m_size = {640, 852};
        cv::Point2f m_c = {320.f, 426.f};
        float m_fx = 768.0;
        float m_pixelSize = 0.0;
    };

    // ### Extrinsic camera parameters:
    struct Extrinsic
    {
        cv::Matx33f R;
    };

    SensorModel() {} // init with defaults
    SensorModel(const Intrinsic &intrinsic) : m_intrinsic(intrinsic) {}
    SensorModel(const Intrinsic &intrinsic, const Extrinsic &extrinsic) : m_intrinsic(intrinsic), m_extrinsic(extrinsic) {}

    const Intrinsic &intrinsic() const
    {
        return m_intrinsic;
    }
    const Extrinsic &extrinsic() const
    {
        return m_extrinsic;
    }

protected:

    Intrinsic m_intrinsic;
    Extrinsic m_extrinsic;
};

struct DeviceModel
{
    SensorModel m_sensor;

    std::vector<cv::Point2f> m_points // screen coordinates (wcs/centimeters)
    {
        {-2.0, -3.0},
        {+2.0, -8.0},
        {+2.0, -3.0},
        {-2.0, -8.0}
    };
};


_SENSOR_END

#endif
