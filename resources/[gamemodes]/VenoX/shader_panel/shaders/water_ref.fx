// Author: Ren712/AngerMAN
// Water_refract 2

texture sReflectionTexture;
texture sRandomTexture;
float4 sWaterColor = float4(90 / 255.0, 170 / 255.0, 170 / 255.0, 240 / 255.0 );
float gBuffAlpha = 0.26;
float normalMult =0.5;
float gDepthFactor =0.03f;
#include "mta-helper.fx"
texture gDepthBuffer : DEPTHBUFFER;
matrix gProjectionMainScene : PROJECTION_MAIN_SCENE;

//---------------------------------------------------------------------
//-- Sampler for the main texture (needed for pixel shaders)
//---------------------------------------------------------------------

sampler2D colorMapSampler = sampler_state
{
    Texture = (gTexture0);
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
};

sampler3D RandomSampler = sampler_state
{
   Texture = (sRandomTexture);
   MAGFILTER = LINEAR;
   MINFILTER = LINEAR;
   MIPFILTER = LINEAR;
   MIPMAPLODBIAS = 0.000000;
};

sampler SamplerDepth = sampler_state
{
    Texture     = (gDepthBuffer);
    AddressU    = Clamp;
    AddressV    = Clamp;
};

samplerCUBE ReflectionSampler = sampler_state
{
   Texture = (sReflectionTexture);
   MAGFILTER = LINEAR;
   MINFILTER = LINEAR;
   MIPFILTER = LINEAR;
   MIPMAPLODBIAS = 0.000000;
};


//---------------------------------------------------------------------
//-- Structure of data sent to the vertex shader
//--------------------------------------------------------------------- 
 
 struct VSInput
{
    float4 Position : POSITION; 
    float3 TexCoord : TEXCOORD0;
	float4 Diff : COLOR0;
};

//---------------------------------------------------------------------
//-- Structure of data sent to the pixel shader ( from the vertex shader )
//---------------------------------------------------------------------

struct PSInput
{
    float4 Position : POSITION; 
    float3 TexCoord : TEXCOORD0; 
	float4 Diff : COLOR0;
	float Diffuse : COLOR1;
	float4 SparkleTex : TEXCOORD1;
	float3 WorldPos : TEXCOORD2;
	float DistFade : TEXCOORD3;
	float3 TexCoord1 : TEXCOORD4;
};

//-----------------------------------------------------------------------------
//-- VertexShader
//-----------------------------------------------------------------------------
PSInput VertexShaderSB(VSInput VS)
{
    PSInput PS = (PSInput)0;
 
    // Position in screen space.
	PS.Position = mul(float4(VS.Position.xyz , 1.0), gWorldViewProjection);
	float4 pPos = mul(VS.Position, gWorldViewProjection); 
    // compute the eye vector 
	PS.TexCoord.x = (0.5 * (pPos.w + pPos.x));
	PS.TexCoord.y = (0.5 * (pPos.w - pPos.y));
	PS.TexCoord.z = pPos.w;
	// pass texture coordinates for fetching the normal map
	PS.TexCoord1=VS.TexCoord;
	// Convert regular water color to what we want
    float4 waterColorBase = float4(90 / 255.0, 170 / 255.0, 170 / 255.0, 240 / 255.0 );
    float4 conv           = float4(30 / 255.0,  58 / 255.0,  58 / 255.0, 200 / 255.0 );
    PS.Diff = saturate( sWaterColor * conv / waterColorBase );
	
	// Set information to do calculations in pixel shader
    PS.WorldPos = MTACalcWorldPosition( VS.Position.xyz );

    // Scroll noise texture
    float2 uvpos1 = 0;
    float2 uvpos2 = 0;

    uvpos1.x = sin(gTime/40);
    uvpos1.y = fmod(gTime/50,1);

    uvpos2.x = fmod(gTime/10,1);
    uvpos2.y = sin(gTime/12);

    PS.SparkleTex.x = PS.WorldPos.x / 6 + uvpos1.x;
    PS.SparkleTex.y = PS.WorldPos.y / 6 + uvpos1.y;
    PS.SparkleTex.z = PS.WorldPos.x / 10 + uvpos2.x;
    PS.SparkleTex.w = PS.WorldPos.y / 10 + uvpos2.y;
	
	// Calculate GTA lighting for buildings
    PS.Diffuse =MTACalcGTABuildingDiffuse( VS.Diff );

 	float DistanceFromCamera = MTACalcCameraDistance( gCameraPosition,MTACalcWorldPosition( VS.Position.xyz ) );
    PS.DistFade = MTAUnlerp ( 580, 0, DistanceFromCamera );
 
    return PS;
}
 //-----------------------------------------------------------------------------
