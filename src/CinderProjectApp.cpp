#include "CinderProjectApp.h"
#include "cinder/gl/gl.h"

using namespace ci;
using namespace ci::app;

void CinderProjectApp::setup()
{
	mRadius = 50;
	mColor = Color( 1.0f, 0.5f, 0.25f );
}

void CinderProjectApp::draw()
{
	gl::clear();
	
	gl::color( mColor );
	gl::drawSolidCircle( getWindowCenter(), mRadius );
}
