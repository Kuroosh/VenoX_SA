//
// contrast.fx
//


//---------------------------------------------------------------------
// Settings
//---------------------------------------------------------------------

texture sBaseTexture;
texture sLumTexture;
//---------------------------------------------------------------------
// Include some common stuff
//---------------------------------------------------------------------
#include "mta-helper.fx"


//---------------------------------------------------------------------
// Sampler for the main texture
//---------------------------------------------------------------------
sampler Sampler0 = sampler_state
{
    Texture = (sBaseTexture);
};

sampler Sampler1 = sampler_state
{
    Texture = (sLumTexture);
};

//---------------------------------------------------------------------
// Structure of data sent to the pixel shader ( from the vertex shader )
//---------------------------------------------------------------------
struct PSInput
{
  float4 Position : POSITION0;
  float4 Diffuse : COLOR0;
  float2 TexCoord : TEXCOORD0;
};


//------------------------------------------------------------------------------------------
// PixelShaderFunction
//  1. Read from PS structure
//  2. Process
//  3. Return pixel color
//------------------------------------------------------------------------------------------
float4 PixelShaderFunction(PSInput PS) : COLOR0
{
    // Get texture pixel
    float4 pixelColor = tex2D(Sampler0, PS.TexCoord);
    float4 lumColor = tex2D(Sampler1, PS.TexCoord);
	pixelColor.rgb=(pixelColor.rgb+lumColor.rgb)/2;	

    return saturate(pixelColor);
}


//------------------------------------------------------------------------------------------
// Techniques
//------------------------------------------------------------------------------------------
technique tec0
{
    pass P0
    {
        PixelShader = compile ps_2_0 PixelShaderFunction();
    }
}

// Fallback
technique fallback
{
    pass P0
    {
        // Just draw normally
    }
}
