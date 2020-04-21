//
// bloom_combine.fx
//


//---------------------------------------------------------------------
// Settings
//---------------------------------------------------------------------
float sBloomIntensity = 0.5;
float sBloomSaturation = 0.5;
float sBaseIntensity = 0.5;
float sBaseSaturation = 0.5;
texture sBaseTexture;
texture sBloomTexture;

//---------------------------------------------------------------------
// Include some common stuff
//---------------------------------------------------------------------
#include "mta-helper.fx"


//---------------------------------------------------------------------
// Sampler for the main texture
//---------------------------------------------------------------------
sampler BaseSampler = sampler_state
{
    Texture = (sBaseTexture);
};

//---------------------------------------------------------------------
// Sampler for the other texture
//---------------------------------------------------------------------
sampler BloomSampler = sampler_state
{
    Texture = (sBloomTexture);
};


//---------------------------------------------------------------------
// Helper for modifying the saturation of a color.
//---------------------------------------------------------------------
float4 AdjustSaturation(float4 color, float saturation)
{
    // The constants 0.3, 0.59, and 0.11 are chosen because the
    // human eye is more sensitive to green light, an