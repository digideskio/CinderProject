#pragma once

#include "cinder/app/AppCocoaView.h"

class CinderProjectApp : public cinder::app::AppCocoaView {
  public:
	void				setup();
	void				draw();

	float				mRadius;
	cinder::Colorf		mColor;
};