//-- Get value from the depth buffer
//-- Uses define set at compile time to handle RAWZ special case (which will use up a few more slots)
//-----------------------------------------------------------------------------
float FetchDepthBufferValue( float2 uv )
{
    float4 texel = tex2D(SamplerDepth, uv);
#if IS_DEPTHBUFFER_RAWZ
    float3 rawval = floor(255.0 * texel.arg + 0.5);
    float3 valueScaler = float3(0.996093809371817670572857294849, 0.0038909914428586627756752238080039, 1.5199185323666651467481343000015e-5);
    return dot(rawval, valueScaler / 255.0);
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
//-----------------------------------------------------------------------------
//-- PixelShader
//-----------------------------------------------------------------------------
float4 PixelShaderSB(PSInput PS) : COLOR0
{
    float brightnessFactor = 0.20;

    // Get the surface normal
    float3 vNormal = float3(0,0,1);

    float3 vFlakesNormal = tex3D(RandomSampler, float3(PS.SparkleTex.xy,1)).rgb;
    float3 vFlakesNormal2 = tex3D(RandomSampler, float3(PS.SparkleTex.zw,2)).rgb;
	
    vFlakesNormal = (vFlakesNormal + vFlakesNormal2 ) /2 ;
    vFlakesNormal = 2 * vFlakesNormal-1.0;
    float3 vNp2 = ( vFlakesNormal + vNormal) ;
	float3 projcoord = float3((PS.TexCoord.xy / PS.TexCoord.z),0) ;
	float2 lookup = projcoord.xy;

	lookup.x+=0.0225;
	
	lookup+=vNp2.xy*normalMult;
	lookup.x-=1.00*normalMult;
	lookup.x-=0.0179*(1-normalMult);

	float BufferValue=(Linearize(FetchDepthBufferValue(lookup))*gDepthFactor);
	
	float4 texel=tex2D(colorMapSampler,PS.TexCoord1.xy);
	texel.a=(texel.r+texel.g+texel.b)/3;
	BufferValue*=texel.a*2;

	float Buff =saturate(BufferValue*PS.Diff);
	
	float3 vView = normalize( gCameraPosition - PS.WorldPos );
	float3 vNormalWorld = float3(0,0,1);
	float fNdotV = saturate(dot( vNormalWorld, vView));
	float3 vReflection = 2 * vNormalWorld * fNdotV - vView;
    vReflection += vNp2;
	vReflection +=texel.rgb;
	float4 envMap = texCUBE( ReflectionSampler, vReflection );
    envMap.rgb = pow(envMap.rgb,1-Buff);
	float4 reflection=envMap+saturate(Buff)*gBuffAlpha;
	reflection.rgb*=reflection.a;
	reflection.rgb*= brightnessFactor;
    reflection *=saturate(PS.DistFade);
	reflection *=pow(PS.Diffuse,0.3)/2;
	
	float4 finalColor = 1;
    finalColor = saturate(reflection + PS.Diff * 0.5);
    finalColor += reflection * PS.Diff;
    finalColor.a = PS.Diff.a;

    return finalColor;
	
}


////////////////////////////////////////////////////////////
//////////////////////////////// TECHNIQUES ////////////////
////////////////////////////////////////////////////////////
technique Water_refract_2
{
    pass P0
    {
        VertexShader = compile vs_2_0 VertexShaderSB();
        PixelShader = compile ps_2_0 PixelShaderSB();
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
