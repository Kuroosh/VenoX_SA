//
// dBlurV.fx
// DoF blur PS by Ren712
//

//---------------------------------------------------------------------
// blurV settings
//---------------------------------------------------------------------
texture sTex0 : TEX0;
float gDepthFactor = 0.002;
float blurDiv = 5.2;
float gblurFactor =0.0022;

//---------------------------------------------------------------------
// Include some common stuff
//---------------------------------------------------------------------
#include "mta-helper.fx"
texture gDepthBuffer : DEPTHBUFFER;
matrix gProjectionMainScene : PROJECTION_MAIN_SCENE;

sampler SamplerDepth = sampler_state
{
    Texture     = (gDepthBuffer);
    AddressU    = Clamp;
    AddressV    = Clamp;
};

//---------------------------------------------------------------------
// Sampler for the main texture
//---------------------------------------------------------------------
sampler2D Sampler0 = sampler_state
{
    Texture         = (sTex0);
    MinFilter       = Linear;
    MagFilter       = Linear;
    MipFilter       = Linear;
};

//---------------------------------------------------------------------
// Structure of data sent to the vertex shader
//---------------------------------------------------------------------
struct VSInput
{
    float3 Position : POSITION0;
    float4 Diffuse : COLOR0;
    float2 TexCoord : TEXCOORD0;
};

//---------------------------------------------------------------------
// Structure of data sent to the pixel shader ( from the vertex shader )
//---------------------------------------------------------------------
struct PSInput
{
    float4 Position : POSITION0;
    float4 Diffuse : COLOR0;
    float2 TexCoord: TEXCOORD0;
};

//-----------------------------------------------------------------------------
//-- Get value from the depth buffer
//-- Uses define set at compile time to handle RAWZ special case (which will use up a few more slots)
//-----------------------------------------------------------------------------
float FetchDepthBufferValue( float2 uv )
{
    float4 texel = tex2D(SamplerDepth, uv);
#if IS_DEPTHBUFFER_RAWZ
    float3 rawval = floor(255.0 * texel.arg + 0.5);
    return dot(rawval, ValueScaler / 255.0);
#else
    return texel.r;
#endif
}
 
//-----------------------------------------------------------------------------
//-- Use the last scene projecion matrix to linearize the depth value a bit more
//-----------------------------------------------------------------------------
float Linearize(float posZ)
{
    return gProjectionMainScene[3][2] / (posZ - gProjectionMainScene[2][2]);
}

//------------------------------------------------------------------------------------------
// VertexShaderFunction
//  1. Read from VS structure
//  2. Process
//  3. Write to PS structure
//------------------------------------------------------------------------------------------
PSInput VertexShaderFunction(VSInput VS)
{
    PSInput PS = (PSInput)0;

    // Calculate screen pos of vertex
    PS.Position = MTACalcScreenPosition ( VS.Position );

    // Pass through color and tex coord
    PS.Diffuse = VS.Diffuse;
    PS.TexCoord = VS.TexCoord;

    return PS;
}

//------------------------------------------------------------------------------------------
// PixelShaderFunction
//  1. Read from PS structure
//  2. Process
//  3. Return pixel color
//------------------------------------------------------------------------------------------
float4 PixelShaderFunction(PSInput PS) : COLOR0
{
    float BufferValue = FetchDepthBufferValue( PS.TexCoord.xy );
	//if (BufferValue>1) {BufferValue=0;} 
	float Depth = Linearize( BufferValue );
    //-- Multiply Depth to get the spread you want

   	float4 Color = tex2D(Sampler0, PS.TexCoord);
	float4 Texel = Color;

	Color += tex2D(Sampler0, float2(PS.TexCoord.x-(gblurFactor*1), PS.TexCoord.y)) * 0.8;
	Color += tex2D(Sampler0, float2(PS.TexCoord.x+(gblurFactor*1), PS.TexCoord.y)) * 0.8;

	Color += tex2D(Sampler0, float2(PS.TexCoord.x-(gblurFactor*2), PS.TexCoord.y)) * 0.65;
	Color += tex2D(Sampler0, float2(PS.TexCoord.x+(gblurFactor*2), PS.TexCoord.y)) * 0.65;

	Color += tex2D(Sampler0, float2(PS.TexCoord.x-(gblurFactor*3), PS.TexCoord.y)) * 0.4;
	Color += tex2D(Sampler0, float2(PS.TexCoord.x+(gblurFactor*3), PS.TexCoord.y)) * 0.4;

	Color += tex2D(Sampler0, float2(PS.TexCoord.x-(gblurFactor*4), PS.TexCoord.y)) * 0.25;
	Color += tex2D(Sampler0, float2(PS.TexCoord.x+(gblurFactor*4), PS.TexCoord.y)) * 0.25;
	Color /= blurDiv;
	Depth*= gDepthFactor;
	if (Depth>1) {Depth=1;}
	float4 outPut=lerp(Texel,Color,Depth);
    return outPut;
}

//------------------------------------------------------------------------------------------
// Techniques
//------------------------------------------------------------------------------------------
technique depth_blurv
{
    pass P0
    {
        VertexShader = compile vs_2_0 VertexShaderFunction();
        PixelShader  = compile ps_2_0 PixelShaderFunction();
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
